# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

	$('form').on 'click', '.add_instructions', (event) ->
	  time = new Date().getTime()
	  regexp = new RegExp($(this).data('id'), 'g')
	  $(this).before($(this).data('fields').replace(regexp, time))
	  if $("input[type='radio']:checked").val() == "filling" || $("input[type='radio']:checked").val() == "frosting"
	  	$('#bake_instructions').hide()
	  $(this).hide()
	  event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
  	time = new Date().getTime()
	  regexp = new RegExp($(this).data('id'), 'g')
	  $(this).before($(this).data('fields').replace(regexp, time))
	  units = $('.measure_unit_id').last().html()
	  newdiv = $(this).prev()
	  newdivunit = $(newdiv).find(".measure_unit_id")
	  nameofunit = $(newdivunit).attr('id')
	  newdivunit.hide()
	  measurename = nameofunit.replace(/unit/, "measure" )
	  ingredientid = nameofunit.replace(/unit/, "ingredient")
	  ingredienttokenid = nameofunit.replace(/unit\_id/, "ingredient\_token")
	  $("##{measurename}").attr("data-placeholder", "Measurement").chosen()
	  $("##{ingredienttokenid}").tokenInput '/ingredients.json',
			theme: 'facebook',
			prePopulate: $('.recipe_ingredient_tokens').data('load'),
			tokenLimit: 1
	  measurediv = $(newdiv).find("##{measurename}")
	  $(measurediv).addClass("measure_id")
	  $('.measure_id').change ->
	    selectedmeasure = $(this).attr('id')
	    newdivunit.show()
	    selectedunitclass = selectedmeasure.replace(/measure/, "unit")
	    measure = $("##{selectedmeasure} :selected").text()
	    escaped_measure = measure.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
	    options = $(units).filter("optgroup[label='#{escaped_measure}']").html()
	    if options
	      $("##{selectedunitclass}").html(options)
	      $("##{selectedunitclass}").parent().show()
	      $("##{selectedunitclass}").addClass("chosen-like")
	    else
	      $("##{selectedunitclass}").empty()
	      $("##{selectedunitclass}").parent().hide()
		  event.preventDefault()
	
	units = $(".measure_unit_id").html()
	$.each $('select'), (key, value) ->
			if (value.id.match(/unit/))
				$("#" + value.id)
			else
				$("#" + value.id)

	$.each $('.inputtoken'), (key, value) ->
		$("#" + value.id).tokenInput '/ingredients.json',
			theme: 'facebook',
			prePopulate: [$("#" + value.id).data('load')[key]],
			tokenLimit: 1

	$('.measure_id').change ->
		selectedmeasure = $(this).attr('id')
		selectedunitclass = selectedmeasure.replace(/measure/, "unit")
		$("##{selectedunitclass}").show()
		measure = $("##{selectedmeasure} :selected").text()
		escaped_measure = measure.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
		options = $(units).filter("optgroup[label='#{escaped_measure}']").html()
		if options
			$("##{selectedunitclass}").html(options)
			$("##{selectedunitclass}").show()
		else
			$("##{selectedunitclass}").empty()
			$("##{selectedunitclass}").hide()

	$("input[type='radio']").change ->
		if $("input[type='radio']:checked").val() == "filling" || $("input[type='radio']:checked").val() == "frosting"
	  	$('#bake_instructions').hide()
	  else
	  	$('#bake_instructions').show()

	$('form').on 'click', 'input[type=range]', (event) ->
		divname= '.' + this.id + ' p:first'
		$(divname).text(this.value)







 
    
		