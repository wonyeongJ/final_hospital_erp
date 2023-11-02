document.addEventListener("DOMContentLoaded", function () {
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
           fetch(`../fileDelete?bfCd=${bfCd}`, {
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
                     
                        location.reload();
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

let max = 5;
let count = 0;

if (delets != null) {
    count = delets.length;
}

let idx = 0;

insert.addEventListener("click", function () {
    if (count >= max) {
        alert("최대 5개만 가능");
        return;
    }
    count++;

    let inputGroup = document.createElement("div");
    inputGroup.className = "input-group mb-3";
    inputGroup.id = "files" + idx;

    let fileInput = document.createElement("input");
    fileInput.type = "file";
    fileInput.className = "form-control";
    fileInput.name = "files";

    let deleteButton = document.createElement("span");
    deleteButton.className = "df";
    deleteButton.setAttribute("data-id", "file" + idx);
    deleteButton.textContent = "X";

    inputGroup.appendChild(fileInput);
    inputGroup.appendChild(deleteButton);

    fileList.appendChild(inputGroup);

    // Delete file button click event
    deleteButton.addEventListener("click", function () {
        inputGroup.remove();
        count--;
    });

    idx++;
});
});


// Summernote 이미지 업로드 처리
$("#contents").summernote({
    height: 400,
    callbacks: {
        onImageUpload: function (files) {
            // 이미지를 서버에 업로드
            let formData = new FormData();
            formData.append("files", files[0]);
            
            $.ajax({
                type: "post",
                url: './contentsImgInsert',
                data: formData,
                enctype: 'multipart/form-data',
                cache: false,
                processData: false,
                contentType: false,
                success: function (result) {
                    // 서버에서의 이미지 경로를 에디터에 추가
                    var img = new Image();
                    img.src = result.trim();
                    img.style.maxWidth = '100%';
                    $('#contents').summernote('insertNode', img);
                },
                error: function () {
                    console.log('error');
                }
            });
        },
        // 이미지 삭제를 위한 처리
        onMediaDelete: function (target) {
            // 이미지 삭제 요청을 서버로 보내고 성공하면 이미지를 삭제합니다.
            let path = $(target[0]).attr("src"); // 이미지 경로
            console.log("del");
            $.ajax({
                type: 'post',
                url: './contentsImgDelete',
                data: {
                    path: path
                },
                success: function (result) {
                    console.log(result);
                    if (result.trim() === '1') {
                        // 이미지 삭제 성공 시 해당 이미지를 에디터에서도 삭제합니다.
                        $(target[0]).remove();
                    }
                },
                error: function () {
                    console.log('error');
                }
            });
        }
    }
});


