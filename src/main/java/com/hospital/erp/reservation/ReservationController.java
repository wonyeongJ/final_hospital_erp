package com.hospital.erp.reservation;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.member.MemberService;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.patient.PatientService;
import com.hospital.erp.patient.PatientVO;

import lombok.extern.slf4j.Slf4j;

/*
 * From 서동휘
 * 진료 예약 controller
 */
@Controller
@RequestMapping("/reservation/*")
@Slf4j
public class ReservationController {
	
	@Autowired
	private PatientService patientService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReservationService reservationService;
	
	//진료 내역 리스트 요청 메서드
	@GetMapping("list")
	public String reservationList(Model model) throws Exception {
		List<ReservationVO> reservationAr = reservationService.reservationList();
		model.addAttribute("reservationAr", reservationAr);
		return "reservation/list";
	}
	
	//진료 예약 추가 폼 요청 메서드
	@GetMapping("insert")
	public String reservationInsert(PatientVO patientVO,Model model) throws Exception {
		patientVO = patientService.patientData(patientVO);
		model.addAttribute("patientVO", patientVO);
		return "reservation/insert";
	}
	
	//진료 예약 추가 요청 메서드
	@PostMapping("insert")
	public String reservationInsert(ReservationVO reservationVO) throws Exception {
		int result1 = reservationService.reservationInsert(reservationVO);
		reservationService.scheduleInsert(reservationVO);
		return "redirect:/patient/data?patCd="+reservationVO.getPatCd();
	}
	
	//진료 예약 수정 폼 요청 메서드
	@GetMapping("update")
	public String reservatioinUpdate(ReservationVO reservationVO,Model model) throws Exception {
		log.info("update get reservationVO {}",reservationVO);
		reservationVO = reservationService.reservationData(reservationVO);
		model.addAttribute("reservationVO", reservationVO);
		PatientVO patientVO = new PatientVO();
		patientVO.setPatCd(reservationVO.getPatCd());
		patientVO = patientService.patientData(patientVO);
		log.info("===========patientVO {}",patientVO);
		model.addAttribute("patientVO", patientVO);
		
		
		// 1. URL을 만들기 위한 StringBuilder.
        StringBuilder urlBuilder = new StringBuilder("http://api.odcloud.kr/api/15090584/v1/uddi:39290762-80a6-4568-bedf-a82df17a5ec9?page=1&perPage=8943&serviceKey=UiMzrPzzB%2BfoxLvhMW5sj5Lo1wjj4Ul4ELv5JY%2BO03RbkltQ69twhVLedyD3vwUb%2FDpiLOdSO8qsDJhRWFiv1g%3D%3D"); /*URL*/
        // 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
        // urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode("testkey", "UTF-8")); /*Service Key*/
        // urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        // urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        // 3. URL 객체 생성.
        URL url = new URL(urlBuilder.toString());
        // 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        // 5. 통신을 위한 메소드 SET.
        conn.setRequestMethod("GET");
        // 6. 통신을 위한 Content-type SET. 
        conn.setRequestProperty("Content-type", "application/json");
        // 7. 통신 응답 코드 확인.
        System.out.println("Response code: " + conn.getResponseCode());
        // 8. 전달받은 데이터를 BufferedReader 객체로 저장.
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        // 10. 객체 해제.
        rd.close();
        conn.disconnect();
        // 11. 전달받은 데이터 확인.
//      System.out.println(sb.toString());
        
        JSONParser jsonParser = new JSONParser();
        // JSONParser jsonParser = new org.json.simple.parser.JSONParser();
        Object obj = jsonParser.parse(sb.toString());
        JSONObject jsonObj = (JSONObject) obj;      
        JSONArray drugArray = (JSONArray) jsonObj.get("data");

        @SuppressWarnings("serial")
		List<String> drugStringList = new ArrayList<>(){
            {
            	for(int i = 0; i < drugArray.size(); i++) {
            		JSONObject drugJsonObj = (JSONObject) jsonParser.parse(drugArray.get(i).toString());
            		add(drugJsonObj.get("약품명").toString());
            	}
            }
        };

        model.addAttribute("drugs", drugStringList);	
		
		return "reservation/update";
	}
	
	@PostMapping("update")
	public String reservationUpdate(ReservationVO reservationVO, int patCd) throws Exception {
		int result = reservationService.reservationUpdate(reservationVO);
		return "redirect:../patient/data?patCd="+patCd;
	}
	
	// 해당시간 가능한 의사 조회해오기
	@PostMapping("search")
	@ResponseBody
	public List<MemberVO> memberDoctorList(ReservationVO reservationVO) throws Exception {
		log.info("==========ReservationVO Search {} ========",reservationVO);
		List<MemberVO> memberAr =  memberService.memberDoctorList(reservationVO);
		return memberAr;
	}
	
	//진료 삭제 메서드
	@GetMapping("delete")
	public String reservationDelete(ReservationVO reservationVO, Model model, int patCd) throws Exception {
		reservationService.reservationDelete(reservationVO);
		return "redirect:../patient/data?patCd="+patCd;
	}
	
}
