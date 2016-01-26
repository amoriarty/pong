Config = require "./configuration.json"
Server = require "./src/Server.class"

app = new Server "#{Config.path}/views/pong.html"
app.addStatic "client"
app.addStatic "css"
app.addStatic "img"
app.listen 4242, "Server ready !"
