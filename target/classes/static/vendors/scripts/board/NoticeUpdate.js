function updateHiddenInput(checkbox) {
    const hiddenInput = document.getElementById('notImportantHidden');
    if (checkbox.checked) {
        hiddenInput.value = 1;
    } else {
        hiddenInput.value = 0;
    }
    
    // 중요 공지사항 체크 시, 중요 공지사항 갯수 확인 및 처리
    if (checkbox.checked) {
        // AJAX 요청으로 중요 공지사항 수를 확인
        $.ajax({
            type: "POST",
            url: "/board/notice/noticeImportantCount",
            data: { notImportant: 1 },
            success: function (result) {
                if (result === "failure") {
                    // 중요 공지사항이 3개 이상인 경우, 체크를 해제
                    hiddenInput.value = 0; // hiddenInput 값을 다시 0으로 변경
                    checkbox.checked = false; // 체크박스를 해제
                    alert("중요 공지사항은 3개까지 등록 가능합니다. 등록되어 있는 중요 공지사항을 일반 공지사항으로 수정 후 다시 등록해주세요.");
                }
            }
        });
    }
}