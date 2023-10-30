$('.equipment-delete-btn').click(function(){
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
});

$('.equipment-update-btn').click(function(){
	let equipmentToUpdate = $(this).parent().parent().prev().prev().children().next().children().val();
	let serialNumToUpdate = $(this).parent().parent().prev().prev().prev().children().next().children().val();
	let pDateToUpdate = $(this).parent().parent().prev().children().next().children().val();
	let equCdToUpdate = Number($(this).parent().attr('value'));
	
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
});