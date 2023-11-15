$(document).ready(function() {
    $("#insertBtn").on('click',function(){
        console.log("버튼입력 이벤트")
        let memName = $('#memName').val();
        let memRnum1 = $('#memRnum1').val();
        let memRnum2 = $('#memRnum2').val();
        let memPnum1 = $('#memPnum1').val();
        let memPnum2 = $('#memPnum2').val();
        let memPnum3 = $('#memPnum3').val();
        let memEmail1 = $('#memEmail1').val();
        let memEmail2 = $('#memEmail2').val();
        let memSalary = $('#memSalary').val();
        
       

        let memRnumValue = memRnum1 + "-" + memRnum2;
        let memPnumValue = memPnum1 + "-" + memPnum2 + "-" + memPnum3;
        let memEmailValue = memEmail1 + "@" + memEmail2;
      
        let arrayValidResultCheck = [];

        if (!/^[가-힣]+$/.test(memName)) {
            console.log(memName);
            arrayValidResultCheck.push(false);
            alert('이름은 한글만 입력하세요.');
        }

        if (!/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/.test(memRnum1)) {
            console.log(memRnum1);
            arrayValidResultCheck.push(false);
            alert('주민등록번호 앞자리가 올바르지 않습니다.');
        }

        if (!/^[1-4][0-9]{6}$/.test(memRnum2)) {
            console.log(memRnum2);
            arrayValidResultCheck.push(false);
            alert('주민등록번호 뒷자리가 올바르지 않습니다.');
        }

        if (!/^01[016789]-[0-9]{4}-[0-9]{4}$/.test(memPnumValue)) {
            console.log(memPnumValue);
            arrayValidResultCheck.push(false);
            alert('핸드폰 번호가 올바르지 않습니다.');
        }

        if (memSalary < 0 || memSalary > 100000) {
            arrayValidResultCheck.push(false);
            alert('연봉은 0에서 100억 사이의 값을 입력하세요.');
        }

        if (!/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+$/.test(memEmailValue)) {
            console.log(memEmailValue);
            arrayValidResultCheck.push(false);
            alert('전체 이메일 주소 형식이 올바르지 않습니다.');
        }
        
        if ($("#memHdate").val() == ""){
			alert("입사일을 입력하세요.")
			arrayValidResultCheck.push(false);
		}

        // validResultcheck 배열 에서 false가 있다면 true가 담김 false 가 없으면 false이므로 정상 동작하게끔 짜주면 됨
        let validValue = arrayValidResultCheck.includes(false);
        console.log(validValue);

        // validValue는 false를 찾아서 값이 있으면 true를 넣어주기때문에 false일때가 정상적으로 검증이 끝났을 때다
        if(!validValue){
            $("#memRnum").val(memRnumValue);
            $("#memPnum").val(memPnumValue);
            $("#memEmail").val(memEmailValue);

            $("#memberInsertFrm").submit();
        }

        
    });

       
          

    
});