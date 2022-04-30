require 'sinatra/base'
require_relative 'todo'

class App < Sinatra::Base
  set :protection, false

  get '/' do
    @todos = Todo.all
    @all_count = @todos.size
    @remaining_count = Todo.incompleted.size

    erb :index
  end

  post '/' do
    unless params['new-todo'].empty?
      todo = Todo.new({
                        'id' => SecureRandom.uuid,
                        'title' => params['new-todo'],
                        'completed' => false,
                      })
      todo.save
    end

    redirect back
  end

  get '/active' do
    @todos = Todo.incompleted
    @all_count = Todo.all.size
    @remaining_count = @todos.size
    erb :index
  end

  get '/completed' do
    @todos = Todo.completed
    @all_count = Todo.all.size
    @remaining_count = Todo.incompleted.size
    erb :index
  end

  put '/todos/all' do
    if params['toggle-all'] == 'true'
      Todo.all.map { |t| t.update('completed' => true) }
    else
      Todo.all.map { |t| t.update('completed' => false) }
    end

    redirect back
  end

  delete '/todos/all' do
    Todo.completed.each(&:destroy)
    redirect back
  end

  put '/todos/:id' do |id|
    todo = Todo.get(id)
    values = params.select { |k, _v| %w[title completed].include?(k) }
    todo.update(values)

    redirect request.referer.split('?').first # クエリパラメータが付きっぱなしだと編集モードのままになってしまうので除去
  end

  delete '/todos/:id' do |id|
    Todo.get(id).destroy
    redirect back
  end
end
