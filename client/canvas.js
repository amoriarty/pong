"use strict";
//TODO FILET
//TODO APPRENDRE A CENTRER LES ELEMENTS (BALLE, FILET ..)

var canvas = CE
	.defines("canvas")
	.extend(Hit)
	.ready(function () {
		canvas.Scene.call("Pong");
	});

canvas.Scene.new({
	name: "Pong",
	materials: {
		images: {
			"bar_full": {
				path: "/img/bar_full.jpg",
				index: 0
			},
			"ball": "/img/ball.png",
			"bar": "/img/bar.png"
		}
	},
	called: function (stage) {
		this.el = this.createElement();
		stage.append(this.el);
	},
	preload: function (stage, pourcent) {
		this.el.drawImage("bar_full", this.getCanvas().width / 2, this.getCanvas().height / 2, pourcent + "%")
	},
	ready: function (stage) {
		var _canvas = this.getCanvas();

		function addEntities(x, y, width, height, color) {
			var entity = Class.New("Entity", [stage]);

			entity.rect(width, height);
			entity.position(x, y);
			entity.el.fillStyle = color;
			entity.el.fillRect(0, 0, width, height);
			stage.append(entity.el);
			return (entity);
		}

		_canvas.setSize("browser");
		stage.empty();
		this.upWall = addEntities(0, 0, _canvas.width, 5, "white");
		this.downWall = addEntities(0, _canvas.height - 5, _canvas.width, 5, "white");
		this.ball = addEntities(
			_canvas.width / 2,
			_canvas.height / 2,
			cross_product(1, 100, _canvas.width),
			cross_product(1, 100, _canvas.height) * 2,
			"yellow");
	},
	render: function (stage) {
		this.ball.move(0, -1);
		this.ball.hit([this.upWall, this.downWall], function (state) {
			if (state == "over") {
				canvas.Scene.call("GameOver");
			}
		});
		stage.refresh();
	}
});

canvas.Scene.new({
	name: "GameOver",
	ready: function (stage) {
		var _canvas = this.getCanvas();
		var text = this.createElement();

		text.font = "20px Arial";
		text.fillStyle = "white";
		text.fillText("GAME OVER !!!", (_canvas.width / 2), (_canvas.height / 2));
		stage.append(text);
	}
});

function cross_product(a, b, c) {
	return (a * c) / b;
}
