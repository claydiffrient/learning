module.exports = (grunt) ->
   grunt.initConfig({
      pkg: grunt.file.readJSON 'package.json'
      sass:
         dist:
            options:
               style: 'expanded'
            files:
               expand: true
               cwd: 'styles'
               src: '*.scss'
               dest: '../'
               ext: '.css'
      grunt.loadNpmTasks 'grunt-contrib-sass'
   })