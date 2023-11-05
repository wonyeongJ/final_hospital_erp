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