

function add_padding_modal() {
	$('#enter_form').modal('hide'); 
	
	 //$("body").addClass("modal-open");
}
function js_resize(){
	if ($("body").width() > 992) {
		$(".upload_style").css("width", ($(".raitings_cont").width() - 60 -  $(".background_white").width()- 8)+"px");
		
		
		$("#slideshow0.owl-carousel .owl-buttons .owl-prev").css("left", ((($("body").width() - $("header .container").width()) / 2) ) + "px");
		
		$("#slideshow0.owl-carousel .owl-buttons .owl-next").css("right", ((($("body").width() - $("header .container").width()) / 2) ) + "px");
		$("#slideshow0.owl-carousel .owl-buttons .owl-prev, #slideshow0.owl-carousel .owl-buttons .owl-next").css("opacity", "1");
		
	} else {
		$(".upload_style").css("width","100%");
	}
}

$(window).resize(function(){
	js_resize();
});

$(document).on("change",".photo_file", function(){
	$("#image_file").val(document.getElementById('photo_file_val').files[0].name);
});


	if ($("html[lang='en']").length>0) {
		var error_text = "Error";
	}else {
		var error_text = "Упс...";
	}

	if ($("html[lang='en']").length>0) {
		var success_text = "Success";
	}else {
		var success_text = "Успешно";
	}

	if ($("html[lang='en']").length>0) {
		var email_text = "You have entered the incorrect e-mail";
	}else {
		var email_text = "Вы ввели некорректный е-mail";
	}

	if ($("html[lang='en']").length>0) {
		var add_product_text = "Product added to cart";
	}else {
		var add_product_text = "Товар добавлен в корзину";
	}


	if ($("html[lang='en']").length>0) {
		var error_pass = "You not entered a password";
	}else {
		var error_pass = "Вы не ввели пароль";
	}

	if ($("html[lang='en']").length>0) {
		var date_start = "You have not entered the start date of the tour";
	}else {
		var date_start = "Вы не ввели дату начала тура";
	}

	if ($("html[lang='en']").length>0) {
		var date_end = "You have not entered the end of the tour dates";
	}else {
		var date_end = "Вы не ввели дату конца тура";
	}

	if ($("html[lang='en']").length>0) {
		var call_back = "We will contact you shortly";
	}else {
		var call_back = "Мы свяжемся с вами в ближайшее время";
	}

	if ($("html[lang='en']").length>0) {
		var call_back = "We will contact you shortly";
	}else {
		var call_back = "Мы свяжемся с вами в ближайшее время";
	}

	if ($("html[lang='en']").length>0) {
		var error_text_2 = "Error has occurred, please try again";
	}else {
		var error_text_2 = "Произошла ошибка, попробуйте еще раз";
	}

	if ($("html[lang='en']").length>0) {
		var error_name = "You did not fill in your name";
	}else {
		var error_name = "Вы не заполнили как вас зовут";
	}

	if ($("html[lang='en']").length>0) {
		var error_phone = "You did not fill in your phone";
	}else {
		var error_phone = "Вы не заполнили ваш телефон";
	}

	if ($("html[lang='en']").length>0) {
		var error_text_pass = "Login or password is incorrect";
	}else {
		var error_text_pass = "Логин или пароль неправильны";
	}

	if ($("html[lang='en']").length>0) {
		var forgot_succcess = "We send you a password by e-mail";
	} else {
		var forgot_succcess = "Мы выслали вам пароль на почту";
	}

		if ($("html[lang='en']").length>0) {
			var error_file = "You don't upload file";
		} else {
			var error_file = "Вы не загрузили фаил";
		}


  if ($("html[lang='en']").length>0) {
				var forgot_pass = "We have sent your password to your email";
	} else {
				var forgot_pass = "Мы выслали пароль Вам на почту";
	}

	if ($("html[lang='en']").length>0) {
				var error_textarea = "You have not entered the question";
	} else {
				var error_textarea = "Вы не ввели текст вопроса";
	}
	

$(document).ready(function(){
	
	//article img

	 get_article_ready();
	//footer blog link

	if (!$(".footer_blog").length>0) {
		if ($("html[lang='en']").length>0) {
			$("footer .col15-md-5.col-sm-12 .list-unstyled:last-child").append('<li><a href="/index.php?route=blog/blog" class="footer_blog" title="Blog">Blog</a></li>');
		}else {
			$("footer .col15-md-5.col-sm-12 .list-unstyled:last-child").append('<li><a href="/index.php?route=blog/blog" class="footer_blog" title="Блог">Блог</a></li>');
		}
	}

	
	
	
	if ($("html[lang='en']").length>0) {
		$(".lined.top_tow_text").html("Bestsellers");
	}
	
	$("form").submit(function (e) {
		console.log(e.target);
	});
	
	js_resize();
	
	var result;
	
	
$(".btn.shop_tour").on("click", function(e){
		e.stopPropagation(); 
	  e.preventDefault();
			
		if ($("#contact_name").val()==="") {
			sweetAlert(error_text, error_name, "error");
			return;
		}	
		
		if ($("#contact_phone").val()==="") {
			sweetAlert(error_text, error_phone, "error");
			return;
		}
	
		var email = $("#contact_mail").val();
	
		if(!isValidEmailAddress(email)) {
			sweetAlert(error_text, email_text, "error");
			return;
	 	}
	
		if ($("#date_start").val()==="") {
			sweetAlert(error_text, date_start, "error");
			return;
		}
	
	if ($("#date_end").val()==="") {
			sweetAlert(error_text, date_end, "error");
			return;
		}
	
	
	
		if ($("#contact_text").val()==="") {
			sweetAlert(error_text, error_textarea, "error");
			return;
		}

		var formData = new FormData();
		
		formData.append("name", $("#contact_name").val());
	
		formData.append("phone", $("#contact_phone").val());
	
		formData.append("date_start", $("#date_start").val());
	
		formData.append("date_end", $("#date_end").val());
	
		formData.append("mail", $("#contact_mail").val());
	
		formData.append("text", $("#contact_text").val());
		
	
		jQuery.ajax({
			url: "/index.php?route=api/contacts/shoptour",
			data: formData,
			cache: false,
			contentType: false,
			processData: false,
			type: 'POST',
			success: function(data) {
				if (data=="ok") {
						sweetAlert(success_text, call_back, "success");
				}else{
					sweetAlert(error_text, error_text_2, "error");
				}
				
			},
			error: function(data){
					sweetAlert(error_text, error_text_2, "error");
			}
		});
});
	
//Отправка со страницы контактов
	
$(".contact_send.btn").on("click", function(e){
		e.stopPropagation(); 
	  e.preventDefault();
			
		
		if ($("#contact_name").val()==="") {
			sweetAlert(error_text, error_name, "error");
			return;
		}	
		
		if ($("#contact_phone").val()==="") {
			sweetAlert(error_text, error_phone, "error");
			return;
		}
	
		var email = $("#contact_mail").val();
	
		if(!isValidEmailAddress(email)) {
			sweetAlert(error_text, email_text, "error");
			return;
	 	}
	
	
		if ($("#contact_text").val()==="") {
			sweetAlert(error_text, error_textarea, "error");
			return;
		}

		var formData = new FormData();
		
		formData.append("name", $("#contact_name").val());
	
		formData.append("phone", $("#contact_phone").val());
	
		formData.append("mail", $("#contact_mail").val());
	
		formData.append("text", $("#contact_text").val());
		
	
		jQuery.ajax({
			url: "/index.php?route=api/contacts",
			data: formData,
			cache: false,
			contentType: false,
			processData: false,
			type: 'POST',
			success: function(data) {
				if (data=="ok") {
						sweetAlert(success_text, call_back, "success");
				}else{
					sweetAlert(error_text, error_text_2, "error");
				}
				
			},
			error: function(data){
					sweetAlert(error_text, error_text_2, "error");
			}
		});
	
	
});
	
	
//Прожатие ентер в меню
$(document).on("keypress","#search input", function(e){
	
		if (e.keyCode==13) {
				
				e.preventDefault();
				e.stopPropagation();
		
			$("#search button").click();		
		}
		
});	
	

	
//Форма регистрации
$(".call_back.register_form .btn").on("click", function(e){
		
		e.stopPropagation(); 
	  e.preventDefault();
		
		var form = document.forms.send_reg;

		var formData = new FormData();
	
		if (form.firstname.value=="") {
			sweetAlert(error_text, error_name, "error");
			return;
		}	
		
		formData.append("firstname", form.firstname.value);
	
		formData.append("lastname", form.lastname.value);
	
		formData.append("email", form.email.value);
	
		formData.append("telephone", form.telephone.value);
	
		formData.append("fax", form.fax.value);
	
		formData.append("company", form.company.value);
	
		formData.append("address_1", form.address_1.value);
	
		formData.append("address_2", form.address_2.value);
		
		formData.append("city", form.city.value);
	
		formData.append("postcode", form.postcode.value);
	
		formData.append("country_id", form.country_id.value);

		formData.append("zone_id", form.zone_id.value);
	
		formData.append("password", form.password.value);

	
		formData.append("confirm", form.confirm.value);

	
		formData.append("newsletter", form.newsletter.value);
	
		formData.append("agree", form.agree.value);
	
	
		
		jQuery.ajax({
			url: "/index.php?route=api/register",
			data: formData,
			cache: false,
			contentType: false,
			processData: false,
			type: 'POST',
			success: function(data){
			//	window.location.reload();
				console.log(data);
					
				
				if (data=="ok") {
						window.location.reload();
					 return;
				}
				
					result = JSON.parse(data);
				
				 console.log(result);
					
					if (data=="") {
						window.location.reload();
					}else {
						
							for (var p in result) {
								sweetAlert(error_text, result[p], "error");	

							}	
						}
			},
			error: function(data) {
					
					console.log(data);
				
					result = data;
					
					
			}
		});
	
	return false;

	});
	
//Отправка картинки
$(".upload_style .btn").on("click", function(e){
		
		e.stopPropagation(); e.preventDefault();
		
		if ($("#image_name").val()==="") {
			sweetAlert(error_text, error_name, "error");
			return;
		}	
		
		var email = $("#image_email").val();
		
		if(!isValidEmailAddress(email)) {
			sweetAlert(error_text, email_text, "error");
			return;
	 	}
		
		if ($("#image_name").val()==="") {
			sweetAlert(error_text, error_name, "error");
			return;
		}	
		
		if ($("#photo_file_val").val()==="") {
			sweetAlert(error_text, error_file, "error");
			return;
		}	
		
		var form = document.forms.send_file;

		var formData = new FormData();
		
		formData.append("photo", form.photo.files[0]);
		formData.append("email", form.email.value);
		formData.append("name", form.name.value);
		
		jQuery.ajax({
			url: "/index.php?route=api/personalguide",
			data: formData,
			cache: false,
			contentType: false,
			processData: false,
			type: 'POST',
			success: function(data) {
					sweetAlert(success_text, call_back, "success");

					$(".call_back .close_modal").click();
			},
			error: function(data){
					sweetAlert(error_text, error_text_2, "error");
			}
		});

				
	});

//Forgot password
$(document).on("click",".call_back.forgot_password_form .btn.btn-default", function(){
				
				var email = $("#forgot_password_input").val();	
		
				if(!isValidEmailAddress(email)) {
						 		sweetAlert(error_text, email_text, "error");
						    return;
				}
			
				var formData = new FormData();
		
					formData.append("email", $("#forgot_password_input").val());

					jQuery.ajax({
						url: "/index.php?route=api/recoverypass",
						data: formData,
						cache: false,
						contentType: false,
						processData: false,
						type: 'POST',
						success: function(data) {
								console.log(data);
							  if (data=="ok") {
									sweetAlert(success_text, forgot_pass, "success");
									$(".call_back .close_modal").click();
								}else{
										
											sweetAlert(error_text, error_text_pass, "error");	
								}
								
						},
						error: function(data){
							  console.log(data);
								sweetAlert(error_text, error_text_pass, "error");
						}
					});
			
			
			
	});
	
//Call back
$(document).on("click",".call_back.call_back_form .btn.btn-default", function(){
					if ($("#call_back_name").val()==="") {
						sweetAlert(error_text, error_name, "error");
						return;
					}
	
					if ($("#call_back_phone").val()==="") {
						sweetAlert(error_text, error_phone, "error");
						return;
					}

						 $.ajax({
									type: 'POST',
									url: '/index.php?route=api/callback',
									data: {
										name: $("#call_back_name").val(),
										phone: $("#call_back_phone").val()

									},
									success: function(data) {
										sweetAlert(success_text, call_back, "success");
										$(".call_back .close_modal").click();
									},
									error:  function(xhr, str){
												sweetAlert(error_text, error_text_2, "error");
										}
								});						
				});
	
//Вход
$(document).on("click",".call_back.enter_form .btn.btn-default", function(){
				
				var email = $("#enter_form_name").val();	

					 if(!isValidEmailAddress(email)) {
						 		sweetAlert(error_text, email_text, "error");
						    return;
					 }

					if ($("#enter_form_password").val()==="") {
						   sweetAlert(error_text, error_pass, "error");
						   return;
					}

						 $.ajax({
									type: 'POST',
									url: '/index.php?route=api/loginnew',
									data: {
										'email': email,
										'password': $("#enter_form_password").val()

									},
									success: function(data) {
											if (data=="ok") {
												window.location.reload();
					 							return;
											}else {
												sweetAlert(error_text, error_text_pass, "error");
											}
									},
									error:  function(xhr, str){
												sweetAlert(error_text, error_text_pass, "error");
										}
								});						
				});	
	
$(".phone").mask("+7(999) 999-99-99");


//Subscribe form
$(document).on("click", ".subscribe_form .btn", function(e){
	e.preventDefault();
	$(".subscribe_form .btn").removeClass("active");
	$(this).addClass("active");
});
	
$(document).on("click",".clear_trash", function(){
	cart.removeAll();
});
				
	$(document).on("keypress", ".subscribe_form input", function(e){
							var email = $(".subscribe_form input").val();	
							if (e.keyCode==13) {
									
								e.preventDefault(); e.stopPropagation();
									if(isValidEmailAddress(email)) {
										
										$('.subscribe_form form')[0].setAttribute("action", $(".subscribe_form .active").data("url"));
										$('.subscribe_form form')[0].setAttribute("method", "POST");
										$('.subscribe_form form')[0].setAttribute("target", "_blank");
										$(".subscribe_form form")[0].submit();
										
									}else{
										
										sweetAlert(error_text, email_text, "error");
									}
								}
						});
});


function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return pattern.test(emailAddress);
}




jQuery(document).ready(function ($) {
    'use strict';
    // CENTERED MODALS
    // phase one - store every dialog's height
    $('.modal').each(function () {
        var t = $(this),
            d = t.find('.modal-dialog'),
            fadeClass = (t.is('.fade') ? 'fade' : '');
        // render dialog
        t.removeClass('fade')
            .addClass('invisible')
            .css('display', 'block');
        // read and store dialog height
        d.data('height', d.height());
        // hide dialog again
        t.css('display', '')
            .removeClass('invisible')
            .addClass(fadeClass);
    });
    // phase two - set margin-top on every dialog show
    $('.modal').on('show.bs.modal', function () {
        var t = $(this),
            d = t.find('.modal-dialog'),
            dh = d.data('height'),
            w = $(window).width(),
            h = $(window).height();
        // if it is desktop & dialog is lower than viewport
        // (set your own values)
        if (w > 380 && (dh + 60) < h) {
            d.css('margin-top', Math.round(0.96 * (h - dh) / 2));
        } else {
            d.css('margin-top', '');
        }
    });

});



/*Old functions*/

function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	} else { 			// Изменения для seo_url от Русской сборки OpenCart 2x
		var query = String(document.location.pathname).split('/');
		if (query[query.length - 1] == 'cart') value['route'] = 'checkout/cart';
		if (query[query.length - 1] == 'checkout') value['route'] = 'checkout/checkout';
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

$(document).ready(function() {
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();

		//$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		$('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	})
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					//$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					// Need to set timeout otherwise it wont update the total
					
					sweetAlert(success_text, add_product_text, "success");
												
					
					setTimeout(function () {
						//$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					}, 100);
					
					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart').load('index.php?route=common/cart/info ');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'removeAll': function(){
		$(".cart_close_button").click();
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			
			
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					//$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart').load('index.php?route=common/cart/info ');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart').load('index.php?route=common/cart/info ');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#compare-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			$.extend(this, option);

			$(this).attr('autocomplete', 'off');

			// Focus
			$(this).on('focus', function() {
				this.request();
			});

			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $(this).position();

				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});

				$(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$(this).siblings('ul.dropdown-menu').html(html);
			}

			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

		});
	}
})(window.jQuery);



function get_article_ready() {
	$(".article_block").each(function(){
		var src = $(this).find(".article_intro img").attr("src");
		var title = $(this).find("h2 a").text();
		var href_text = $(this).find("h2 a").attr("href");
		console.log(href_text);
		
	
		var text = '<div class="img_block"><a href="'+href_text+'" title="'+title+'"><img class="img-responsive" src="'+src+'" alt='+title+' ></a></div>';


		$(this).prepend(text);
		$(this).find(".article_intro img").remove();

		
	});


	$("#content img").addClass("img-responsive");
	
}