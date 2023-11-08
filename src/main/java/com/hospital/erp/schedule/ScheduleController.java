package com.hospital.erp.schedule;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.surgery.SurgeryVO;
import com.hospital.erp.util.TimeSetter;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private com.hospital.erp.surgery.SurgeryService SurgeryService;
	
	@Autowired
	private TimeSetter timeSetter;
	
	@GetMapping("insert") 
	public String scheduleInsert(String date, Model model) throws Exception{ 
		
		date = timeSetter.stringDateChanger2(date);
		model.addAttribute("date", date);
		
		return "schedule/insert";
		
	}
	
	@GetMapping("data") 
	public String scheduleData(ScheduleVO scheduleVO, Model model) throws Exception{ 
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
	    scheduleVO = scheduleService.scheduleData(scheduleVO);
	    
	    if(memberVO.getMemCd().equals(scheduleVO.getMemCd())) {
	    	scheduleVO.setStartNumString(timeSetter.localDateTimeToString(scheduleVO.getSchSdate(), "yyyy년 MM월 dd일 HH:mm"));
	    	scheduleVO.setEndNumString(timeSetter.localDateTimeToString(scheduleVO.getSchEdate(), "yyyy년 MM월 dd일 HH:mm"));
	    	if(scheduleVO.getCodeCd()==15) {
	    		SurgeryVO surgeryVO = new SurgeryVO();
	    		surgeryVO.setSurCd(scheduleVO.getSchFk());
	    		surgeryVO = SurgeryService.surgeryData(surgeryVO);
	    		scheduleVO.setSchDesc("수술실: " + surgeryVO.getSurNum() + "호"); 		
	    	}
	    	model.addAttribute("scheduleVO", scheduleVO);	
	    	return "schedule/data"; 
	    }
		return "schedule/personalList"; 
		
	}
	
	@GetMapping("personalList") 
	public String schedulePersonalList() throws Exception{ 
		   
		return "schedule/personalList"; 
	}
	
	@ResponseBody
	@GetMapping("personalScheduleList") 
	public List<Map<String, Object>> personalScheduleList() throws Exception{ 
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
		
		List<ScheduleVO> list = scheduleService.personalScheduleList(memberVO);
		
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        HashMap<String, Object> hash = new HashMap<>();
        
        for (int i = 0; i < list.size(); i++) {
        	CodeVO codeVO = scheduleService.codeData(list.get(i).getCodeCd());
        	String title = codeVO.getCodeName();
        	
            hash.put("title", title);
            hash.put("start", list.get(i).getSchSdate().minusMonths(1));
            hash.put("end", list.get(i).getSchEdate().minusMonths(1));
            hash.put("id", list.get(i).getSchCd());
            if(list.get(i).getCodeCd() == 15) {
            	hash.put("backgroundColor", "#2ECCFA");
            	hash.put("borderColor", "#2ECCFA");
            }else if(list.get(i).getCodeCd() == 16) {
            	hash.put("backgroundColor", "#FF8000");
            	hash.put("borderColor", "#FF8000");
            }else if(list.get(i).getCodeCd() == 18) {
            	hash.put("backgroundColor", "#F7FE2E");
            	hash.put("borderColor", "#F7FE2E");
            }else if(list.get(i).getCodeCd() == 25) {
            	hash.put("backgroundColor", "#64FE2E");
            	hash.put("borderColor", "#64FE2E");
            }
            
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }

		return jsonArr; 
	}
	
	@ResponseBody
	@PostMapping("personalScheduleInsert")
	public String personalScheduleInsert(Date schSdate, Date schEdate, String schDesc) throws Exception{ 
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
		
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setSchSdate(timeSetter.dateTolocalDateTime(schSdate));
		scheduleVO.setSchEdate(timeSetter.dateTolocalDateTime(schEdate));
		scheduleVO.setSchDesc(schDesc);
		scheduleVO.setMemCd(memberVO.getMemCd());
		scheduleVO.setCodeCd(25);
		scheduleVO.setSchFk(0);
		scheduleService.personalScheduleInsert(scheduleVO);

		return "1";
	}
	
	@ResponseBody
	@PostMapping("personalScheduleUpdate")
	public String personalScheduleUpdate(Date schSdate, Date schEdate, String schDesc, int schCd) throws Exception{ 
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
	    
	    ScheduleVO scheduleVO = new ScheduleVO();
	    scheduleVO.setSchCd(schCd);
	    scheduleService.personalScheduleDelete(scheduleVO);
	    
	    ScheduleVO scheduleVO2 = new ScheduleVO();
	    scheduleVO2.setSchSdate(timeSetter.dateTolocalDateTime(schSdate));
		scheduleVO2.setSchEdate(timeSetter.dateTolocalDateTime(schEdate));
		scheduleVO2.setSchDesc(schDesc);
		scheduleVO2.setMemCd(memberVO.getMemCd());
		scheduleVO2.setCodeCd(25);
		scheduleVO2.setSchFk(0);
		scheduleService.personalScheduleInsert(scheduleVO2);

		return "1";
	}
	
	@ResponseBody
	@PostMapping("personalScheduleDelete")
	public String personalScheduleDelete(ScheduleVO scheduleVO) throws Exception{ 
		
		scheduleService.personalScheduleDelete(scheduleVO);

		return "1";
	}
	
	@GetMapping("teamList") 
	public String scheduleTeamList() throws Exception{ 
		   
		return "schedule/teamList"; 
	}
	
}
