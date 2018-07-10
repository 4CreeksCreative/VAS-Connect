$(document).on('scroll', function(){
	if($(document).scrollTop() > 300 && !$('header').hasClass('sticky')){
		$('header').addClass('sticky');
	}
	else if ($(document).scrollTop() < 300 && $('header').hasClass('sticky')){
		$('header').removeClass('sticky');
	}
})
$(document).on('click', '#events .event', function(){
	var event = $(this)
	if (event.hasClass('active')){
		event.removeClass('active').find('.event-description').stop().slideToggle()
	}
	else {
		event.addClass('active').find('.event-description').stop().slideToggle()
	}
})

$(document).on('click', '.show-all', function(){
	$("#"+$(this).attr('id')+"-section").find('.event').toggleClass('active')
	$("#"+$(this).attr('id')+"-section").find('.event-description').stop().slideToggle()
})
$(document).on('click','.toggle-trigger', function(e){
	e.preventDefault()
	$($(this).attr('data-toggle')).slideToggle()
})


$('form.form-email.custom-script').submit(function(e){
	var body          = $('body'),
            thisForm      = $(e.target).closest('form'),
            formAction    = typeof thisForm.attr('action') !== typeof undefined ? thisForm.attr('action') : "",
            submitButton  = thisForm.find('button[type="submit"], input[type="submit"]'),
            error         = 0,
            originalError = thisForm.attr('original-error'),
            captchaUsed   = thisForm.find('div.recaptcha').length ? true:false,
            successRedirect, formError, formSuccess, errorText, successText;

        body.find('.form-error, .form-success').remove();
        submitButton.attr('data-text', submitButton.text());
        errorText = thisForm.attr('data-error') ? thisForm.attr('data-error') : "Please fill all fields correctly";
        successText = thisForm.attr('data-success') ? thisForm.attr('data-success') : "Thanks, we'll be in touch shortly";
        thisForm.append('<div class="form-error" style="display: none;">' + errorText + '</div>');
        thisForm.append('<div class="form-success" style="display: none;">' + successText + '</div>');
        formError = body.find('.form-error');
        formSuccess = body.find('.form-success');
        thisForm.addClass('attempted-submit');


	if (mr.forms.validateFields($(thisForm)) !== 1) return
	else e.preventDefault(); mr.forms.showFormError(formSuccess, formError, 1000, 5000, 500);

})

$(document).on('click', 'a', function(event) {
  if ($.attr(this, 'href') !== void 0 && $.attr(this, 'href').substring(0, 1) === '#') {
    event.preventDefault();
    $('html, body').stop().animate({
      scrollTop: $($.attr(this, 'href')).offset().top - 360,
      easing: 'swing'
    }, 500);
  }
});
