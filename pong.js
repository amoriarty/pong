"use strict";
var express = require("express");
var app = express();

app.get("/", function (req, res) {
	res.sendFile(__dirname + "/views/pong.html");
});

app.use("/css", express.static("css"));
app.use("/client", express.static("client"));
app.use("/img", express.static("img"));

app.listen('4242', function () {
	console.log("Listening");
});
