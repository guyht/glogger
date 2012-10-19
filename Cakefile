
fs = require 'fs'
{print} = require 'sys'
{spawn} = require 'child_process'


task 'build', 'Build project', ->
    run 'coffee', ['-c', '-o', 'lib', 'src']

task 'watch', 'Compile files on changes', ->
    run 'coffee', ['-w', '-c', '-o', 'lib', 'src']

task 'test', 'Run tests', ->
    invoke 'build'

    print 'Compiling test cases'
    run 'coffee', ['-c', 'test/*']

    print 'Running tests'
    run 'node', ['test/test.js']


run = (cmd, args) ->
    r = spawn cmd, args

    r.stderr.on 'data', (data) ->
        process.stderr.write data.toString()

    r.stdout.on 'data', (data) ->
        print data.toString()
