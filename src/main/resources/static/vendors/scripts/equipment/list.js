$('.category-update-btn').click(function(){
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
});

$('.category-insert-btn').click(function(){
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
});

$('.category-delete-btn').click(function(){
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
});

$('.category-filter-btn').click(function(){
	let categorySelected = $(this).val();

	window.location.replace('/equipment/list?codeName='+categorySelected)
});

$('.equipment-insert-btn').click(function(){
	let categoryToEquipmentInsert = $(this).parent().parent().prev().prev().children().next().children().val();
	let serialNum = $(this).parent().parent().prev().prev().prev().children().next().children().val();
	let pDate = $(this).parent().parent().prev().children().next().children().val();
	
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
});