DIARY.SUMMARY = {
	birthday:false,
	registration_date:false,
	weeks_gone:false,
	months_gone:false,
	days_gone:false,

    init: function() {
        DIARY.loadingHide();
        DIARY.SUMMARY.generateBlockBirthDigits();
        DIARY.SUMMARY.generateBlockGraphActivity();
        DIARY.SUMMARY.generateBlockStatistics();
        DIARY.SUMMARY.generateBlockPreviousYears();

        setTimeout(function(){
        	DIARY.SUMMARY.generateBlockWeeksTable();
        }, 1000);
        
    },

    generateBlockBirthDigits: function(){
    	DIARY.SUMMARY.birthday = $('#jscontainer_block_birthdigits').attr("data-birthday");
    	DIARY.SUMMARY.registration_date = $('#jscontainer_block_birthdigits').attr("data-registration_date"); 
    	
    	//чтоб везде нормально срабатывали проверки
    	if(DIARY.SUMMARY.birthday== '0000-00-00')
    		DIARY.SUMMARY.birthday = false;	

    	//console.log(DIARY.SUMMARY.birthday);
    	//указана днюха
    	if(DIARY.SUMMARY.birthday){
    		var now = moment();
    		DIARY.SUMMARY.weeks_gone = parseInt(moment(now).diff(DIARY.SUMMARY.birthday,"weeks"));
    		DIARY.SUMMARY.days_gone = parseInt(moment(now).diff(DIARY.SUMMARY.birthday,"days"));
    		DIARY.SUMMARY.months_gone = parseInt(moment(now).diff(DIARY.SUMMARY.birthday,"months"));

	    	var s=  '<table class="table">';
	    		s+= '<tr><td>Вы родились</td><td>' + moment(DIARY.SUMMARY.birthday).format("Do MMM YYYY (dddd)") + '</td></tr>';

	    		//месяцев
	    		s+= '<tr><td>с тех пор прошло</td><td>' + DIARY.SUMMARY.months_gone + avaHELPER.morphText(DIARY.SUMMARY.months_gone, [' месяц', ' месяца', ' месяцев']) + ' </td></tr>';

	    		//недель
	    		s+= '<tr><td>&nbsp;</td><td>' + DIARY.SUMMARY.weeks_gone + avaHELPER.morphText(DIARY.SUMMARY.weeks_gone, [' неделя', ' недели', ' недель']) + ' </td></tr>';
	    		
	    		//дней
	    		s+= '<tr><td>&nbsp;</td><td>' + DIARY.SUMMARY.days_gone + avaHELPER.morphText(DIARY.SUMMARY.days_gone, [' день', ' дня', ' дней']) +' </td></tr>';
	    		
	    		s+= '</table>';

	    	$('#jscontainer_block_birthdigits').html(s);
    	}
    	//не указана
    	else{
    		$('#jscontainer_block_birthdigits').html('<div class="_empty">Как только Вы укажете дату своего рождения, тут появится много интересной информации для Вас!<br><br><a href="/cabinet/profile/">перейти в личный профиль</a></div>');

    		$('#jspanel_new_registration').fadeIn();
    	}
    	$('#jsblock_birthdigits .overlay').hide();
    	
    },

    //генерим блок Уиктcейбл
    generateBlockWeeksTable: function(){
    	if(DIARY.SUMMARY.birthday){

	    	var num_week=1;
	    	var s =  '<table class="weektable">';

	    		for(var row=1;row<=70;row++){
	    			s += '<tr>';
	    				
	    				if(row==21 || row==51)
	    					s += '<tr><td class="_hr"></td></tr>';

	    				for(var col=1;col<=52;col++){
	    					if(num_week <= DIARY.SUMMARY.weeks_gone)
	    						s += '<td style="background-color:#73b34d;"></td>';
	    					else
	    						s += '<td></td>';
	    					num_week++;
	    				}

	    			s += '</tr>';
	    		}

	    		s +=  '</table>';
	    	$('#jscontainer_block_weektable').html(s);
	    	$('#jsblock_weektable').fadeIn();
    	}
    	else{
    		$('#jsblock_weektable').hide();
    	}	
    },

    //в этот день в предыдущие года
    generateBlockPreviousYears: function(){
    	var s =  '';
    	var y_last = '';
    	DIARY.SUMMARY.getPreviousYears(function(data){
    		if(data && data.length){
    			$.each(data, function(i,e){
    				if(y_last != e.y){
	    				s +='<div class="label label-default">'+e.y+'</div>';
	    				y_last = e.y;
	    			}
	    			s +='<div class="event_format">'+e.title+'</div>';
	    		});
    		}
    		else
    			s +='<div class="_empty">Еще нет событий, произошедших в этот день в предыдущие годы.</div>';
    		
    		$('#jscontainer_block_previous_years').html(s);
    		$('#jsblock_previous_years .overlay').hide();
    	});
    	
    },

    generateBlockStatistics: function(){
    	var s ='';
    	
    	if(DIARY.SUMMARY.registration_date)
    	 	s += '<div>Вы зарегистрировались на Мемуарнике '+ moment(DIARY.SUMMARY.registration_date).fromNow() +'</div>';

    	$('#jscontainer_block_statistics').html(s);

    	DIARY.SUMMARY.getCountAll(function(events_cnt){
    		if(events_cnt)
    			$('#jscontainer_block_statistics').append("<div>За это время Вы успели добавить " + events_cnt + avaHELPER.morphText(events_cnt, [' событие',' события', ' событий']) + ".</div>");
    		else
    			$('#jscontainer_block_statistics').append("<div>Но Вы еще не добавили ни одной записи.</div>");
    		$('#jsblock_event_statistics .overlay').hide();
    	});
    },
	//генерим график активности
    generateBlockGraphActivity: function() {
    	DIARY.sender('/api_diary/summary_event_cnt_per_month/?ajax', false, function(response){
			if(response.ok){
				DIARY.SUMMARY.renderChartActivity(response.data);					
			}
			$('#jsblock_activity_graph .overlay').hide();
					
		});
    	
    },

    //генерим график активности
    renderChartActivity: function(data) {
    	//console.log(data);
        //-------------
        //- BAR CHART -
        //-------------
        var areaChartData = {
            labels: [],
            datasets: [
                // {
                //   label               : 'Electronics',
                //   fillColor           : 'rgba(210, 214, 222, 1)',
                //   strokeColor         : 'rgba(210, 214, 222, 1)',
                //   pointColor          : 'rgba(210, 214, 222, 1)',
                //   pointStrokeColor    : '#c1c7d1',
                //   pointHighlightFill  : '#fff',
                //   pointHighlightStroke: 'rgba(220,220,220,1)',
                //   data                : [65, 59, 80, 81, 56, 55, 40]
                // },
                {
                    label: 'Активность',
                    fillColor: 'rgba(60,141,188,0.9)',
                    strokeColor: 'rgba(60,141,188,0.8)',
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(60,141,188,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: []
                }
            ]
        };

        var cnt = 0;
        $.each(data, function(i,e){
        	areaChartData.labels.push(e.title);
        	areaChartData.datasets[0].data.push(e.cnt);
        });

        // if(!cnt)
        // 	return false;

        var barChartCanvas = $('#jscontainer_chart_activity').get(0).getContext('2d');
        var barChart = new Chart(barChartCanvas);
        var barChartData = areaChartData;
        //barChartData.datasets[1].fillColor   = '#00a65a';
        //barChartData.datasets[1].strokeColor = '#00a65a';
        //barChartData.datasets[1].pointColor  = '#00a65a';
        var barChartOptions = {
            //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
            scaleBeginAtZero: true,
            //Boolean - Whether grid lines are shown across the chart
            scaleShowGridLines: true,
            //String - Colour of the grid lines
            scaleGridLineColor: 'rgba(0,0,0,.05)',
            //Number - Width of the grid lines
            scaleGridLineWidth: 1,
            //Boolean - Whether to show horizontal lines (except X axis)
            scaleShowHorizontalLines: true,
            //Boolean - Whether to show vertical lines (except Y axis)
            scaleShowVerticalLines: true,
            //Boolean - If there is a stroke on each bar
            barShowStroke: true,
            //Number - Pixel width of the bar stroke
            barStrokeWidth: 2,
            //Number - Spacing between each of the X value sets
            barValueSpacing: 5,
            //Number - Spacing between data sets within X values
            barDatasetSpacing: 1,
            //String - A legend template
            //legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
            //Boolean - whether to make the chart responsive
            responsive: true,
            maintainAspectRatio: true
        };

        barChartOptions.datasetFill = false;
        barChart.Bar(barChartData, barChartOptions);
    },

    //получает общее количество событий пользователя
	getCountAll: function(done){
		DIARY.sender('/api_diary/event_count_all/?ajax', false, function(response){
			if(response.ok){
				if(done)
					done(parseInt(response.data));	
			}
					
		});
	},

	//получает события в этот день в предыдущие годы
	getPreviousYears: function(done){
		DIARY.sender('/api_diary/event_get_previous_years/?ajax', false, function(response){
			if(response.ok){
				if(done)
					done(response.data);	
			}
					
		});
	},
}