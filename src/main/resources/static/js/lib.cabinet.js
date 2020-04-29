var CABINET = {

	SETTINGS:{
		pass_eye:true,//показывать глаз на поле пароля
		email_activation:true, //активация email

		//URLS
		//!!!чтоб не нарушился автологин в корзине, надо релоадить
		url_auth_redirect:'/cabinet/', // редирект после авторизации. если false, то будет просто reload
		url_cabinet:'/cabinet/', //фактически дублирует предыдущую настройку
		url_ajax_auth:'/cabinet/login/?ajax',
		url_ajax_reg:'/cabinet/registration/?ajax',
		url_ajax_forgotten_password:'/cabinet/forgotten_password/?ajax',

		//IDENTS
		ident_form_auth:'form.jscabinet-auth',
		ident_form_auth2:'form.jscabinet-auth2',
		ident_form_reg:'form.jscabinet-reg',
		ident_form_forgotten_password:'form.jscabinet-forgotten_password',
		ident_modal_auth:'#modal_bs_auth',
		ident_modal_reg:'#modal_bs_registration',
		ident_modal_forgotten_password:'#modal_bs_forgotten_password',
		ident_error_messages:'._error_messages'
	},
	
	init:function(){
		//при инициализации вставляем в форму данные предыдущей авторизации
		CABINET.remember_auth();
		CABINET.set_bindings();

		if(CABINET.SETTINGS.pass_eye)
			CABINET.pass_eye();
	},

	//метод вытаскивает из куки данные предыдущей авторизации и записывает в форму
	remember_auth:function(){
		setTimeout(function(){
	        $.cookie.json = false;        
	        if($.cookie('ava.cab.l') && $.cookie('ava.cab.p')){
	        	CABINET.pass_eye_block();
	            $(CABINET.SETTINGS.ident_form_auth).find('input[name=identity]').val($.cookie('ava.cab.l'));
	            $(CABINET.SETTINGS.ident_form_auth).find('input[name=password]').val($.cookie('ava.cab.p')); 

	            if($(CABINET.SETTINGS.ident_form_auth2)){
	            	$(CABINET.SETTINGS.ident_form_auth2).find('input[name=identity]').val($.cookie('ava.cab.l'));
	            	$(CABINET.SETTINGS.ident_form_auth2).find('input[name=password]').val($.cookie('ava.cab.p'));
	            }
	                        
	        }
    	},1000);
	},

	//шлем данные авторизации
	send_auth:function(){
		CABINET.form_sender(CABINET.SETTINGS.url_ajax_auth, CABINET.SETTINGS.ident_form_auth, function(data){
			$(CABINET.SETTINGS.ident_form_auth).find(CABINET.SETTINGS.ident_error_messages).html('');
			if(data.ok){	            
	            if(CABINET.SETTINGS.url_auth_redirect)
	            	window.location.href=CABINET.SETTINGS.url_auth_redirect;
	            else
	            	document.location.reload(); 
	        }
	        else{
	             $.each(data.errors,function(i,e){
	                $(CABINET.SETTINGS.ident_form_auth).find(CABINET.SETTINGS.ident_error_messages).append(e+'<br>');
	            });
        	}
		});
	},

	//шлем данные авторизации
	send_auth2:function(){
		CABINET.form_sender(CABINET.SETTINGS.url_ajax_auth, CABINET.SETTINGS.ident_form_auth2, function(data){
			$(CABINET.SETTINGS.ident_form_auth2).find(CABINET.SETTINGS.ident_error_messages).html('');
			if(data.ok){	            
	            if(CABINET.SETTINGS.url_auth_redirect)
	            	window.location.href=CABINET.SETTINGS.url_auth_redirect;
	            else
	            	document.location.reload(); 
	        }
	        else{
	             $.each(data.errors,function(i,e){
	                $(CABINET.SETTINGS.ident_form_auth2).find(CABINET.SETTINGS.ident_error_messages).append(e+'<br>');
	            });
        	}
		});
	},

	//шлем данные регистрации
	send_reg:function(){
		CABINET.form_sender(CABINET.SETTINGS.url_ajax_reg, CABINET.SETTINGS.ident_form_reg, function(data){
			$(CABINET.SETTINGS.ident_form_reg).find(CABINET.SETTINGS.ident_error_messages).html('');
			if(data.ok){
	            MODAL.close(CABINET.SETTINGS.ident_modal_reg);
	            
	            if(CABINET.SETTINGS.email_activation){
	            	MODAL.dialog('Поздравляем!','Вы успешно зарегистрировались!<br>В ближайшее время Вам должно прийти письмо с инструкцией по активации аккаунта.');
	            }
	            else{
	            	MODAL.dialog('Поздравляем!','Вы успешно зарегистрировались! Сейчас Вы будете перенаправлены в кабинет.');
		            setTimeout(function(){
		                document.location.href=CABINET.SETTINGS.url_cabinet;
		            },3000);  
	            }
	                    
	        }
	        else{
	             $.each(data.errors,function(i,e){
	                $(CABINET.SETTINGS.ident_form_reg).find(CABINET.SETTINGS.ident_error_messages).append(e+'<br>');
	            });
        	}
		});
	},

	//восстановление пароля
	send_forgotten_password:function(){
		CABINET.form_sender(CABINET.SETTINGS.url_ajax_forgotten_password, CABINET.SETTINGS.ident_form_forgotten_password, function(data){
			$(CABINET.SETTINGS.ident_form_forgotten_password).find(CABINET.SETTINGS.ident_error_messages).html('');
			if(data.ok){
	            MODAL.close(CABINET.SETTINGS.ident_modal_forgotten_password);
	            MODAL.close(CABINET.SETTINGS.ident_modal_auth);
	            if(data.messages_string)
	                MODAL.dialog('Успешно!',data.messages_string);  
	            else
	                MODAL.dialog('Успешно!');       
	        }
	        else{
	             $.each(data.errors,function(i,e){
	                $(CABINET.SETTINGS.ident_form_forgotten_password).find(CABINET.SETTINGS.ident_error_messages).append(e+'<br>');
	            });
        	}
		});
	},

	//отправлятор данных формы
	form_sender:function(url,form_ident, done, before){      
            
        var formdata = $(form_ident).serializeArray() || null;
        $(form_ident).find('button[type=submit]').attr('disabled', true).addClass('disabled').addClass('loading_btn');
        
        if(typeof before == 'function')  
        	before();            
        
        $.ajax({
            url: url,
            type: "POST",
            data: formdata
        }).done(function(data){
            data = $.parseJSON(data);
            $(form_ident).find('button[type=submit]').removeClass('disabled').removeAttr('disabled').removeClass('loading_btn');

            if(data.ok){
                //avaSENDER.close_popups();
                $(form_ident).find('input[type != submit]').val('');
                $(form_ident).find('textarea').val('').text('');
                
            }
            if(typeof done == 'function')   done(data);

        });
        return false;
        
    },

	//вешаем обработчики
	set_bindings:function(){
		$('form.jscabinet-auth').bind('submit', function(){
			CABINET.send_auth();
			return false;
		});

		$('form.jscabinet-auth2').bind('submit', function(){
			CABINET.send_auth2();
			return false;
		});

		$('form.jscabinet-reg').bind('submit', function(){
			CABINET.send_reg();
			return false;
		});

		$('form.jscabinet-forgotten_password').bind('submit', function(){
			CABINET.send_forgotten_password();
			return false;
		});
	},

	//глазочек в поле пароля
	pass_eye:function(){		
		$(".cabinet_passEye").append('<span class="_eye" title="Показать/скрыть пароль"></span>');

		$(".cabinet_passEye ._eye").click(function() {
			$(this).toggleClass('_openEye');
			var passVal = $(this).prev().attr('type');
			if ( passVal === 'password' ) { $(this).prev().attr('type', 'text');  }
				else { $(this).prev().attr('type', 'password'); }
		});
		
	},
	//блокировка просмотра пароля
	pass_eye_block:function(block){
		//блокировка		
		$(".cabinet_passEye ._eye").prev().attr('type', 'password');
		$(".cabinet_passEye ._eye").hide();
		$(".cabinet_passEye ._eye").hide().removeClass('_openEye');
		
	}
};