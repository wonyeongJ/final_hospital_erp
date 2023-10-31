$(document).ready(function(){   
	    
	var reservatorArray = new Array();
	$('.reservator').each(function(){
		reservatorArray.push($(this).attr('reservator'));
	});
	    
	var startArray = new Array();
	$('.start-time').each(function(){
		startArray.push(Number($(this).attr('timeid')));
	});
	
	var endArray = new Array();
	$('.end-time').each(function(){
		endArray.push(Number($(this).attr('timeid')));
	});
	
	for(var i = 0; i < 24; i++){
		for(var j = 0; j < startArray.length; j++){
			if(startArray[j] <= i*100 && i*100 < endArray[j]){
				$('#'+ i ).attr('class', 'f')
			}	
			if(startArray[j] == i*100){
				$('#'+ i ).append(reservatorArray[j])
			}
		}  
	}
	
});

$('.date-picker').datepicker({   
	dateFormat: 'yy-mm-dd',         
    onSelect: function (dateText, inst) {
    	var date = $(this).val();
    	alert(date)        
    }
});