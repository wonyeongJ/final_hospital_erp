// $(function(){
// 	$(".main-container").on("click", "#updateButton", function(){
// 		alert("Test");
// 	});
// });

	$('.cdepartmentUpdateBtn').on('click',function(){
		
		let depArr = ["depName","depTnum","depDelete"];
		let i = 0;
		$(this).text("수정완료");
		$(this).attr("class","btn btn-success")
		if($(this).attr("id")=="updateButton"){
			let depCd = $(this).parent().siblings('.departmentUpdateCd').attr("data-depCd");
			// let depName = $('input[name=depName]');
			let depName = $(this).parent().siblings('.updateBro').children('.inputDatadepName').val();
			let depTnum = $(this).parent().siblings('.updateBro').children('.inputDatadepTnum').val();
			let depDelete = $(this).parent().siblings('.updateBro').children('.inputDatadepDelete').val();

			
			$.ajax({
				url: "/department/update",
				type: "post",
				data : {
					depCd: depCd,
					depName: depName,
					depTnum: depTnum,
					depDelete: depDelete
				},
				success: function() {
					
					document.location.reload();

				}
			});
		
		}else{
			$(this).parent().siblings('.updateBro').each(function() {
				if($(this).attr("id") == "updateRadio"){
					let tdNodethis = $(this); // <td> 요소 가져오기
					let selectBOx = 
					'<select name="depDelete" class="custom-select inputDatadepDelete"><option value="0" selected="selected">운영중</option><option value="1" >운영안함</option></select>';
					// let radio = $('<input>',{
						// 	class:"custom-control-input",
						// 	type: 'radio',
						// 	name: 'depDelete',
						// 	value: '0',
						// 	id:'customRadio1'
						// })
						// let label = $('<label>',{
						// 	class:"custom-control-label",
						// 	for:"customRadio1",
						// 	text:"운영중"
						// })
						// let radio2 = $('<input>',{
							// 	class:"custom-control-input",
							// 	type: 'radio',
							// 	name: 'depDelete',
							// 	value: '1',
							// 	id:'customRadio2'
							// })
							// let label2 = $('<label>',{
								// 	class:"custom-control-label",
								// 	for:"customRadio2",
								// 	text:"운영안함"
								// })
								tdNodethis.empty().append(selectBOx);
								tdNodethis.css("width","200px")
							}else{
								
								let tdNode = $(this); // <td> 요소 가져오기
								let textValue = tdNode.text(); // <td> 요소의 텍스트 내용 가져오기
								let input = $('<input>', {
									class: 'inputData'+depArr[i],
									type: 'text',
									value: textValue.trim()
								});
								i++;
								// <td> 요소 내부의 텍스트 노드를 <input> 요소로 대체
								tdNode.empty().append(input);
							}
						});
		}
			$(this).attr("id","updateButton");
			return false;
		});
				
	