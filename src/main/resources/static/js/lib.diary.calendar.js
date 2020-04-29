DIARY.CALENDAR = {
	ident:'#jsblock_calendar',
	default_color: '#fcf8e3', //цвет события по умолчанию
    init: function() {   	

        var date = new Date();
        var d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear();
        
        $(DIARY.CALENDAR.ident).fullCalendar({
        	locale:'ru',
        	eventLimit: true,
        	eventLimitText:'еще',
            header: {
                left: 'prev,next',
                center: 'title today',
                right: 'prevYear,nextYear'
            },
            buttonText: {
                today: 'Сегодня',
                month: 'Месяц',
                week: 'week',
                day: 'day'
            },
            
            //вытаскиваем события
            events: function(start, end, timezone, callback) {
			    $.ajax({
			      url: '/api_diary/event_get_list/?ajax',
			      dataType: 'json',
			      data: {			        
			        start: start.format('YYYY-MM-DD'),
			        end: end.format('YYYY-MM-DD')
			      },
			      
			      success: function(response) {
			      	if(!response.data)
			      		return false;

			        var events = [];
			      	$.each(response.data,function(i,e){
			      		events.push({			      			
			      			eid:e.id,
				            title: e.title,
				            color: e.color || DIARY.CALENDAR.default_color,
				            textColor:'#333',//(e.color=='#ffffff' || !e.color) ? '#333' : 'white',
				            borderColor:'#eee',//(e.color=='#ffffff' || !e.color) ? '#eee' : false,
				            start: e.date_event // will be parsed
			          	});
			      	});			        
			        callback(events);
			      }
			    });
			},

			//перетаскивание
			eventDrop: function(event, delta, revertFunc, jsEvent, ui, view){
				DIARY.EVENT.dragdrop(event, delta, revertFunc, jsEvent, ui, view);				
			},

			//клик по дате
            dayClick: function(date, allDay, jsEvent, view) {
			    DIARY.EVENT.new(date, allDay, jsEvent);			    
			},

			//клик по событию
			eventClick: function(calEvent, jsEvent, view) {
				DIARY.EVENT.edit(calEvent, jsEvent, view);	
			    //console.log(calEvent);
			    $('.fc-day-grid-event').css('border-style', 'none');
			    $(this).css('border', 'dashed 3px black');

			},
			loading:function(isLoading){
				//если isLoading = false, значит конец обновления
				if(!isLoading){
					DIARY.loadingHide();
				}	
				else{
					DIARY.loadingShow();
				}	
			},
            editable: false,
            droppable: false, // this allows things to be dropped onto the calendar !!!           
        });

        //биндим переключатель разрешения на перемещение событий
        $('#jscontrol-allow_dragdrop').bind('change',function(){
        	if($('#jscontrol-allow_dragdrop').is(':checked')){
        		$(DIARY.CALENDAR.ident).fullCalendar('option', 'editable',true);        		
        	}
        	else{
        		$(DIARY.CALENDAR.ident).fullCalendar('option', 'editable',false);
        	}
        });
    },

    //инициализация колорпикера
    init_colorpicker:function(color){
        $('select.jsplugin_colorpicker').simplecolorpicker({
            picker: true        
        });        
    },
    
    //установка цвета колорпикера
    set_colorpicker:function(color){        
        if(color)
            $('select.jsplugin_colorpicker').simplecolorpicker('selectColor', color);
        else
            $('select.jsplugin_colorpicker').simplecolorpicker('selectColor',  DIARY.CALENDAR.default_color);
        
    }
};