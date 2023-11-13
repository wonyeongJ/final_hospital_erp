const socket = new WebSocket("ws://localhost:82/ws/chat");
	
	let user = $('#my').attr("data-user");
	let name = $('#my').attr("data-name");
	let listBoxCh = $('#listBox').children();
	
	socket.onopen = function (e) {
		console.log('open server!');
    };
    
	$('#button-send').click(function(){
		let roomNum = $('#button-send').attr("data-room");
		let num = $('#button-send').attr("data-receiver");
		send(roomNum, num);
	});
	
	$("#listBox").on("click", ".chatList", function () {
    let memCd = $(this).attr("data-empNum");
    let name = $(this).text();  // 수정된 부분

    $('#someone').attr("data-name", name);

    roomCheck(memCd);
    return false;
	});
	$("#msg").on("keyup", function(event) {
	    if (event.key === "Enter") {
	        let roomNum = $('#button-send').attr("data-room");
	        let num = $('#button-send').attr("data-receiver");
	        send(roomNum, num);
	    }
	});

	
    
    socket.onclose=function(e){
        console.log('disconnet');
    };

    socket.onerror = function (e){
        console.log(e);
    };
	
	socket.onmessage = function (msg) {
    let jsonObj = JSON.parse(msg.data);
    let one = $('#someone').attr("data-name");

    // sender, message, chatdate
    let msgTag = "";
    if (user == jsonObj.sender) {
        msgTag = '<div class="alert alert-primary myMsg msg text-end" role="alert" style="text-align: right;"><div>' +
            '나' + '</div><hr style="margin: 5px 0;">' +
            '<div>' + jsonObj.message + '</div><div id="chatDate" style="text-align: right;">' + jsonObj.chatDate + '</div></div>';
    } else {
        msgTag = '<div style="background-color:white;" class="alert yourMsg msg text-start" role="alert" style="text-align: left;"><div>' +
            one + '님의 메세지</div><hr style="margin: 5px 0;">' +
            '<div>' + jsonObj.message + '</div><div id="chatDate" style="text-align: left;">' + jsonObj.chatDate + '</div></div>';
    }

    $('#msgArea').append(msgTag);

    // 보내온 값에서 방번호를 보내기 버튼의 속성에 저장해줌
    $('#button-send').attr("data-room", jsonObj.roomNum);
    $('#button-send').attr("data-receiver", jsonObj.receiver);

    // 메시지를 받은 후에 스크롤 함수 호출
    scrollToBottom();
	};
	
	$("#searchName").on("keyup", function(event) {
	    if (event.key === "Enter") {
	       
	       let memName = $("#searchName").val();
		
			$('#listBox').empty();
			getSearch(memName);

	

	    }
	});

	$('#search').click(function(){
		
		//socket.close();
		
		let memName = $("#searchName").val();
		
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
		
		$('#listBox').empty();
		
		$('#listBox').append(listBoxCh);
		
		let chatDate = getTodayDate();
	    let enterMsg={"type" : "ENTER","roomNum":roomNum,"receiver":memCd,"message":"","chatDate":chatDate};
	    socket.send(JSON.stringify(enterMsg));
	}
	
	// send 함수 수정
	function send(roomNum, memCd) {
	    let content = document.querySelector('#msg').value.trim();
	    if (content !== '') {
	        let chatDate = getTodayDate();
	        let talkMsg = {"type": "TALK", "roomNum": roomNum, "receiver": memCd, "message": content, "chatDate": chatDate};
	        socket.send(JSON.stringify(talkMsg));
	        document.querySelector('#msg').value = ''; // 전송 후 입력 필드 초기화
	    }
	}
	
	// 메시지 전송 후 스크롤을 맨 아래로 이동하는 함수
	function scrollToBottom() {
	    // 채팅창의 맨 아래로 스크롤
	    $('#msgArea').scrollTop($('#msgArea')[0].scrollHeight);
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
		

	    return dateString;
	}
	
	function getSearch(memName) {
    $.ajax({
        type: "get",
        url: "./search",
        data: {
            "memName": memName
        },
        success: function (response) {
            if (response.list != null) {

                searchList = response.list;

                
                
                $('#listBox').empty(); 
              

               $.each(searchList, function (index, value) {
				    let a = '<a href="#" class="chatList" data-empNum="' + value.memCd + '">' + value.depName + " (" + value.jobName + ") : " + value.memName + '</a><br>';
				    $('#listBox').append(a);
				});
	            } else {
	                console.log("list 가져오기 실패");
	            }
	        },
	        error: function () {
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
						
				// 아이콘과 사용자 이름을 함께 보여주는 HTML 문자열 생성
                let userDisplay = '<i class="icon-copy fa fa-user-circle" aria-hidden="true"></i> ' + response.one.memName +'님의 채팅';

                // 결과를 특정 요소에 설정
                $('#someone').html(userDisplay);
				
				} else {
				console.log("list 가져오기 실패");
				}
				
			},
			error:function(){
				console.log("ajax 실패");
			}
			})	
		
	}