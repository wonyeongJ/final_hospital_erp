$(document).ready(function() {
    $('#not_contents').summernote({
        height: 200, // 디자인에 맞게 높이 설정
        placeholder: '내용 입력',
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline']],
            ['para', ['ul', 'ol']],
            ['insert', ['link']],
            ['view', ['fullscreen']],
        ]
    });
});