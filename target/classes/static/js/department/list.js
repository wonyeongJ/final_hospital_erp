

	$('.cdepartmentUpdateBtn').on('click',function(){

		console.log($(this).parent().siblings('.updateBro'))
		$(this).text("수정완료");
		$(this).attr("class", "btn btn-success cdepartmentUpdateBtn2");

			$(this).parent().siblings('.updateBro').each(function() {
			  let tdNode = $(this); // <td> 요소 가져오기
			  let textValue = tdNode.text(); // <td> 요소의 텍스트 내용 가져오기
			  let input = $('<input>', {
				class: 'inputData',
			    type: 'text',
			    value: textValue
			  });
			
			  // <td> 요소 내부의 텍스트 노드를 <input> 요소로 대체
			  tdNode.empty().append(input);
			});
			
		});

		$('.cdepartmentUpdateBtn2').on('click',function(){
			//$(this).attr("type", "submit") tr 태그밖 태그안에서 form 태그넣으면 인식못함 실패
			
			/*$.ajax({
				url: "/member/memberListChart",
				type: "GET",
				data : {
					
				},
				success: function(ajaxdata) {
					// 서버에서 반환한 MemberVO 객체를 사용
					console.log(ajaxdata);
					data = ajaxdata;

				}
			});*/
		})
	