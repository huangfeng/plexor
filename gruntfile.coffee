module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    watch:
      src:
        files: ['src/**/*.coffee']
        tasks: ['coffee']

    coffee:
      src:
        expand: true
        options:
          bare: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'lib'
        ext: '.js'

  require('load-grunt-tasks') grunt

  grunt.option 'force', true

  grunt.registerTask 'default', ['coffee', 'watch']
