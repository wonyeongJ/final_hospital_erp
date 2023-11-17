package com.hospital.erp.emergency;

import lombok.extern.log4j.Log4j2;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.XML;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("emergency/*")
@Log4j2
public class EmergencyController {
    //카카오 api key
    @Value("${kakao.key}")
    private String key;

    /**
     * 전국 응급의료기관 정보 조회 메서드
     * 전원영
     */
    @GetMapping("list")
    public String emergencyList(HttpServletRequest request, Model model) throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Fu5%2BVAirZBDQDFm94p%2FR%2FyncH71nRfRG5CZwwGX9d1%2FhX4cr6fu6%2B%2BwGuAWMOug2vFV0%2BJ8QZPBrkh4lxuu45w%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("STAGE1","UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8")); /*주소(시도)*/
//        urlBuilder.append("&" + URLEncoder.encode("STAGE2","UTF-8") + "=" + URLEncoder.encode("구로구", "UTF-8")); /*주소(시군구)*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();
        log.error(sb.toString());

        JSONObject jsonObject = XML.toJSONObject(sb.toString());
        log.error(jsonObject);
        JSONObject res = (JSONObject) jsonObject.get("response");
        JSONObject bd = (JSONObject) res.get("body");
        JSONObject items = (JSONObject) bd.get("items");
        JSONArray item = (JSONArray) items.get("item");

        log.error(items);
        log.error(item);

        List<EmergencyVO> arr = new ArrayList<EmergencyVO>();

        for (int i = 0; i < item.length(); i++) {
            JSONObject jsonObj = (JSONObject) item.get(i);
            log.error(jsonObj);
            EmergencyVO emergencyVO = new EmergencyVO();
            emergencyVO.setHpid(jsonObj.getString("hpid"));
            emergencyVO.setHvec(String.valueOf(jsonObj.getInt("hvec")));
            emergencyVO.setHvamyn(jsonObj.getString("hvamyn"));
            emergencyVO.setDutyname(jsonObj.getString("dutyName"));
            emergencyVO.setDutytel3(jsonObj.getString("dutyTel3"));
            log.error(emergencyVO);

            arr.add(emergencyVO);
        }
        log.error(arr);

        for (int i = 0; i < arr.size(); i++) {
            String dutyAddr = hospitalData(arr.get(i).getHpid());
            arr.get(i).setDutyAddr(dutyAddr);
        }

        log.info("vo type list data set success ---> "+ arr);

        model.addAttribute("list", arr);
        model.addAttribute("key", key);
        return "emergency/list";
    }

    /**
     * 병원코드(hpid)를 받아서 병원 주소를 리턴하는 메서드
     * 전원영
     */
    public String hospitalData(String hpid) throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEgytBassInfoInqire"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Fu5%2BVAirZBDQDFm94p%2FR%2FyncH71nRfRG5CZwwGX9d1%2FhX4cr6fu6%2B%2BwGuAWMOug2vFV0%2BJ8QZPBrkh4lxuu45w%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode(hpid, "UTF-8")); /*기관ID*/
        //단건 조회 (index 걸렸을까 싶어서 페이지, 로우 1씩 보냄)
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*목록 건수*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.error("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }

        rd.close();
        conn.disconnect();
        log.error(sb.toString());

        //XML(String) to JSON
        JSONObject jsonObject = XML.toJSONObject(sb.toString());
        log.error(jsonObject);

        //JSON object에서 주소를 꺼내려는 멍청한 짓
        JSONObject res = (JSONObject) jsonObject.get("response");
        JSONObject bd = (JSONObject) res.get("body");
        JSONObject items = (JSONObject) bd.get("items");
        JSONObject item = (JSONObject) items.get("item");
        String dutyAddr = (String) item.get("dutyAddr");

        //주소(String) 리턴
        return dutyAddr;
    }

    

}
