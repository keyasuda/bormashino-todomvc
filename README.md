# bormashino-todomvc

[TodoMVC](http://todomvc.com)を[Bormaŝino](https://github.com/keyasuda/bormashino)を用いて移植したものです。

# 実行方法

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

http://localhost:5000/ で TodoMVC が動作します。
