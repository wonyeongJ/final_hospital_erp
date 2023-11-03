$('#historyInsert-submit-btn').click(function(){
	var check = confirm('대여 신청 하시겠습니까?')
	
	if(check){
		let date = $('.date-picker').val()
		if(date.length != 0){
			var now = new Date();
			let daten = Date.parse(date)
			if(daten > now){
				$('.date-picker').prop('disabled', false);
				$('#history-insert-form').submit();
			}else{
				alert('대여 종료 날짜는 필수 항목 입니다. 혹은 등록하신 날짜가 오늘 이후가 맞는지 확인해주세요.')
			}
		}else{
			alert('대여 종료 날짜는 필수 항목 입니다. 혹은 등록하신 날짜가 오늘 이후가 맞는지 확인해주세요.')
		}
	}
});

$('#indefinite-btn').click(function(){
	if($(this).is(':checked') == true){
		console.log("체크 됨");
		//$(this).prev().val();
		$(this).prev().prev().val("31 December 9999");
		$('.date-picker').prop('disabled', true);
		//$(this).prev().prev().prop('disabled', true);
	}else{
		console.log("체크 안됨")
		const date = new Date();
		let dateString = date.toDateString();
		$(this).prev().prev().val(dateString);
		$('.date-picker').prop('disabled', false);
		//$(this).prev().prev().prop('disabled', false);
	}
});