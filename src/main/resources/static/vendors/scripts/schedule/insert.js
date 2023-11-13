$('#personal-schedule-insert').click(function(){
	var check = confirm('등록 하시겠습니까?')
	
	if(check){
		let startTime = new Date($('#start').val());
		let endTime = new Date($('#end').val());
		let desc = $('#desc').val();
		
		let st = $('#start').val();
		let et = $('#end').val();
		let check1 = false;
		let check2 = false;
		let check3 = false;
		
		if(st.length != 0){
			check1 = true;
		}
		if(et.length != 0){
			check2 = true;
		}
		if(endTime >= startTime){
			check3 = true;
		}
		
		if(check1&&check2&&check3){
			$.ajax({
		  	type : 'post',
		    url : '/schedule/personalScheduleInsert',
		    async: false,
		    data : {
				schSdate : startTime,
				schEdate : endTime,
				schDesc : desc
			},
		    success : function(result) {
		    	location.replace('personalList')
			}
	 		})
		}else{
			alert('입력하신 시간을 확인해주세요.');
		}
		
		
	}
});