import { RubyApplication } from 'bormashino'
import rubyWasm from 'url:../tmp/ruby.wasm'

const main = async () => {
  const target = document.querySelector('#bormashino-application')
  target.innerHTML = 'loading...'

  try {
    const vm = await RubyApplication.initVm(rubyWasm, [
      'ruby.wasm',
      '-I/stub',
      '-I/gem/lib',
      '-EUTF-8',
      '-e_=0',
    ])

    vm.printVersion()
    vm.eval(`require_relative '/src/bootstrap.rb'`)

    const currentPath = () => location.href.replace(location.origin, '')
    RubyApplication.request('get', currentPath())
    RubyApplication.mount()

    window.bormashino = RubyApplication
  } catch (e) {
    target.innerHTML = 'error!'
    console.log(e)
  }
}

main()
