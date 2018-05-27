var express = require 'express'
var server = express()

server.use(express.static('./build'))

server.get(/.*/) do |req,res|
  var html = <html>
    <head>
      <meta charset="utf-8">
      <meta attr:http-equiv="x-ua-compatible" content="ie=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title> "Conduit"
      # Import Ionicon icons & Google Fonts our Bootstrap theme relies on
      <link href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css">
      <link href="//fonts.googleapis.com/css?family=Titillium+Web:700|Source+Serif+Pro:400,700|Merriweather+Sans:400,700|Source+Sans+Pro:400,300,600,700,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
      # Import the custom Bootstrap 4 theme from our hosted CDN
      <link rel="stylesheet" href="https://demo.productionready.io/main.css">
      <link rel="stylesheet" href="/custom.css">
    <body>
      <script src="/bundle.js">
  
  return res.send html.toString

var port = process:env.PORT or 8080

var server = server.listen(port) do
  console.log 'server is running on port ' + port
