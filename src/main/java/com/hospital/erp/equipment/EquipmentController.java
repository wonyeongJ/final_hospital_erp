package com.hospital.erp.equipment;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.util.TimeSetter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/equipment/*")
public class EquipmentController {
	
	@Autowired
	private EquipmentService equipmentService;
	
	@Autowired
	private TimeSetter timeSetter;
	
	@GetMapping("data/*") 
	public String equipmentData(HttpServletRequest request, CodeVO codeVO, EquipmentVO equipmentVO, Model model) throws Exception{ 
		
		StringBuffer urll = request.getRequestURL();
		String url2 = urll.toString();
		String[] url3 = url2.split("/");
		String stringEquCd = url3[url3.length-1];
		int selectedEquCd = Integer.parseInt(stringEquCd);
		
		// equCd로 codeCD를 포함한 해당 equipment의 인스턴스를 조회
		equipmentVO.setEquCd(selectedEquCd);
		equipmentVO = equipmentService.equipmentData(equipmentVO);
		
		// equipmentVO의 equPdate를 보여주기 위한 패턴으로 변경
		String pDate = timeSetter.localDateTimeToString(equipmentVO.getEquPdate(), "yyyy년 MM월 dd일");
		
		// 해당 equipment의 항목(카테고리) 조회
		codeVO.setCodeCd(equipmentVO.getCodeCd());
		codeVO = equipmentService.equipmentCodeData2(codeVO);
		
		// 해당 equipment에 대한 대여 history를 조회
		List<EquipmentHistoryVO> equipmentHistoryVO = equipmentService.historyList(equipmentVO);
		
		// equipmentHistoryVO의 내용을 보여주기 데이터 패턴으로 변경
		for(int i = 0; i< equipmentHistoryVO.size(); i++) {
			MemberVO memberVO = equipmentService.memberData(equipmentHistoryVO.get(i).getMemCd());	
			String Sdate = timeSetter.localDateTimeToString(equipmentHistoryVO.get(i).getEhSdate(), "yyyy년 MM월 dd일");
			String Redate = timeSetter.localDateTimeToString(equipmentHistoryVO.get(i).getEhRedate(), "yyyy년 MM월 dd일");
			equipmentHistoryVO.get(i).setMemName(memberVO.getMemName());
			equipmentHistoryVO.get(i).setProcessedSdate(Sdate);
			equipmentHistoryVO.get(i).setProcessedRedate(Redate);
		}
		
		List<CodeVO> categories = equipmentService.categoriesList();
		model.addAttribute("categories", categories);
		
		// Date processedPdate = timeSetter.LocalDateTimetoDate(equipmentVO.getEquPdate());
		
		model.addAttribute("equipmentVO", equipmentVO);
		model.addAttribute("codeVO", codeVO);
		model.addAttribute("pDate", pDate);
		model.addAttribute("equipmentHistory", equipmentHistoryVO);
		// model.addAttribute("processedPdate", processedPdate);
		
		return "equipment/data";
	}
	
	@GetMapping("list") 
	public String equipmentList(Model model, CodeVO codeVO) throws Exception{ 
		
		List<EquipmentVO> allEquipments = null;
		
		// 비품 리스트 조회
		if(codeVO.getCodeName()==null) { 
			allEquipments = equipmentService.equipmentList();
		}else {
			allEquipments = equipmentService.equipmentListCategorySelected(codeVO);
		}
		
		// 비품 항목 조회 
		List<CodeVO> categories = equipmentService.categoriesList();
		
		model.addAttribute("allEquipments", allEquipments);
		model.addAttribute("categories", categories);
		
		return "equipment/list";
	}
	
	@ResponseBody
	@PostMapping("codeUpdate")
	public String equipmentCodeCdUpdate(CodeVO codeVO)throws Exception{
		
		equipmentService.codeUpdate(codeVO);
		
		String st = "list";
		return st;
	}
	
	@ResponseBody
	@PostMapping("codeInsert")
	public String equipmentCodeCdInsert(CodeVO codeVO)throws Exception{
		
		equipmentService.codeInsert(codeVO);
		
		String st = "list";
		return st;
	}
	
	@ResponseBody
	@PostMapping("codeDelete") // 논리삭제  
	public String equipmentCodeCdDelete(CodeVO codeVO)throws Exception{
		
		equipmentService.codeDelete(codeVO);
		String st = "list";
		return st;
	}
	
	@ResponseBody
	@PostMapping("insert")
	public String equipmentInsert(CodeVO codeVO, EquipmentVO equipmentVO, Date date)throws Exception{
		
		EquipmentVO equipmentVOforInsert = new EquipmentVO();
		// codeName으로 codeCd 조회한 후, codeCd, equSnum, perchaseDate로 Equipment insert 
		
		codeVO = equipmentService.equipmentCodeData(codeVO);
		
		equipmentVOforInsert.setCodeCd(codeVO.getCodeCd());
		equipmentVOforInsert.setEquSnum(equipmentVO.getEquSnum());

        LocalDateTime perchaseDate = timeSetter.DateTolocalDateTime(date);
       
        equipmentVOforInsert.setEquPdate(perchaseDate);
        
        equipmentService.equipmentInsert(equipmentVOforInsert);
		
		return "list";
	}
	
	@ResponseBody
	@PostMapping("delete") // 논리삭제  
	public String equipmentDelete(EquipmentVO equipmentVO)throws Exception{
		
		equipmentService.equipmentDelete(equipmentVO);
		
		String st = String.valueOf(equipmentVO.getEquCd());
		return st+" deleted";
	}
	
	@ResponseBody
	@PostMapping("update")
	public String equipmentUpdate(CodeVO codeVO, EquipmentVO equipmentVO, Date pDate)throws Exception{
		
		// codeName으로 codeCd 조회 후 equipmentVO에 set
		codeVO = equipmentService.equipmentCodeData(codeVO);
		equipmentVO.setCodeCd(codeVO.getCodeCd());
		equipmentVO.setEquPdate(timeSetter.DateTolocalDateTime(pDate));
		
		equipmentService.equipmentUpdate(equipmentVO);
		
		return Integer.toString(equipmentVO.getEquCd());
	}
	
	@GetMapping("historyInsert")  
	public String equipmenthistoryInsert(EquipmentVO equipmentVO, EquipmentHistoryVO equipmentHistoryVO, HttpServletRequest request, Model model)throws Exception{
		
		equipmentVO = equipmentService.equipmentData(equipmentVO);
		String sNum = equipmentVO.getEquSnum();
		int equCd = equipmentVO.getEquCd();
		
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeCd(equipmentVO.getCodeCd());
		codeVO = equipmentService.equipmentCodeData2(codeVO);
		String codeName = codeVO.getCodeName();
		
		model.addAttribute("sNum", sNum);
		model.addAttribute("codeName", codeName);
		model.addAttribute("equCd", equCd);
		
		return "equipment/historyInsert";
	}
	
	@PostMapping("historyInsert")  
	public String equipmenthistoryInsert(EquipmentHistoryVO equipmentHistoryVO, Date reDate)throws Exception{
		
		equipmentHistoryVO.setEhRedate(timeSetter.DateTolocalDateTime(reDate));
		equipmentService.equipmenthistoryInsert(equipmentHistoryVO);
		
		return "redirect:./list";
	}
}