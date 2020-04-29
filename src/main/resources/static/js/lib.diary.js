var DIARY = {
	init:function(){
        $('.jsdatepicker').datepicker({
            format: 'dd.mm.yyyy',
            language:'ru'
        });

        $('.jsbtn_event_new').bind("click", function(){ 
            DIARY.EVENT.new();
        });

        //вынесен сюда, потому что нужен в кнопке Добавить событие
        DIARY.CALENDAR.init_colorpicker();  

        $('.bs-tooltip').tooltip();

        $('form.jsform_diary_feedback').bind('submit',function(){
            if(!$('#jstextarea_diary_feedback_message').val()){
                alert('Ну напишите хоть что-нибудь!');
                return false;
            }


            DIARY.form_sender('/ajax/feedback/?ajax','form.jsform_diary_feedback', false, function(){
                MODAL.close('#modal_diary_feedback');
                MODAL.dialog('Спасибо!','Ваш отклик очень важен для нас');
            });
            return false;
        });

	},

	EVENT:{
		//создание нового события
		new:function(date, allDay, jsEvent){
			//console.log();
			DIARY.clearForm('form.jsformdiary-event_new');
            DIARY.CALENDAR.set_colorpicker();			
			MODAL.open('#modal_diary_event_new');

			$('form.jsformdiary-event_new').unbind('submit').bind('submit',function(){
				DIARY.form_sender('/api_diary/event_new/?ajax','.jsformdiary-event_new',[{
					day:(date ? date.format('YYYY-MM-DD') : false)
				}], function(){
					MODAL.close('#modal_diary_event_new');
					$(DIARY.CALENDAR.ident).fullCalendar('refetchEvents');
				});
				return false;
			});
			
		},

		//редактирование нового события
		edit:function(calEvent, jsEvent, view){
			if(!calEvent.eid)
				return false;
			MODAL.open('#modal_diary_event_edit');
			DIARY.loadingModalShow();
			DIARY.sender('/api_diary/event_get/?ajax&eid='+calEvent.eid, false, function(response){
				//console.log(response.data);
				DIARY.fillForm('form.jsformdiary-event_edit',response.data);
                
                if(response.data.color)
                    DIARY.CALENDAR.set_colorpicker(response.data.color);
                else
                    DIARY.CALENDAR.set_colorpicker();
				
                DIARY.loadingModalHide();
				$('form.jsformdiary-event_edit').unbind('submit').bind('submit',function(){
					DIARY.form_sender('/api_diary/event_update/?ajax','.jsformdiary-event_edit',false, function(){
						MODAL.close('#modal_diary_event_edit');
						$(DIARY.CALENDAR.ident).fullCalendar('refetchEvents');
					});
					return false;
				});
			});

			$('.jsclick_event_del').unbind('click').bind('click',function(){
				DIARY.EVENT.del(calEvent.eid);
			});
		},

		del:function(eid){
			if(!confirm("Вы уверены?"))
				return false;

			DIARY.sender('/api_diary/event_del/?ajax',[{
				eid:eid
			}],function(){
				MODAL.close('#modal_diary_event_edit');
				$(DIARY.CALENDAR.ident).fullCalendar('refetchEvents');
			});
			return false;
		},

		//перемещение
		dragdrop:function( event, delta, revertFunc, jsEvent, ui, view){
			if(!event.eid || !delta._days)
				return false;

			DIARY.sender('/api_diary/event_dragdrop/?ajax', [{
				eid:event.eid,
				//delta:delta._days,
				day:event.start.format('YYYY-MM-DD')
			}]);
		},
	},

	//очищает форму
	clearForm: function(identForm){
		var elms=$(identForm).find('input');
        $.each(elms,function(i,e){
            var elm_name=$(e).attr('name');
            var elm_type=$(e).attr('type');

            if(elm_name){
                if(elm_type=='checkbox'){
                    $(e).prop('checked',false);
                }
                else{
                    $(e).val('');
                }
            }
        });
        var elms=$(identForm).find('textarea');
        $.each(elms,function(i,e){
            var elm_name=$(e).attr('name');
            if(elm_name){
                $(e).html('');
                //console.log('clear '+elm_name);
            }
        });

        var elms=$(identForm).find('select');
        $.each(elms,function(i,e){
            var elm_name=$(e).attr('name');
            $('select[name='+elm_name+'] option:selected').each(function(i,e){
                $(e).selected=false;
            });
        });
	},
	
	//заполняет форму
	fillForm:function(identForm,data){
		var elms =$(identForm).find('input.data-fill');
        $.each(elms,function(i,e){
            var elm_name=$(e).attr('name');
            var elm_type=$(e).attr('type');

            if(elm_name){
                if(elm_name in  data) {
                    if(elm_type==='checkbox'){
                        if(data[elm_name]===1){
                            $(e).prop('checked',true);
                        }
                        else{
                            $(e).prop('checked',false);
                        }
                    }
                    else{
                        $(e).val(data[elm_name]);
                    }
                }
            }
        });
        var elms=$(identForm).find('textarea.data-fill');

        $.each(elms,function(i,e){
            var elm_name=$(e).attr('name');
            if(elm_name){
                if(elm_name in  data) {
                    $(e).html(data[elm_name]);
                    $(e).val(data[elm_name]);
                }
            }
        });

        var elms=$(identForm).find('select.data-fill');

        $.each(elms,function(i,e){

            var elm_name=$(e).attr('name');
            
            $('select[name='+elm_name+'] option:selected').each(function(i2,e2){
                $(e2).selected=false;
                //$(this).attr("selected", false);
            });

            if(elm_name){
                if(elm_name in  data) {
                    if(data[elm_name]){
                        $.each($(e).children(),function(i2,e2){
                            if($(e2).val()=== data[elm_name]){
                                 //$(e2).selected=true;
                                $(e2).attr("selected", "selected");
                            }

                        });
                    }
                }

            }
        });
	},

    //=================LOADINGS============================

	loadingShow: function(){
        $('.loading').show();
    },

    loadingHide: function(){
        $('.loading').fadeOut();
    },
    loadingModalShow: function(){
        $('.modal-loading').show();
    },

    loadingModalHide: function(){
        $('.modal-loading').fadeOut();
    },

    loadingBtnShow: function(btn_ident){
        $(btn_ident).addClass('loading_btn');
    },

    loadingBtnHide: function(btn_ident){
        $(btn_ident).removeClass('loading_btn');
    },

    //=================SENDERS============================

	//отправлятор данных формы
	form_sender:function(url, form_ident, extradata, done, before){      
            
        var formdata = $(form_ident).serializeArray() || null;
        
        if(extradata){
        	$.each(extradata,function(i,e){
        		$.each(e,function(i2,e2){
        			formdata.push({
	        			name:i2,
	        			value:e2
	        		});
        		});       		
        		
        	});
        }
        if(form_ident)
        	$(form_ident).find('button[type=submit]').attr('disabled', true).addClass('disabled');
        
        if(typeof before == 'function')  
        	before();            
        
        $.ajax({
            url: url,
            type: "POST",
            data: formdata
        }).done(function(data){
            data = $.parseJSON(data);
            if(form_ident)
            	$(form_ident).find('button[type=submit]').removeClass('disabled').removeAttr('disabled');

            if(data.ok){
                if(form_ident){
                	$(form_ident).find('input[type != submit]').val('');
                	$(form_ident).find('textarea').val('').text('');
                }
                
                
            }
            if(data.messages){
            	$.each(data.messages,function(i,e){
            		DIARY.showMsg(e, 'info');
            	});
            }
            if(data.errors){
            	$.each(data.errors,function(i,e){
            		DIARY.showMsg(e, 'error');
            	});
            }
            if(typeof done == 'function')   done(data);

        });
        return false;
        
    },

    //отправлятор
	sender:function(url, postdata, done, before){        
        
        var postdata2send = [];        
        if(postdata){
        	$.each(postdata,function(i,e){
        		$.each(e,function(i2,e2){
        			postdata2send.push({
	        			name:i2,
	        			value:e2
	        		});
        		});       		
        		
        	});
        }
        
        
        if(typeof before == 'function')  
        	before();            
        
        $.ajax({
            url: url,
            type: postdata2send.length ? "POST" : "GET",
            data: postdata2send
        }).done(function(data){
            data = $.parseJSON(data);
            

            if(data.ok){             
                
                
            }
            if(data.messages){
            	$.each(data.messages,function(i,e){
            		DIARY.showMsg(e, 'info');
            	});
            }
            if(data.errors){
            	$.each(data.errors,function(i,e){
            		DIARY.showMsg(e, 'error');
            	});
            }
            if(typeof done == 'function')   done(data);

        });
        return false;
        
    },

    //=================MESSAGES============================

    //отбржаем сообщения
    showMsg:function(text, mode){
        //при фидбеке переводим
        if(text=='email_sent_feedback_a')
            text='Сообщение отправлено';

    	if(mode == 'error'){			
	        $.jGrowl(text, {
	            header:"Ошибка!",
            	theme: 'Right',
	            position:'bottom-right',
	            corners:1,
	            life:2000
	        });
    	}
    	else{
    		$.jGrowl(text, {
	            //header:"Информация",
	            position:'bottom-right',
	            corners:1,
	            life:2000
	        });
    	}
    	

    },

    

};
