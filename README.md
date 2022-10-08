# bormashino-todomvc

An [Bormaŝino](https://github.com/keyasuda/bormashino) port of [TodoMVC](http://todomvc.com).

## Demo

https://bormashino-todomvc.vercel.app/

## How to run on local

```bash
git clone https://github.com/keyasuda/bormashino-todomvc.git
cd bormashino-todomvc
cat .ruby-version | rbenv install -
bundle install
gem install foreman
(cd src && bundle install)
npm i
./bin/dev
```

You can see working TodoMVC on http://localhost:5000/.

## Deploy

"Vercel for GitHub" works on this project.
See https://vercel.com/docs/concepts/git/vercel-for-github
