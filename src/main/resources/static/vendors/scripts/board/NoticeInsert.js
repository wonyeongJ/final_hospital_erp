 // 폼 제출 전 필수 조건 확인
 document.getElementById('frm').addEventListener('submit', function (event) {
 
 	const notTitle = document.querySelector('input[name="notTitle"]');        
 	const notContents = document.querySelector('textarea[name="notContents"]');        
 
 if (notTitle.value.trim() === '') {            
	 event.preventDefault();            
	 	alert('제목을 입력해야 합니다.');        
	 	}        
 if (notContents.value.trim() === '') {            
	 event.preventDefault();            
	 alert('내용을 입력해야 합니다.');        
	 }    
});
$("#inlineCheckbox1").on("change", function() {
    var isChecked = $(this).is(":checked");

    // 중요 공지 여부 체크되었을 때
    if (isChecked) {
        // Ajax 요청 보내기
        $.ajax({
            type: "POST",
            url: "noticeImportantCount", // 컨트롤러의 URL
            data: {
                notImportant: 1 // 중요 공지사항 체크
            },
            success: function(response) {
                if (response === "success") {
                    // 중요 공지사항 등록 성공
                } else if (response === "failure") {
                    // 중요 공지사항 3개 이상 등록된 경우
                    alert("중요 공지사항은 3개까지 등록 가능합니다. 등록되어 있는 중요 공지사항을 일반 공지사항으로 수정 후 다시 등록해주세요.");
                    $("#inlineCheckbox1").prop("checked", false); // 체크박스 체크 해제
                }
            },
            error: function() {
                alert("오류가 발생했습니다.");
                $("#inlineCheckbox1").prop("checked", false); // 체크박스 체크 해제
            }
        });
    } else {
        // 중요 공지 여부 체크 해제될 때의 처리 (여기에 필요한 코드 추가)
    }
});
