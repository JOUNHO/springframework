package com.mycompany.webapp.controller;

import java.io.File;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardsService;

@Controller
@RequestMapping("/exam08")
public class Exam08Controller {
	private static final Logger logger = LoggerFactory.getLogger(Exam08Controller.class);
	@Autowired
	private BoardsService boardsService;
	
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "exam08/loginForm";
	}
	
	@GetMapping("/user/boardlist")
	public String boardlist(String pageNo, HttpSession session, Model model) {
		int intPageNo=1;
		if(pageNo==null) {
			
		
		//세션에서 Pager를 찾고, 있으면 pageNo를 설정하고,
			Pager pager=(Pager)session.getAttribute("pager");
			if(pager !=null) {
				intPageNo=pager.getPageNo();
			}
		}else {
			intPageNo=Integer.parseInt(pageNo);
		}
		
		
		//없으면  Pager를 세션에 저장함
		
		int totalRows=boardsService.getTotalRows();
		Pager pager=new Pager(6,5,totalRows,intPageNo);
		session.setAttribute("pager", pager);
		
		List<Board> list = boardsService.getBoardList(pager);
		model.addAttribute("role","USER");
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);
		return "exam08/boardlist";
	}
	@GetMapping("/admin/boardlist")
	public String boardlist2(String pageNo, HttpSession session, Model model) {
		int intPageNo=1;
		if(pageNo==null) {
			
		
		//세션에서 Pager를 찾고, 있으면 pageNo를 설정하고,
			Pager pager=(Pager)session.getAttribute("pager");
			if(pager !=null) {
				intPageNo=pager.getPageNo();
			}
		}else {
			intPageNo=Integer.parseInt(pageNo);
		}
		
		
		//없으면  Pager를 세션에 저장함
		
		int totalRows=boardsService.getTotalRows();
		Pager pager=new Pager(6,5,totalRows,intPageNo);
		session.setAttribute("pager", pager);
		
		List<Board> list = boardsService.getBoardList(pager);
		model.addAttribute("role","ADMIN");
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);
		return "exam08/boardlist";
	}
	
	@GetMapping("/user/createForm")
	public String createForm() {
		return "exam08/createFormWithAttach";
	}
	
	@PostMapping("/user/createWithAttach")
	public String createWithAttach(Board board, Authentication auth) {
		
		logger.info(auth.getName());
		
		MultipartFile battach = board.getBattach();
		if(!battach.isEmpty()) {
			
			board.setBattachoname(battach.getOriginalFilename());
			board.setBattachtype(battach.getContentType());
			String saveName = new Date().getTime()+"-"+ battach.getOriginalFilename();
			board.setBattachsname(saveName);
			
			File file=new File("D:/WEB_PROJECTS/uploadfiles/"+saveName);
			try {
				battach.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		board.setBwriter(auth.getName());
		boardsService.saveBoard(board);
		return "redirect:/exam08/user/boardlist";  
	}
	
	@GetMapping("/error403")
		public String error403(){
			return "exam08/error403";
		}
	}
