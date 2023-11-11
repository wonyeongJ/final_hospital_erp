// 비밀번호 변경 이벤트
$("#updatePasswordBtn").on("click",function(){
    
    let newPassword =  $("#newPassword").val();
    let newPasswordConfirm =$("#newPasswordConfirm").val();
    
    console.log(newPassword);
    console.log(newPasswordConfirm);

    // newPassword 가 정규식 표현을 일치하지않을시
    if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/.test(newPassword)) {
        console.log(newPassword);

        alert('비밀번호는 영어, 특수문자, 숫자 조합이어야 하며 8자에서 16자 사이어야 합니다.');
    }else{ // new password가 정규식 표현 일치할시
        
        // newPassword 와 newPasswordConfirm이 일치하면 true의 값에 ! 를 넣었기때문에 일치하지않을때가 true
        if(!(newPassword == newPasswordConfirm)){
            console.log(newPasswordConfirm);
            alert("비밀번호가 일치하지 않습니다.")
        }else { // 위 두조건을 충족할시
            $("#updatePasswordFrm").submit();
        }

    }
})

// 프로필 변경 event
$("#profileBtn").on("click",function(){
    $("#profileInsertFrm").submit();
    
})

// 비밀번호 변경하지 않고 mypage 접속 시
$(document).ready(function() {
    if($("#memIspwch").text().trim()<1){
        alert("비밀번호를 변경해주세요!");
    }
});

// 근태 출근버튼 클릭시 이벤트
$("#commuteInsert").on("click",function(){
    console.log("출근버튼 클릭");

    
})

// $("#resetPasswordbtn").on("click",function(){
//     console.log("ssss");
//     $("#Medium-modal").show();
//     return false;
// })