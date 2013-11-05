module.exports = (grunt) ->

  proxyHost = if grunt.option('proxy_host')? then grunt.option('proxy_host') else null

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      compile:
        files:
          "public/js/app.js": [
            "coffee/app.coffee"
          ]
    compass:
      options:
        bundleExec: true
        sassDir: "scss"
        imageDir: "img"
      product:
        options:
          cssDir: "public/css/product"
          noLineComments: true
          outputStyle: "compressed"
      develop:
        options:
          cssDir: "public/css"
          noLineComments: false
          outputStyle: "expanded"

    concat:
      vendorJS:
        src: [
          "bower_components/jquery/jquery.min.js"
          "bower_components/angular/angular.min.js"
        ]
        dest: "public/js/vendor.js"
      template:
        src: [
          "template/header.html"
          "template/controller/**/*.html"
          "template/footer.html"
        ]
        dest: "public/index.html"

    removelogging:
      product:
        src: "public/js/app.js"
        dest: "public/js/app.product.js"

    uglify:
      product:
        files: "public/js/app.product.js": ["public/js/app.product.js"]

    watch:
      options:
        livereload: true
      coffee:
        files: "coffee/**/*.coffee"
        tasks: ["coffee2js"]
      scss:
        files: "scss/**/*.scss"
        tasks: ["compass"]
      template:
        files: "template/**/*.html"
        tasks: ["concat:template"]
    connect:
      server:
        options:
          livereload: true
          port: 9000
          base: "public"
          middleware: (connect, options) ->
            [
              connect.static(options.base)
              require("grunt-connect-proxy/lib/utils").proxyRequest
            ]
      proxies: [
        context: [
          "/users/"
          "/items/"
        ]
        host: if proxyHost? then proxyHost  else "localhost"
        port: if proxyHost? then 80         else 3000
        changeOrigin: true
      ]

  require("matchdep").filterDev("grunt-*").forEach(grunt.loadNpmTasks)

  grunt.registerTask "coffee2js", ["coffee", "removelogging", "uglify"]
  grunt.registerTask "default", ["configureProxies", "connect:server", "watch"]
