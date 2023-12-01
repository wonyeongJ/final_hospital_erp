package com.hospital.erp.drug;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@Controller
@RequestMapping("/drug/*")
public class DrugController {
	
	@GetMapping("list") 
	public String equipmentList(Model model, String page) throws Exception{ 
		
		if(page==null) {
			page = "1";
		}
		if(Integer.parseInt(page) > 6 || Integer.parseInt(page) <= 0) {
			page = "1";
		}
		// 1. URL을 만들기 위한 StringBuilder.
        StringBuilder urlBuilder = new StringBuilder("http://api.odcloud.kr/api/15090584/v1/uddi:39290762-80a6-4568-bedf-a82df17a5ec9?page="+ page +"&perPage=8943&serviceKey=UiMzrPzzB%2BfoxLvhMW5sj5Lo1wjj4Ul4ELv5JY%2BO03RbkltQ69twhVLedyD3vwUb%2FDpiLOdSO8qsDJhRWFiv1g%3D%3D"); /*URL*/
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
		
		return "drug/list";
		
	}
	
}