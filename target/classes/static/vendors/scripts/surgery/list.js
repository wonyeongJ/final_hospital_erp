$('.surgery-update-btn').click(function(){
	let surgeryToUpdate = Number($(this).parent().prev().children().next().val());
	let codeToUpdate = Number($(this).parent().prev().children().val());
	
	$.ajax({
	  	type : 'post',
	    url : '/surgery/update',
	    async: false,
	    data : {
			surNum : surgeryToUpdate,
			surCd : codeToUpdate
		},
	    success : function(result) {
	    	window.location.replace(result)
		}
 	})
});

$('.surgery-delete-btn').click(function(){
	let surgeryToDelete = Number($(this).parent().prev().children().next().val());
	let codeToDelete = Number($(this).parent().prev().children().val());
	
	$.ajax({
	  	type : 'post',
	    url : '/surgery/delete',
	    async: false,
	    data : {
			surNum : surgeryToDelete,
			surCd : codeToDelete
		},
	    success : function(result) {
	    	window.location.replace(result)
		}
 	})
});

$('.surgery-insert-btn').click(function(){
	let surgeryToInsert = Number($(this).parent().prev().children().val());
	
	$.ajax({
	  	type : 'post',
	    url : '/surgery/insert',
	    async: false,
	    data : {
			surNum : surgeryToInsert
		},
	    success : function(result) {
	    	window.location.replace(result)
		}
 	})
});