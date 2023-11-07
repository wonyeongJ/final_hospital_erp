
        function confirmDelete(compCd) {
            if (confirm("삭제하면 복구할 수 없습니다. 정말로 삭제하시겠습니까?")) {
                $.ajax({
                    type: "POST",
                    url: "/board/complaints/delete/" + compCd,
                    data: { compCd: compCd },
                    success: function (response) {
                        if (response === "success") {
                            alert("삭제가 완료되었습니다.");
                            window.location.href = "/board/complaints/list";
                        } else {
                            alert("삭제에 실패했습니다.");
                        }
                    },
                    error: function () {
                        alert("서버 오류로 삭제에 실패했습니다.");
                    }
                });
            }
        }
  
 
	    function updateAction(compCd, newCodeCdAction) {
	        if (confirm('조치 상태를 변경하시겠습니까?')) {
	            $.ajax({
	                type: "GET",
	                url: `../actionUpdate/${compCd}`,
	                data: {
	                    codeCdAction: newCodeCdAction
	                },
	                success: function (response) {
	                    // 성공 시 실행할 작업
	                    alert("수정이 완료되었습니다")
	                    location.reload(); // 페이지 새로고침
	                },
	                error: function () {
	                    // 오류 발생 시 실행할 작업
	                    alert("수정 실패");
	                }
	            });
	        }
	    }
