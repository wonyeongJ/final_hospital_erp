document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridDay', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
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
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko', // 한국어 설정
		// 추후 -> 이벤트 값을 변수화(상위에서 ajax로 db조회 후 json값으로 받아와 출력)
		events: [
      {
        title: '회의',
        start: '2023-10-25',
        backgroundColor: '#8B0000',
        borderColor:'#8B0000'
      },
      {
        title: '휴가',
        start: '2023-10-25',
        end: '2023-10-25',
        backgroundColor: '#008404',
        borderColor:'#008404'         
      }],
      dateClick: function() { 
		 window.open('add', '개인 일정 추가하기', 'width=800, height=750')
	  },
	  eventClick: function() {
		 window.open('detail', '개인 일정 상세 보기', 'width=800, height=750')
	  } 
	});
	calendar.render();
});