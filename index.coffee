Config = require "./configuration.json"
Server = require "./class/Server.class"

# Server Configuration
app = new Server "#{Config.path}/html/pong.html"
app.addStatic "js"
app.addStatic "css"
app.listen Config.port, "Server ready !"
