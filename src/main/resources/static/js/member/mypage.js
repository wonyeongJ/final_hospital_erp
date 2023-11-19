$(document).ready(function() {
	let memCd = $("#memCd").text();
	let equipment = $("#equipment");
	$.ajax({
		url: "/member/equipmentlist",
		type: "get",
		async: false,
		data : {
			memCd: memCd
		},
		success: function(data) {
			equipment.append(data);
			    if($("#memIspwch").text().trim()<1){
        			alert("비밀번호를 변경해주세요!");
    			};

		}
	});
// 비밀번호 변경 이벤트
$("#updatePasswordBtn").on("click",function(){
    
    let newPassword =  $("#newPassword").val();
    let newPasswordConfirm =$("#newPasswordConfirm").val();
    

    // newPassword 가 정규식 표현을 일치하지않을시
    if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/.test(newPassword)) {

        alert('비밀번호는 영어, 특수문자, 숫자 조합이어야 하며 8자에서 16자 사이어야 합니다.');
    }else{ // new password가 정규식 표현 일치할시
        
        // newPassword 와 newPasswordConfirm이 일치하면 true의 값에 ! 를 넣었기때문에 일치하지않을때가 true
        if(!(newPassword == newPasswordConfirm)){
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

$("#stampUpdateBtn").on("click",function(){
    $("#stampUpdateFrm").submit();
    
})





// 근태 출근버튼 클릭시 이벤트
$("#commuteInsert").on("click",function(){
    let memCd = $("#memCd").text();
	$.ajax({
				url: "/commute/insert",
				type: "post",
				data : {
					memCd: memCd
				},
				success: function() {
					
					document.location.reload();

				}
			});
    
})

$("#commuteUpdate").on("click",function(){
    let updateCheck = confirm("정말 퇴근 하시겠습니까");
    let memCd = $("#memCd").text();
    if(updateCheck){
		$.ajax({
				url: "/commute/update",
				type: "post",
				data : {
					memCd: memCd
				},
				success: function() {
					
					document.location.reload();

				}
			});
	}
    
   
	
    
})


// $("#resetPasswordbtn").on("click",function(){
//     console.log("ssss");
//     $("#Medium-modal").show();
//     return false;
// })
});