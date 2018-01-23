$(document).on('scroll', function(){
	if($(document).scrollTop() > 300 && !$('header').hasClass('sticky')){
		$('header').addClass('sticky');
	}
	else if ($(document).scrollTop() < 300 && $('header').hasClass('sticky')){
		$('header').removeClass('sticky');
	}
})
$(document).on('click', '#events .event .arrow', function(){
	var event = $(this).parents('.event')
	if (event.hasClass('active')){
		event.removeClass('active').find('.event-description').stop().slideToggle()
	}
	else {
		event.addClass('active').find('.event-description').stop().slideToggle()
	}
})
$(document).on('click', '#day2-show', function(){
	$("#day2").find('.event').toggleClass('active')
	$("#day2").find('.event-description').stop().slideToggle()
})
$(document).on('click', '#day1-show', function(){
	$('#day1').find('.event').toggleClass('active')
	$("#day1").find('.event-description').stop().slideToggle()
})
$(document).on('click', '#day3-show', function(){
	$('#day3').find('.event').toggleClass('active')
	$("#day3").find('.event-description').stop().slideToggle()
})
