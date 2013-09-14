# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('document').foundation.clearing.js
	$('document').foundation "orbit",
	  timer_speed: 3000
	  pause_on_hover: true
	  slide_number: false
	  bullets: false