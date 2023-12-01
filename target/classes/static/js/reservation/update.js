$('#drug-insert-btn').click(function(){
	let drug = $('.custom-select2').val();
	let howmany = $(this).prev().val();
	
	var str = drug + ': ' + howmany + '\n';
	
	$('#drug-area').val($('#drug-area').val() + str);
});