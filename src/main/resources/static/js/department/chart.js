let datasource = {};
let chartList = {};
let data = "";

$.ajax({
	url: "/member/memberListChart",
	type: "GET",
	dataType : 'json',
	success: function(ajaxdata) {
		// 서버에서 반환한 MemberVO 객체를 사용
		console.log(ajaxdata);
		data = ajaxdata;

	}
});
// 멤버 리스트 요청
$(document).ready(function(){
	console.log("ready")
	// 병원장인거 가져오기
	console.log(data);
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

	console.log(data);
	console.log(typeof data);
	datasource = JSON.parse(data);
	console.log(typeof datasource);
	console.log(chartList);
	console.log(typeof chartList);

})




let datasource3 = {
 "name": "서동휘",
 "title": "병원장",
 "children": [
  {
   "name": "외과  박병웅",
   "title": "팀장",
   "depCd": 3,
   "children": [
    {
     "name": "외과  테스트2",
     "title": "팀원",
     "depCd": 3,
     "children": []
    },
    {
     "name": "외과  테스트123",
     "title": "팀원",
     "depCd": 3,
     "children": []
    },
    {
     "name": "외과  테스트1234",
     "title": "팀원",
     "depCd": 3,
     "children": []
    }
   ]
  },
  {
   "name": "인사과  최경묵",
   "title": "팀장",
   "depCd": 2,
   "children": [
    {
     "name": "인사과  전원영",
     "title": "팀원",
     "depCd": 2,
     "children": []
    },
    {
     "name": "인사과  컴포즈",
     "title": "팀원",
     "depCd": 2,
     "children": []
    },
    {
     "name": "인사과  사무직이면서기안자",
     "title": "팀원",
     "depCd": 2,
     "children": []
    },
    {
     "name": "인사과  최경묵",
     "title": "팀원",
     "depCd": 2,
     "children": []
    },
    {
     "name": "인사과  인사과1",
     "title": "팀원",
     "depCd": 2,
     "children": []
    },
    {
     "name": "인사과  인사과테스트계정",
     "title": "팀원",
     "depCd": 2,
     "children": []
    }
   ]
  }
 ]
}



$('#chart-container').orgchart({
	'data' : datasource,
	'nodeContent': 'title'
});
	
	

