
        function confirmDelete(clubCd) {
            if (confirm("삭제하면 복구할 수 없습니다. 정말로 삭제하시겠습니까? (삭제가 완료되면 해당 모임이 해체됩니다)")) {
                $.ajax({
                    type: "POST",
                    url: "/board/club/delete/" + clubCd,
                    data: { clubCd: clubCd },
                    success: function (response) {
                        if (response === "success") {
                            alert("삭제가 완료되었습니다.");
                            window.location.href = "/board/club/list";
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
