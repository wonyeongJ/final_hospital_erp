$('.category-update-btn').click(function(){
	var check = confirm('수정 하시겠습니까?')
	
	if(check){
		let categoryToUpdate = $(this).parent().prev().children().val();
		let codeToUpdate = Number($(this).parent().prev().prev().attr('value'));
		
	    $.ajax({
		  	type : 'post',
		    url : '/equipment/codeUpdate',
		    async: false,
		    data : {
				codeName : categoryToUpdate,
				codeCd : codeToUpdate
			},
		    success : function(result) {
		    	window.location.replace(result)
			}
	 	})
	}
});

$('.category-insert-btn').click(function(){
	var check = confirm('등록 하시겠습니까?')
	
	if(check){
		let categoryToInsert = $(this).parent().prev().children().val();
		
	    $.ajax({
		  	type : 'post',
		    url : '/equipment/codeInsert',
		    async: false,
		    data : {
				codeName : categoryToInsert
			},
		    success : function(result) {
		    	window.location.replace(result)
			}
	 	})
	}
});

$('.category-delete-btn').click(function(){
	var check = confirm('삭제 하시겠습니까?')
	
	if(check){
		let categoryToDelete = $(this).parent().prev().children().val();
		let codeToDelete = Number($(this).parent().prev().prev().attr('value'));
		
	    $.ajax({
		  	type : 'post',
		    url : '/equipment/codeDelete',
		    async: false,
		    data : {
				codeName : categoryToDelete,
				codeCd : codeToDelete
			},
		    success : function(result) {
		    	window.location.replace(result)
			}
	 	})
	}
});

$('.category-filter-btn').click(function(){
	let categorySelected = $(this).val();

	window.location.replace('/equipment/list?codeName='+categorySelected)
});

$('.equipment-insert-btn').click(function(){
	var check = confirm('등록 하시겠습니까?')
	
	if(check){
		let categoryToEquipmentInsert = $(this).parent().parent().prev().prev().children().next().children().val();
		let serialNum = $(this).parent().parent().prev().prev().prev().children().next().children().val();
		let pDate = $(this).parent().parent().prev().children().next().children().val();
		
		let check1 = false;
		let check2 = false;
		let check3 = false;
		
		if(categoryToEquipmentInsert != 'choose category'){
			check1 = true;
		}
		if(serialNum.length != 0){
			check2 = true;
		}
		if(pDate.length != 0){
			check3 = true;
		}
		if(check1 && check2 && check3){
			$.ajax({
		  	type : 'post',
		    url : '/equipment/insert',
		    async: false,
		    data : {
				codeName : categoryToEquipmentInsert,
				equSnum : serialNum,
				date : pDate
			},
		    success : function(result) {
		    	window.location.replace(result)
			}
	 		})
		}else{
			alert('모든 항목은 필수 항목 입니다.')
		}
	}
	
});