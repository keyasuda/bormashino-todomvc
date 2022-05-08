# bormashino-todomvc

An [Bormaŝino](https://github.com/keyasuda/bormashino) port of [TodoMVC](http://todomvc.com).

## Demo

https://bormashino-todomvc.vercel.app/

## How to run on local

```bash
rbenv install 3.2.0-preview1
git clone https://github.com/keyasuda/bormashino-todomvc.git
cd bormashino-todomvc
bundle install
bundle exec rake bormashino:download
gem install foreman
(cd src && bundle install)
npm i
./bin/dev
```

You can see working TodoMVC on http://localhost:5000/.
