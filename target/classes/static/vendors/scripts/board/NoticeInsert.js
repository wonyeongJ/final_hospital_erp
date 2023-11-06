$("#btn").on("click", function () {
    const notTitle = $("#notTitle").val();
    const notContents = $("#notContents").val();
    const notImportant = $("#notImportant").is(":checked") ? 1 : 0;

    if (notTitle === "") {
        alert("제목을 입력해야 합니다.");
        return false;
    }
    if (notContents === "") {
        alert("내용을 입력해야 합니다.");
        return false;
    }

    // 중요 공지사항인 경우에만 서버로 요청을 보냅니다
    if (notImportant === 1) {
        const requestData = {
            notTitle: notTitle,
            notContents: notContents,
            notImportant: notImportant,
        };

        $.ajax({
            type: "POST",
            url: "/board/notice/noticeImportantCount",
            data: JSON.stringify(requestData),
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result == 0) {
                    alert("중요 공지사항은 3개 이상 등록할 수 없습니다.");
                } else {
                    $("#frm").submit();
                }
            },
            error: function (e) {
                console.log("error: ", e);
            }
        });
    } else {
        // 중요 공지사항이 아닌 경우에는 서버로 요청을 보내지 않고 바로 submit 합니다
        $("#frm").submit();
    }

    return false;
});
