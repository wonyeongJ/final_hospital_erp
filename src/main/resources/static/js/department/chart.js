
// 멤버 리스트 요청

$(document).ready(function(){
	console.log("ready")
	$.ajax({
		url: "/member/memberChart",
		type: "GET",
		success: function(data) {
			// 서버에서 반환한 MemberVO 객체를 사용
			console.log(data);
		}
	});
})

var datasource = {
			  'name': '서동휘',
			  'title': '병원장',
			  'children': [
			    { 'name': 'Bo Miao', 'title': 'department manager' },
			    { 'name': 'Su Miao', 'title': 'department manager',
			      'children': [
			        { 'name': 'Tie Hua', 'title': 'senior engineer' },
			        { 'name': 'Hei Hei', 'title': 'senior engineer' }
			      ]
			    },
			    { 'name': 'Hong Miao', 'title': 'department manager' },
			    { 'name': 'Chun Miao', 'title': 'department manager' }
			  ]
			};
	
			$('#chart-container').orgchart({
			  'data' : datasource,
			  'nodeContent': 'title'
			});