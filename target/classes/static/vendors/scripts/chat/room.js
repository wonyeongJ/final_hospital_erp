const socket = new WebSocket("ws://localhost:82/ws/chat");
	
	let user = $('#my').attr("data-user");
	let name = $('#my').attr("data-name");
	
	socket.onopen = function (e) {
		console.log('open server!');
    };
    
	$('#button-send').click(function(){
		let roomNum = $('#button-send').attr("data-room");
		let num = $('#button-send').attr("data-receiver");
		send(roomNum, num);
	});
	
	$("#listBox").on("click", ".chatList", function(){
		//회원번호
		let memCd=$(this).attr("data-empNum");
		let name=$(this).attr("data-name");
		
		$('#someone').attr("data-name", name);
		//db에서 방있는지 확인!
		roomCheck(memCd);
		return false;	
	});

	
    
    socket.onclose=function(e){
        console.log('disconnet');
    };

    socket.onerror = function (e){
        console.log(e);
    };
	
	socket.onmessage=function(msg){
		let jsonObj = JSON.parse(msg.data);
		let one = $('#someone').attr("data-name");
		console.log("dddd",user);
		console.log(jsonObj);
		
		// sender, message, chatdate
		let msgTag = "";
		if(user==jsonObj.sender){
			msgTag = '<div class="alert alert-primary msg" role="alert"><div>'
					 +name+'</div><div>'
					 +jsonObj.message+'</div></div><div id="chatDate">'+jsonObj.chatDate+'</div>';
		}else{
			console.log("상대방"+one);
			msgTag = '<div style="background-color:white;" class="alert msg" role="alert"><div>'
						 +one+'</div><div>'
						 +jsonObj.message+'</div></div><div id="chatDate">'+jsonObj.chatDate+'</div>';
		}
		
		$('#msgArea').append(msgTag);

		// 보내온 값에서 방번호를 보내기 버튼의 속성에 저장해줌
		$('#button-send').attr("data-room",jsonObj.roomNum);
		$('#button-send').attr("data-receiver",jsonObj.receiver);
	};
	
	$('#search').click(function(){
		
		//socket.close();
		
		let memName = $("#searchName").val();
		
		console.log(memName);
		$('#listBox').empty();
		getSearch(memName);

	})
	
	function roomCheck(memCd){
		
			$.ajax({
			type:"get",
			url:"./roomCheck",
			data:{
				"user2":memCd
			},
			success:function(response){
				
				if(response>0){
					console.log("방이있음"+response);
					
					enterRoom(socket, memCd, response);
				}else{
					console.log("방이없음"+response);
					
					createRoom(memCd);
				}
			},
			error:function(){
				console.log("ajax 실패");
			}
			})	
	}
	
	function enterRoom(socket,memCd, roomNum){
		$('#msgArea').empty();
		//대상의 사진, 이름, 직책을 가져옴
		getSomeone(memCd);
		
		let chatDate = getTodayDate();
	    let enterMsg={"type" : "ENTER","roomNum":roomNum,"receiver":memCd,"message":"","chatDate":chatDate};
	    socket.send(JSON.stringify(enterMsg));
	}
	
	function send(roomNum, memCd) {
    let content = document.querySelector('#msg').value.trim(); // trim()을 사용하여 앞뒤 공백 제거
    if (content !== '') { // 공백이 아닌 경우에만 전송
        console.log(memCd);
        let chatDate = getTodayDate();
        let talkMsg = {"type": "TALK", "roomNum": roomNum, "receiver": memCd, "message": content, "chatDate": chatDate};
        socket.send(JSON.stringify(talkMsg));
        document.querySelector('#msg').value = ''; // 전송 후 입력 필드 초기화
    }
}
	
	//방나가기  function quit(){
	
	function createRoom(memCd){
		$.ajax({
			type:"post",
			url:"./createRoom",
			data:{
				"user2":memCd
			},
			success:function(response){
				
				console.log("before"+response);
				
				if (response > 0){
					console.log("방이 만들어졌습니다"+response);
					//return false;
				} else {
					console.log("방이만들어지지않았습니다."+response);
					//return false;
					
				}
				
			},
			error:function(){
				console.log("ajax 실패");
			}
		})
	}
	
	function getTodayDate() {
	    let today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)
	
	    let year = today.getFullYear();
	    let month = ('0' + (today.getMonth() + 1)).slice(-2); 
	    let day = ('0' + today.getDate()).slice(-2);
		let hours = ('0' + today.getHours()).slice(-2); 
 		let minutes = ('0' + today.getMinutes()).slice(-2);
		//let seconds = ('0' + today.getSeconds()).slice(-2); 
	    
	    let dateString = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes; 
		
		console.log(dateString);

	    return dateString;
	}
	
	function getSearch(memName){
		
			$.ajax({
			type:"get",
			url:"./search",
			data:{
				"memName":memName
			},
			success:function(response){
				                	
				
				if (response.list != null) {
				console.log("list 가져옴");
												
				searchList = response.list;
				
				$.each(searchList, function( index, value ) {
                	let a = '<a href="#" class="chatList" data-empNum="'+value.memCd+'">'+value.memName+'</a><br>'

                    $('#listBox').append(a);
                });
				} else {
				console.log("list 가져오기 실패");
				}
				
			},
			error:function(){
				console.log("ajax 실패");
			}
			})	
	}
	
	function getSomeone(memCd){
		console.log("someone",memCd);
		$.ajax({
			type:"get",
			url:"./getsomeone",
			data:{
				"memCd":memCd
			},
			success:function(response){
				
				if (response != null) {
				console.log("대상정보 가져옴"+ response.one.memCd);
						
				$('#someone').text(response.one.memCd);
				
				} else {
				console.log("list 가져오기 실패");
				}
				
			},
			error:function(){
				console.log("ajax 실패");
			}
			})	
		
	}