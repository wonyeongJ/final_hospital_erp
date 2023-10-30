const insert = document.getElementById("insert");
const fileList = document.getElementById("fileList");
const delets = document.getElementsByClassName("delets");

// 이벤트 핸들러를 함수로 만들어 재사용 가능하게 만듭니다.
function addDeleteEventListener(deleteElement) {
    deleteElement.addEventListener("click", function () {
        let bfCd = this.getAttribute("data-delete-num");
        let bfFname = this.getAttribute("data-file-name"); // 파일 이름 가져오기
        let check = confirm("삭제시 복구 불가");

        if (check) {
            // GET 방식으로 파일 삭제 요청을 보냄
            fetch(`./fileDelete?bfCd=${bfCd}&bfFname=${bfFname}`, { // 파일 번호와 파일 이름 모두 전달
                method: "GET"
            })
                .then((result) => {
                    return result.text();
                })
                .then((r) => {
                    if (r.trim() == '1') {
                        // 파일 삭제 성공 시 해당 요소를 삭제합니다.
                        this.parentElement.remove();
                        location.reload();
                    } else {
                        // 파일 삭제 실패 시 오류 처리
                        alert("파일 삭제 실패");
                    }
                })
                .catch((error) => {
                    console.error("파일 삭제 오류:", error);
                });
        }
    });
}

// 모든 'delets' 클래스를 가진 요소에 대한 이벤트 핸들러를 추가합니다.
for (let i = 0; i < delets.length; i++) {
    let deleteElement = delets[i];
    let bfCd = deleteElement.getAttribute("data-delete-num");
    let bfFname = deleteElement.getAttribute("data-file-name"); // 파일 이름 가져오기
    deleteElement.setAttribute("data-file-name", bfFname); // 데이터 속성으로 파일 이름 추가
    addDeleteEventListener(deleteElement);
}

// 나머지 코드는 그대로 유지됩니다.


let max = 5;
let count = 0;

if (delets != null) {
    count = delets.length;
}

let idx = 0;

$("#fileList").on("click", ".df", function () {
    $(this).parent().remove();
    count--;
});

$("#insert").click(function () {
    if (count >= max) {
        alert("최대 5개만 가능");
        return;
    }
    count++;

    let r = '<div class="input-group mb-3" id="files' + idx + '">'
    r = r + '<input type="file" class="form-control" id="files" name="files">'
    r = r + '<span class="df" data-id="file' + idx + '">X</span>'
    r = r + "</div>";
    idx++;

    $("#fileList").append(r);
});
