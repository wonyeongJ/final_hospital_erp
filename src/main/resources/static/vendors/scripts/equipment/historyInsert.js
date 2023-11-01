$('#historyInsert-submit-btn').click(function(){
	var check = confirm('대여 신청 하시겠습니까?')
	
	if(check){
		let date = $('.date-picker').val()
		if(date.length != 0){
			$('.date-picker').prop('disabled', false);
			$('#history-insert-form').submit();
		}else{
			alert('모든 항목은 필수 항목 입니다.')
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