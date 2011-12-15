nakedLoad 'jasmine'
nakedLoad 'jasmine-html'

$ = require 'jquery'
coffeekup = require 'coffeekup'

$('head').append coffeekup.render ->
  link rel: "stylesheet", type: "text/css", href: "static/jasmine.css"

$('body').append coffeekup.render ->
  div id: 'jasmine_runner'
  div id: 'jasmine_content'

jasmineEnv = jasmine.getEnv()
trivialReporter = new jasmine.TrivialReporter(document, 'jasmine_runner')

jasmineEnv.addReporter(trivialReporter)

jasmineEnv.specFilter = (spec) ->
  return trivialReporter.specFilter(spec)

require 'spec-suite'
jasmineEnv.execute()

