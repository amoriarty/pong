"use strict";

jQuery(function ($) {
	var canvas = $("#canvas");
	var play_zone = $("#play_zone");
	var context = canvas.get(0).getContext("2d");

	function full_window() {
		canvas.width(play_zone.width());
		canvas.height(play_zone.height());
	}

	$(window).resize(full_window);
	full_window();
});