package com.kh.pitapet.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.community.model.service.BoardService;
import com.kh.pitapet.community.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {
	@Autowired
	private BoardService service;
	
//	@Autowired
//	private ResourceLoader resourceLoader;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model, 
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Board> list = null;
		
		log.info("page number : {}", page);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), count);
		list = service.getBoardList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("community/list");
		
		return model;
	}
	
//	@GetMapping("/write")
//	public String write() {
//		
//		return "board/write";
//	}
//	
//	@PostMapping("/write")
//	public ModelAndView write(ModelAndView model, 
//			@SessionAttribute(name = "loginMember") Member loginMember,
//			@ModelAttribute Board board, @RequestParam("upfile") MultipartFile upfile) {
//		int result = 0;
//
//		// 파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
//		log.info("Upfile Name : {}", upfile.getOriginalFilename());
//		// 파일을 업로드하지 않으면 true, 파일을 업로드하면 false 
//		log.info("Upfile is Empty : {}", upfile.isEmpty());
//		
//		// 1. 파일을 업로드 했는지 확인 후 파일을 저장
//		if(upfile != null && !upfile.isEmpty()) {
//			// 파일을 저장하는 로직 작성
//			String location = null;
//			String renamedFileName = null;
////			String location = request.getSession().getServletContext().getRealPath("resources/upload/board");
//
//			try {
//				location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
//				renamedFileName = FileProcess.save(upfile, location);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			if(renamedFileName != null) {
//				board.setOriginalFileName(upfile.getOriginalFilename());
//				board.setRenamedFileName(renamedFileName);
//			}
//		}
//		
//		// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
//		board.setWriterNo(loginMember.getNo());
//		result = service.save(board);
//		
//		if(result > 0) {
//			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
//			model.addObject("location", "/board/view?no=" + board.getNo());
//		} else {
//			model.addObject("msg", "게시글 등록을 실패하였습니다.");
//			model.addObject("location", "/board/write");
//		}
//		
//		model.setViewName("common/msg");
//		
//		return model;
//	}
//	
//	@GetMapping("/view")
//	public ModelAndView view(ModelAndView model, @RequestParam("no") int no) {	
//
//		Board board = service.findBoardByNo(no);
//		
//		model.addObject("board", board);
//		model.setViewName("board/view");
//		
//		return model;
//	}
//	
//	@GetMapping("/fileDown")
//	public ResponseEntity<Resource> fileDown (
//			@RequestHeader("user-agent") String userAgent,
//			@RequestParam("oname") String oname, @RequestParam("rname")String rname) {
//		String downName = null;
//		Resource resource = null;
//		
//		try {
//			resource = resourceLoader.getResource("resources/upload/board/" + rname);
//		
//			if(userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1) {
//				downName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
//			} else {
//				downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");			
//			}
//			
//			return ResponseEntity.ok()
//								 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
//								 .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + downName + "\"")
//								 .body(resource);
//			
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//			
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//		}
//	}
//	
//	@GetMapping("/update")
//	public ModelAndView update(
//			@SessionAttribute("loginMember") Member loginMember,
//			ModelAndView model, @RequestParam("no") int no) {
//		
//		Board board = service.findBoardByNo(no);
//		
//		System.out.println(loginMember);
//		System.out.println(board);
//		
//		if (loginMember.getNo() == board.getWriterNo()) {			
//			model.addObject("board", board);
//			model.setViewName("board/update");
//		} else {
//			model.addObject("msg", "잘못된 접근입니다.");
//			model.addObject("location", "/board/list");
//			model.setViewName("common/msg");
//		}
//		
//		return model;
//	}
//	
//	@PostMapping("/update")
//	public ModelAndView update(ModelAndView model, 
//			@SessionAttribute("loginMember") Member loginMember,
//			@ModelAttribute Board board, @RequestParam("upfile") MultipartFile upfile) {
//		
//		int result;
//		
//		if (loginMember.getId().equals(board.getWriterId())) {
//			if(upfile != null && !upfile.isEmpty()) {
//				String renamedFileName = null;
//				String location = null;
//				
//				try {
//					location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
//					
//					if(board.getRenamedFileName() != null) {
//						// 이전에 업로드된 첨부파일 삭제
//						FileProcess.delete(location + "/" + board.getRenamedFileName());
//					}
//					
//					renamedFileName = FileProcess.save(upfile, location);
//					
//					if(renamedFileName != null) {
//						board.setOriginalFileName(upfile.getOriginalFilename());
//						board.setRenamedFileName(renamedFileName);
//					}
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//			
//			result = service.save(board);
//			
//			if(result > 0) {
//				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
//				model.addObject("location", "/board/view?no=" + board.getNo());
//			} else {
//				model.addObject("msg", "게시글 수정을 실패하였습니다.");
//				model.addObject("location", "/board/update?no=" + board.getNo());
//			}
//		} else {
//			model.addObject("msg", "잘못된 접근입니다.");
//			model.addObject("location", "/board/list");
//		}
//		
//		model.setViewName("common/msg");
//		
//		return model;
//	}
//	
//	@GetMapping("/delete")
//	public ModelAndView delete(ModelAndView model,
//			@SessionAttribute("loginMember") Member loginMember,
//			@RequestParam("no")int no) {
//		
//		int result = 0;
//		Board board = service.findBoardByNo(no);
//		
//		if(board.getWriterNo() == loginMember.getNo()) {
//			result = service.delete(board.getNo());
//			
//			if(result > 0) {
//				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
//				model.addObject("location", "/board/list");
//			} else {
//				model.addObject("msg", "게시글 삭제를 실패하였습니다.");
//				model.addObject("location", "/board/view?no=" + board.getNo());
//			}
//		} else {
//			model.addObject("msg", "잘못된 접근입니다.");
//			model.addObject("location", "/board/list");
//		}
//		
//		model.setViewName("common/msg");
//		
//		return model;
//	}

}
