package com.kh.pitapet.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pitapet.member.model.service.MemberService;
import com.kh.pitapet.member.model.vo.Member;

@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 페이지 불러오기
	@GetMapping("/member/login")
	public String login() {
		
		return "member/login";
	}
	
	// 마이페이지 불러오기
	@GetMapping("/member/mypage")
	public String myPage() {
		
		return "member/mypage";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("id") String id, @RequestParam("password") String password) {		
		
		Member loginMember = service.login(id, password);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			model.addObject("location", "/member/login");
			model.setViewName("common/msg");
		}		
		
		return model;
	}
	
	// 로그아웃 처리 (SessionStatus 사용)
		@GetMapping("/logout")
		public String logout(SessionStatus status) {

			status.setComplete();
			
			return "redirect:/";
		}
		
		@GetMapping("/member/enroll")
		public String enroll() {
			
			return "member/enroll";
		}
		
		// 회원가입
		@PostMapping("/member/enroll")
		public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
					
			int result = service.save(member);
			
			if(result > 0) {
				model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "회원가입을 실패하였습니다.");
				model.addObject("location", "/member/login");			
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 아이디 중복검사
		@PostMapping("/member/idCheck")
		public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam("userId") String userId) {
			Map<String, Boolean> map = new HashMap<>();
			
			map.put("duplicate", service.isDuplicateID(userId));
			
			return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
		}
		
		// 이메일 중복검사
		@PostMapping("/member/emailCheck")
		public ResponseEntity<Map<String, Boolean>> emailCheck(@RequestParam("userEmail") String userEmail) {
			System.out.println("이메일체크합니다: " + userEmail);
			Map<String, Boolean> map = new HashMap<>();
			
			map.put("duplicate", service.isDuplicateEmail(userEmail));
			
			return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
		}
	
		
		// 회원탈퇴
		@GetMapping("/member/delete")
		public ModelAndView delete(ModelAndView model, 
				@SessionAttribute(name="loginMember") Member loginMember) {
			int result = 0;
			
			result = service.delete(loginMember.getNo());
			
			if(result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				model.addObject("location", "/logout");
			} else {
				model.addObject("msg", "회원 탈퇴에 실패하였습니다.");
				model.addObject("location", "/member/myPage");			
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 아이디 및 비밀번호 찾기
		@GetMapping("/member/findId")
		public String findId() {
			return "member/findId";
		}
		
		
		// 아이디찾기
		@RequestMapping(value = "/member/dofindId", method = {RequestMethod.POST})
		public ModelAndView findId(ModelAndView model,
				@RequestParam("name") String name, @RequestParam("email") String email) {		
			
			Member findId = service.findId(name, email);
			
			
			if(findId != null) {
				model.addObject("msg", "회원님의 아이디는 " + findId.getId() + " 입니다.");
				model.addObject("location", "/member/findId");
				model.setViewName("common/msg");
			} else {
				model.addObject("msg", "이름이나 이메일을 정확하게 입력하세요.");
				model.addObject("location", "/member/findId");
				model.setViewName("common/msg");
			}		
			System.out.println(findId);
			return model;
		}
		

		
		// 비밀번호 찾기 페이지 접속
		@GetMapping("/member/findPw")
		public String findPw() {
			
			return "member/findPw";
		}
		
		// 비밀번호 찾기 
		@RequestMapping(value = "/member/dofindPw", method = {RequestMethod.POST})
		public ModelAndView findPw(ModelAndView model,
				@RequestParam("id") String id, @RequestParam("email") String email) {
			
			  String returnEmail = service.findEmail(id, email);
			  
			  if(email.equals(returnEmail)) {
				  service.findPw(id, email);
				  model.addObject("msg", "입력하신 이메일로 비밀번호가 발송되었습니다.");
				  model.addObject("location", "/member/login");
				  model.setViewName("common/msg");
			  } else {
				  model.addObject("msg", "아이디나 이메일을 정확하게 입력하세요.");
				  model.addObject("location", "/member/findPw");
				  model.setViewName("common/msg");
			  }

			return model;
		}
		
		// 정보수정 접속
		@GetMapping("/member/passwordEdit")
		public String passwordEdit() {
			return "member/passwordEdit";
		}
		
		// 애완동물수정 접속
		@GetMapping("/member/petEdit")
		public ModelAndView petEdit(ModelAndView model,
									@SessionAttribute(name="loginMember") Member loginMember) {
			
			String userId = loginMember.getId();
			String userPet = service.getPet(userId);
			
			model.addObject("userPet",userPet);
			model.setViewName("/member/petEdit");
			
			return model;
		}
			
		// 비밀번호 변경
		@PostMapping("/member/doPasswordEdit")
		public ModelAndView doPasswordEdit(
				ModelAndView model,
				@SessionAttribute(name="loginMember") Member loginMember,
				@RequestParam("oldPw") String oldPw, @RequestParam("newPw") String newPw,
				@RequestParam("newPwCheck") String newPwCheck) {
			boolean result = false;
			
			String userId = loginMember.getId();
			String userPw = oldPw;
			
			System.out.println(userId);
			result = service.pwCheck(userId, userPw);
			
			if(result == true) {
				if(newPw.equals(newPwCheck)) {					
					service.updatePw(userId, newPw);
					model.addObject("msg", "비밀번호가 변경되었습니다.");
					model.addObject("location", "/member/passwordEdit");
				} else {
					model.addObject("msg", "변경할 비밀번호를 다시 확인해주세요.");
					model.addObject("location", "/member/passwordEdit");
				}
			} else {
				model.addObject("msg", "기존 비밀번호를 다시 확인해주세요.");
				model.addObject("location", "/member/passwordEdit");
			}
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 애완동물 변경
		@PostMapping("/member/doPetEdit")
		public ModelAndView doPetEdit(
				ModelAndView model,
				@SessionAttribute(name="loginMember") Member loginMember, @RequestParam("newPet") String newPet) {
			
			String userId = loginMember.getId();
			
			service.updatePet(userId, newPet);
			
			model.addObject("msg", "애완동물이 변경되었습니다.");
			model.addObject("location", "/member/petEdit");
			
			model.setViewName("common/msg");
			
			return model;
		}
		 
		// 멤버관리 페이지 불럭오기
		@GetMapping("/member/adminMember")
		public String adminMember() {
			return "/member/adminMember";
		}
		
	}