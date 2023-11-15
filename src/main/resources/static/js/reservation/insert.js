$(document).ready(function() {
   // date 객체
	let now_utc = Date.now();
	// date 객체로 now를 꺼내면 UTC timzone 영국기준 한국시간에 맞춰서 시간을 빼줘야함
	let timeOff = new Date().getTimezoneOffset() * 60000;
	// today = now_utc - timeoff 를 빼면 한국과 영국 표준시간의 차이를 구할 수 있고 substring으로 필요한 정보만큼 잘라냄 16은 분까지
	let today = new Date(now_utc - timeOff).toISOString().substring(0, 16);
	$("#resVdate").attr("min", today);
	
	$('#resVdate').change(function() {
		let resVdate = $('#resVdate').val().replace("T"," ")+":00";
		console.log(resVdate);
		let searchDepartment = $('#searchDepartment').val();
		console.log(searchDepartment);
    	// 선택된 날짜 및 시간 값을 가져옴
	    var selectedDateTime = $(this).val();
		if(resVdate != null && searchDepartment !=null){
			
	    	searchAjax(searchDepartment,resVdate);
		}
	    // 선택된 날짜 및 시간 값을 출력
	    console.log("Selected date and time: " + selectedDateTime);

    // 여기에 원하는 작업을 추가할 수 있습니다.
  	});    
  	
  	$("#searchDepartment").change(function() {
		let resVdate = $('#resVdate').val().replace("T"," ")+":00";
		console.log(resVdate);
		let searchDepartment = $('#searchDepartment  option:selected').val();
		console.log(searchDepartment);
   		 // 선택된 option의 값을 가져옴
	    var selectedValue = $(this).val();
	    if(resVdate != null && searchDepartment !=null){
			
	    	searchAjax(searchDepartment,resVdate);
		}
	
	    // 선택된 option의 값을 출력
	    console.log("Selected option value: " + selectedValue);
	
	    // 여기에 원하는 작업을 추가할 수 있습니다.
 	 });
 	 
 	 
 	$("#reservationInsertBtn").on("click",function(){
		 
		 let resReason = $("#resReason").val().trim()
		 if(resReason.length != 0){
 			if($('#resVdate').val().length != 0){
				 if($('#doctorList').val().length != 0){
					let resVdate = $('#resVdate').val().replace("T"," ")+":00";
					$("#resVdate").val(resVdate);
					 
					$("#reservationInsertFrm").submit(); 
				 }else{
					 alert('선택하신 날짜에 진료가 가능한 의사를 선택해주세요.');
				 }
			 }else{
				 alert('예약 날짜를 입력해주세요.');
			 }
		 }else{
			 alert('방문원인을 입력해주세요.');
		 }
		 
	 })    
	 
        
   function searchAjax(depCdData,resVdateData){
		$.ajax({
			type: "POST",
			url: "/reservation/search",
			data: {
	        	depCd: depCdData,
	        	resVdate: resVdateData
    	    },
			dataType : 'json',
			async : false,
			success: function(ajaxData) {
				// 서버에서 반환한 MemberVO 객체를 사용
				console.log(ajaxData);
				//ajaxData = JSON.stringify(ajaxData,null,' ');
				//console.log(ajaxData);
		
				let doctorList = $('#doctorList').empty();

				ajaxData.forEach(function(data) {
				  doctorList.append($('<option>', {
				    value: data.memCd,
				    text: data.memName
				  }));
				});
		
			}
		});
   }
	
          

    
});