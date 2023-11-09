package com.hospital.erp.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import com.hospital.erp.member.MemberVO;

import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Log4j2
@Slf4j
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("chat")
    public String chatRoom(Model model, @RequestParam Long roomNum){
        RoomVO room = chatService.findRoomById(roomNum);
        model.addAttribute("room",room);   //현재 방에 들어오기위해서 필요한데...... 접속자 수 등등은 실시간으로 보여줘야 돼서 여기서는 못함
        return "chat/chat";
    }
	
	@GetMapping("room")
	public String chatList(Model model) throws Exception{
		log.info("메신저 시작");
		
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		
		//직원 테이블에서 이름과 직급을 리스트로 가져옴 (자신 제외)
		List<MemberVO> list = chatService.getChatList(b.getName());
		
		log.info("list {}",list);
		model.addAttribute("list", list);
		return "chat/room";
	}
	
	@PostMapping("createRoom")
	@ResponseBody//방을 만들었으면 해당 방으로 가야지.
    public int createRoom(Model model, RoomVO roomVO) throws Exception{
		log.info("방생성 중");
		
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		roomVO.setUser1(Long.valueOf(b.getName()));
		log.info("user1 : {}", roomVO.getUser1());
		log.info("user2 : {}", roomVO.getUser2());
		
		//방 db 저장하기 위해 서비스로
		int result = chatService.createRoom(roomVO);
		System.out.println(result);
        //model.addAttribute("result",result);
        
        return result;  //만든사람이 채팅방 1빠로 들어가게 됩니다
    }
	
	@GetMapping("roomCheck")
	@ResponseBody
	public Long roomCheck(Model model, RoomVO roomVO)throws Exception{
		//자신의 아이디도 넣어줌
		System.out.println("룸체크 진입");
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		roomVO.setUser1(Long.valueOf(b.getName()));
		log.info(roomVO);
		roomVO=chatService.roomCheck(roomVO);
		log.info("=========2",roomVO);
		
		Long result = 0L;
		
		//방이 있을때 없을때
		if(roomVO!=null) {//getRoomNum이 아닌 roomVO 자체가 null이 나오므로 roomVO로 넣어줌
			//model.addAttribute("result",0);
			result = roomVO.getRoomNum();
		}
		return result;
		
	}
	
	@GetMapping("search")
	@ResponseBody
	public Object getString(String memName) throws Exception{
		log.info("search");
		List<MemberVO> list = chatService.getSearch(memName);
	
		log.info("========list {}",list);
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("list", list);

		return listMap;
	}
	
	@GetMapping("getsomeone")
	@ResponseBody
	public Object getSomeone(MemberVO memberVO) throws Exception{
		log.info("someone");
		memberVO = chatService.getSomeone(memberVO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("one", memberVO);

		return map;
	}
}
