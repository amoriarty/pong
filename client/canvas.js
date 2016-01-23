"use strict";

var canvas = CE.defines("canvas").ready(function () {
	canvas.Scene.call("Pong");
});

canvas.Scene.new({
	name: "Pong",
	materials: {
		images: {
			"bar": {
				path: "/img/bar_full.jpg",
				index: 0
			},
			"1": "/img/ball.png",
			"2": "/img/bar.png"
		}
	},
	called: function (stage) {
		this.el = this.createElement();
		stage.append(this.el);
	},
	preload: function (stage, pourcent) {
		this.el.drawImage("bar", 0, 0, pourcent + "%")
	},
	ready: function (stage) {
		stage.empty();
		this.player = this.createElement();
		this.player.drawImage("1");
		stage.append(this.player);
	},
	render: function (stage) {
		this.player.x += 1;
		stage.refresh();
	}
});
