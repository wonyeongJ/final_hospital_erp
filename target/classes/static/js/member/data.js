$(document).ready(function() {
   $("#memberUpdateBtn").on("click",function(){
	  console.log("수정완료 버튼 클릭"); 
	  $("#memberUpdateFrm").submit(); 
   });
   
   $("#memberUpdateExpiredBtn").on("click",function(){
	  console.log("퇴사자 버튼 클릭"); 
	  $("#memberUpdateExpiredFrm").submit(); 
   });

       
          

    
});