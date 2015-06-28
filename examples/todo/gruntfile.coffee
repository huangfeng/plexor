module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    watch:
      atdd:
        files: ['features/**/*', '../../src/**/*']
        tasks: ['shell:features']

    shell:
      features:
        command: 'cucumber.js -coffee'

  require('load-grunt-tasks') grunt

  grunt.option 'force', true

  grunt.registerTask 'default', ['watch:atdd']
