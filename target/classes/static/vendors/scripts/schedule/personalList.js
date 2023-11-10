document.addEventListener('DOMContentLoaded', function() {
	
	$(function () {
                var request = $.ajax({
                    url: "/schedule/personalScheduleList", // 변경하기
                    method: "GET",
                    dataType: "json"
                });
                
				request.done(function (data) {
					var calendarEl = document.getElementById('calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
						height: 800,
						contentHeight: 600,
						headerToolbar : { // 헤더에 표시할 툴 바
							start : 'prev next today',
							center : 'title',
							end : 'dayGridMonth,dayGridWeek,dayGridDay'
						},
						//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
						selectable : true, // 달력 일자 드래그 설정가능
						droppable : true,
						editable : false,
						nowIndicator: true, // 현재 시간 마크
						locale: 'ko', // 한국어 설정
						// 추후 -> 이벤트 값을 변수화(상위에서 ajax로 db조회 후 json값으로 받아와 출력)
						events: data,
					dateClick: function(info) { 
						let date = info.dateStr
						location.replace('insert?date='+date)
					},
					eventClick: function(info) {
						var id = info.event.id;
						location.replace('data?schCd='+id)
					} 
					});
					calendar.render();
				});
			});
	
});

$('#personal-schedule-insert').click(function(){
	var check = confirm('등록 하시겠습니까?')
	
	if(check){
		let startTime = new Date($('#start').val());
		let endTime = new Date($('#end').val());
		let desc = $('#desc').val();
		
		let st = $('#start').val();
		let et = $('#end').val();
		let check1 = false;
		let check2 = false;
		let check3 = false;
		
		if(st.length != 0){
			check1 = true;
		}
		if(et.length != 0){
			check2 = true;
		}
		if(endTime >= startTime){
			check3 = true;
		}
		
		if(check1&&check2&&check3){
			$.ajax({
		  	type : 'post',
		    url : '/schedule/personalScheduleInsert',
		    async: false,
		    data : {
				schSdate : startTime,
				schEdate : endTime,
				schDesc : desc
			},
		    success : function(result) {
				if(result == 1){
					alert('일정이 등록 되었습니다.')
					location.reload();
				}else{
					alert('수술 일정 및 진료 예약 등의 일정과 시간이 겹칠 수 없습니다.')
				}
			}
	 		})
		}else{
			alert('입력하신 시간을 확인해주세요.');
		}
		
		
	}
});