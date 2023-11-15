$(document).ready(function() {
    $("#patientUpdateBtn").on('click',function(){
        console.log("버튼입력 이벤트")
        let patName = $('#patName').val();
        let patRnum = $('#patRnum').val();
        let patRnum1 = $('#patRnum').val().substring(0,6);
        let patRnum2 = $('#patRnum').val().substring(7);
       
        let patPnum = $('#patPnum').val();
 
        console.log("patName",patName);
        console.log("patRnum",patRnum);
        console.log("patRnum1",patRnum1);
        console.log("patRnum2",patRnum2);
        console.log("patPnum",patPnum);
       
       

      
       
      
        let arrayValidResultCheck = [];

        if (!/^[가-힣]+$/.test(patName)) {
            console.log(patName);
            arrayValidResultCheck.push(false);
            alert('이름은 한글만 입력하세요.');
        }
		let regex = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
		
        if (!regex.test(patRnum1)) {
            console.log(patRnum1);
            arrayValidResultCheck.push(false);
            alert('주민등록번호 앞자리가 올바르지 않습니다.');
        }

        if (!/^[1-4][0-9]{6}$/.test(patRnum2)) {
            console.log(patRnum2);
            arrayValidResultCheck.push(false);
            alert('주민등록번호 뒷자리가 올바르지 않습니다.');
        }

        if (!/^01[016789]-[0-9]{4}-[0-9]{4}$/.test(patPnum)) {
            console.log(patPnum);
            arrayValidResultCheck.push(false);
            alert('핸드폰 번호가 올바르지 않습니다.');
        }



        // validResultcheck 배열 에서 false가 있다면 true가 담김 false 가 없으면 false이므로 정상 동작하게끔 짜주면 됨
        let validValue = arrayValidResultCheck.includes(false);
        console.log(validValue);

        // validValue는 false를 찾아서 값이 있으면 true를 넣어주기때문에 false일때가 정상적으로 검증이 끝났을 때다
        if(!validValue){
         
            $("#patientUpdateFrm").submit();
        }

        // 방문날짜와 방문부서 입력후 selectbox에 진료 가능한 의사 목록 가져오기
        
        
    });

       
          

    
});