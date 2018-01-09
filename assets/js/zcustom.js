var agendaOffset = $('#agenda').offset().top
$(document).on('scroll', function(){
	console.log($('#agenda').offset().top)
	if(agendaOffset <= $(document).scrollTop() && !$('#agenda').hasClass('sticky')){
		$('#agenda').addClass('sticky');
	}
	else if (agendaOffset >= $(document).scrollTop() && $('#agenda').hasClass('sticky')){
		$('#agenda').removeClass('sticky');
	}
})
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
		event.removeClass('active').find('.event-description').slideToggle()
	}
	else {
		event.addClass('active').find('.event-description').slideToggle()
	}
	
})
