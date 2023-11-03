document.addEventListener("DOMContentLoaded", function () {
        const insert = document.getElementById("fileinsert");
        const fileList = document.getElementById("fileList");

        let idx = 0;

        insert.addEventListener("click", function () {
            let r = '<div class="mb-3" id="files' + idx + '">';
            r += '<label for="files" class="form-label">파일첨부</label>';
            r += '<input type="file" class="form-control" size=30 id="files" name="files">';
            r += '</div>';
            r += '<span class="df" data-id="file' + idx + '">x</span>';
            $("#fileList").append(r);
            idx++;
        });

        $("#fileList").on("click", ".df", function () {
            $(this).parent().remove();
        });

        $(".delets").each(function (i, e) {
            let num = this.getAttribute("data-delete-num");
            $(e).click(function () {
                $.ajax({
                    type: 'GET',
                    url: "./fileDelete",
                    data: {
                        bfCd: num
                    },
                    success: function (result) {
                        if (result.trim() == '1') {
							alert("삭제하시면 복구할수없습니다")						
                            $("#" + num).remove();
                            $(e).remove();
                        }
                    },
                    error: function () {
                        console.log("error");
                    }
                });
            });
        });
    });
$("#contents").summernote({
    height: 400,
    callbacks: {
        onImageUpload: function(files){
            alert('이미지 업로드');
            //이미지를 server로 전송하고
            //응답으로 이미지경로와 파일명을 받아서
            //img 태그를 만들어서 src속성에 이미지 경로를 넣는것
            let formData = new FormData(); // <form></form>
            formData.append("files",files[0]); // <input type="file" name="files"> 를 폼안에 추가

            $.ajax({
                type:"post",
                url:'./contentsImginsert',
                data:formData,
                enctype: 'multipart/form-data',
                cache: false,
                processData: false,
                contentType: false,
                success:function(result){
                    console.log(result)
                    $("#contents").summernote('insertImage', result.trim());
                },
                error:function(){
                    console.log('error');
                }	
            });

        },
        onMediaDelete:function(files){
            let path = $(files[0]).attr("src"); // /Users/mook/Desktop/upload/ 파일저장 경로
            console.log("del");
            $.ajax({
                type:'post',
                url:'./contentsImgDelete',
                data:{
                    path:path
                },
                success:function(result){
                    console.log(result);
                },
                error:function(){
                    console.log('error');
                }
            })
        }

    }
})