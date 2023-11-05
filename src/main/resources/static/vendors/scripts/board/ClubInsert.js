
    // JavaScript를 사용하여 모집 인원 조절 버튼을 제어
    const maxParticipantsInput = document.getElementById("clubPersonnel");
    const decreaseButton = document.getElementById("decrease");
    const increaseButton = document.getElementById("increase");

    decreaseButton.addEventListener("click", () => {
        if (maxParticipantsInput.value > 2) {
            maxParticipantsInput.value = parseInt(maxParticipantsInput.value) - 1;
        }
    });

    increaseButton.addEventListener("click", () => {
        maxParticipantsInput.value = parseInt(maxParticipantsInput.value) + 1;
    });



    // 폼 제출 전 필수 조건 확인
    document.getElementById('frm').addEventListener('submit', function (event) {
        const clubTitle = document.querySelector('input[name="clubTitle"]');
        const clubContents = document.querySelector('textarea[name="clubContents"]');

        if (clubTitle.value.trim() === '') {
            event.preventDefault();
            alert('제목을 입력해야 합니다.');
        }

        if (clubContents.value.trim() === '') {
            event.preventDefault();
            alert('내용을 입력해야 합니다.');
        }
    });
