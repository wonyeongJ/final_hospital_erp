$('.equipment-delete-btn').click(function(){
	var check = confirm('삭제 하시겠습니까?')
	
	if(check){
		let equipmentToDelete = Number($(this).val());
	
	    $.ajax({
		  	type : 'post',
		    url : '/equipment/delete',
		    async: false,
		    data : {
				equCd : equipmentToDelete
			},
		    success : function(result) {
				console.log(result);
		    	window.location.replace("../list");
			}
	 	})
	}

});

$('.equipment-update-btn').click(function(){
	var check = confirm('수정 하시겠습니까?')
	
	if(check){
		let equipmentToUpdate = $(this).parent().parent().prev().prev().children().next().children().val();
		let serialNumToUpdate = $(this).parent().parent().prev().prev().prev().children().next().children().val();
		let pDateToUpdate = $(this).parent().parent().prev().children().next().children().val();
		let equCdToUpdate = Number($(this).parent().attr('value'));
		
		let check1 = false;
		let check2 = false;
		let check3 = false;
		
		if(equipmentToUpdate != 'choose category'){
			check1 = true;
		}
		if(serialNumToUpdate.length != 0){
			check2 = true;
		}
		if(pDateToUpdate.length != 0){
			check3 = true;
		}
		
		if(check1 && check2 && check3){
			$.ajax({
		  	type : 'post',
		    url : '/equipment/update',
		    async: false,
		    data : {
				codeName : equipmentToUpdate,
				equSnum : serialNumToUpdate,
				pDate : pDateToUpdate,
				equCd : equCdToUpdate
			},
		    success : function(result) {
		    	window.location.replace(result);
			}
	 	})
		}else{
			alert('모든 항목은 필수 항목 입니다.')
		}
	}
});