/*============================================================================
 avalab.ru
 author: Ruslan Galeyev
 vk:https://vk.com/a_ruslan если спиздили скрипт, хоть зайдите, спасибо скажите )
 ============================================================================*/
avaSENDER={
    settings:{
        'formClass' : "sender",
        'url':null,
        'validate':false,
        'delay':4000,
        'done':function(){},
        'done_delayed':function(){}
    },
    extend:function(settings){//функция изменения настроек.
        avaSENDER.settings = $.extend(avaSENDER.settings, settings);
        return this;
    },
    init:function(settings){
        avaSENDER.extend(settings);
        return false;
    },
    old_init:function(settings){ //осталось для совестимости со старыми проектами
        avaSENDER.extend(settings);
        if(avaSENDER.settings.url==null){
            var form_url=$('.'+avaSENDER.settings.formClass).attr('action');
            if(!form_url){
                console.log('avaSENDER: no url');
                return false;
            }
            else avaSENDER.settings.url=form_url;
        }
        $('.'+avaSENDER.settings.formClass).bind('submit',function(){
            var thiss=$(this);
            var rating = $(this).find('input[name=rating]').val();
            var sex = $(this).find('input[name=sex]:checked').val()?$(this).find('input[name=sex]:checked').val():undefined;
            var name = $(this).find('input[name=name]').val();
            var email = $(this).find('input[name=email]').val();
            var phone = $(this).find('input[name=phone]').val();
            var title = $(this).find('input[name=title]').val();
            var extra = $(this).find('input[name=extra]').val();
            var message = $(this).find('textarea[name=message]').val();

            if(avaSENDER.settings.validate && (!phone || !name)){
                alert('Пожалуйста, укажите все данные!');
                return false;
            }
            $.ajax({
                url: avaSENDER.settings.url,
                type: "POST",
                data: {
                    rating: rating,
                    sex: sex,
                    name:name,
                    email:email,
                    phone:phone,
                    title:title,
                    extra:extra,
                    message:message
                }
            }).done(function(data){
                data = $.parseJSON(data);
                thiss.find('input[name=name]').val('');
                thiss.find('input[name=email]').val('');
                thiss.find('input[name=phone]').val('');
                thiss.find('input[name=extra]').val('');
                thiss.find('input[name=title]').val('');
                thiss.find('textarea[name=message]').val('').text('');
                avaSENDER.settings.done(data);
                setTimeout(function(){ avaSENDER.settings.done_delayed(data);},avaSENDER.settings.delay);
            });
            return false;
        });



        return false;
    },
    bind_form_secure:function(url,formClass,done, before){

        $('.'+formClass).bind('submit',function(){

            var thiss=$(this);
            var formdata = $(this).serializeArray();

            formdata.push({
                name:'secure_code',
                value:avaSENDER.get_code()
            });

            if(avaSENDER.settings.validate && (!formdata.phone || !formdata.name)){
                alert('Пожалуйста, укажите все данные!');
                return false;
            }
            
            if(typeof before == 'function')     before();
            
            thiss.find('button[type=submit]').attr('disabled', true).addClass('disabled');
            $.ajax({
                url: url,
                type: "POST",
                data: formdata
            }).done(function(data){
                data = $.parseJSON(data);
                thiss.find('button[type=submit]').removeClass('disabled').removeAttr('disabled');

                if(data.ok){
                    //avaSENDER.close_popups();
                    thiss.find('input[type != submit]').val('');
                    thiss.find('textarea').val('').text('');

                    //setTimeout(function(){ avaSENDER.close_popups();},avaSENDER.settings.delay);
                }
                if(typeof done == 'function')   done(data);

            });
            return false;
        });
    },
    bind_form:function(formClass,done,done_delayed){
        var form_url=$('.'+formClass).attr('action');
        if(!form_url){
            console.log('avaSENDER: no url');
            return false;
        }
        $('.'+formClass).bind('submit',function(){
            //avaSENDER.close_popups();
            var thiss=$(this);
            var formdata = $(this).serializeArray();

            if(avaSENDER.settings.validate && (!formdata.phone || !formdata.name)){
                alert('Пожалуйста, укажите все данные!');
                return false;
            }
            $.ajax({
                url: form_url,
                type: "POST",
                data: formdata
            }).done(function(data){
                data = $.parseJSON(data);
                if(data.error == undefined && data.errors==undefined){
                    thiss.find('input[type != submit]').val('');
                    thiss.find('textarea').val('').text('');
                }
                if(typeof done == 'function')done(data);

                setTimeout(function(){ avaSENDER.close_popups();},avaSENDER.settings.delay);

            });
            return false;
        });
    },
    bind_form_new:function(formClass,done,done_delayed){
        var form_url=$('.'+formClass).attr('action');
        if(!form_url){
            console.log('avaSENDER: no url');
            return false;
        }
        $('.'+formClass).bind('submit',function(){

            var thiss=$(this);
            var formdata = $(this).serializeArray();

            if(avaSENDER.settings.validate && (!formdata.phone || !formdata.name)){
                alert('Пожалуйста, укажите все данные!');
                return false;
            }
            $.ajax({
                url: form_url,
                type: "POST",
                data: formdata
            }).done(function(data){
                data = $.parseJSON(data);

                if(data.ok){
                    //avaSENDER.close_popups();
                    thiss.find('input[type != submit]').val('');
                    thiss.find('textarea').val('').text('');



                    //setTimeout(function(){ avaSENDER.close_popups();},avaSENDER.settings.delay);
                }
                if(typeof done == 'function')done(data);


            });
            return false;
        });
    },
    manual_send:function(url,data,done,done_delayed){
        $.ajax({
            url:   url,
            type: "POST",
            data: data
        }).done(function(data){
            data = $.parseJSON(data);
            if(typeof done =='function') done(data);
            if(typeof done_delayed =='function') setTimeout(function(){ done_delayed();},2000);
        });
        return false;
    },
    close_popups:function(){
        try{
            $.magnificPopup.close();
        }
        catch(e){}
        try{
            $.arcticmodal('close');
        }
        catch(e){}
    },
    get_code: function(a){
        return a?(a^Math.random()*16>>a/4).toString(16):([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g,avaSENDER.get_code);
    }
};