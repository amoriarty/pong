Config = require "./configuration.json"
Server = require "./class/Server.class"

# Server Configuration
app = new Server "#{Config.path}/html/pong.html"
app.addStatic "js"
app.addStatic "img"
app.listen 4242, "Server ready !"
