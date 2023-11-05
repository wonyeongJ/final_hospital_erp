// 폼 제출 전 필수 조건 확인
document.getElementById('btn-update').addEventListener('click', function (event) {
    const clubTitle = document.querySelector('input[name="clubTitle"]');
    const clubContents = document.querySelector('textarea[name="clubContents"]');
    const clubPersonnel = document.querySelector('input[name="clubPersonnel"]');

    if (clubTitle.value.trim() === '') {
        event.preventDefault();
        alert('제목을 입력해야 합니다.');
    }

    if (clubContents.value.trim() === '') {
        event.preventDefault();
        alert('내용을 입력해야 합니다.');
    }

    if (parseInt(clubPersonnel.value) < 2) {
        event.preventDefault();
        alert('모집 인원은 2 이상이어야 합니다.');
    }
});

// JavaScript를 사용하여 모집 인원 최소값 설정
const maxParticipantsInput = document.getElementById("clubPersonnel");
const decreaseButton = document.getElementById("decrease");
const increaseButton = document.getElementById("increase");
const currentMembers = parseInt(document.getElementById("currentMembers").value);

maxParticipantsInput.min = currentMembers >= 2 ? currentMembers : 2;

decreaseButton.addEventListener("click", () => {
    const currentParticipants = parseInt(maxParticipantsInput.value);
    if (currentParticipants > currentMembers) {
        maxParticipantsInput.value = currentParticipants - 1;
    }
});

increaseButton.addEventListener("click", () => {
    maxParticipantsInput.value = parseInt(maxParticipantsInput.value) + 1;
});
