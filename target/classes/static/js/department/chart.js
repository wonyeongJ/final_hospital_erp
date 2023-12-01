let datasource = {};
let chartList = {};



// 멤버 리스트 요청
$(document).ready(function(){
	// 병원장인거 가져오기
	$.ajax({
		url: "/member/memberListChart",
		type: "GET",
		dataType : 'json',
		async : false,
		success: function(ajaxData) {
			// 서버에서 반환한 MemberVO 객체를 사용

			data(ajaxData);
	
		}
	});

});

function data(data){
	let hospitalManager = data.find(function(mem){
		return mem.posCd === 8;
		});

		// 조직도 병원장은 최상단이므로 미리 값을 넣어놓기 children [] 배열에 팀장 넣어야됨
		let chartNode = {
			'name' : hospitalManager.memName,
			'title' : hospitalManager.posName,
			'children' : []
		}

		let member = [];
		// 팀장 팀원 객체 만들기
		data.forEach(function(mem){
			if(mem.posCd === 7){
				let obj = {
					'name' : mem.depName +"  " + mem.memName,
					'title' : mem.posName,
					'depCd' : mem.depCd,
					'children' : []
				}
				//팀장 객체는 병원장 객체 children에 바로 보내기
				chartNode.children.push(obj);
			}
			if(mem.posCd === 6) {
				let obj = {
					'name' : mem.depName +"  " + mem.memName,
					'title' : mem.posName,
					'depCd' : mem.depCd,
					'children' : []
				}
				member.push(obj);
			}	
		})
		// 팀원 객체를 꺼내서 팀장의 depCd와 비교해 맞으면 children 배열에 집어넣기
		member.forEach(function(mem){
			// console.log(mem);
			chartNode.children.forEach(function(chart){
				if(chart.depCd === mem.depCd){
					chart.children.push(mem);
				}
			})
	
		})
		
		data = JSON.stringify(chartNode,null,' ');
		chartList = chartNode;

		datasource = JSON.parse(data);

		$('#chart-container').orgchart({
			'data' : chartList,
			'depth' : 2,
			'nodeContent': 'title'
		});		
	
};


	

