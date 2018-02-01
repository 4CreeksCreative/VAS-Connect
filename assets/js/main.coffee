$(document).on 'click', 'a', (event) ->
	if $.attr(this, 'href') != undefined && $.attr(this, 'href').substring(0, 1) == '#'
		event.preventDefault()
		$('html, body').stop().animate {
			scrollTop: $($.attr(this, 'href')).offset().top-360
			easing: 'swing'
		}, 500
	return
