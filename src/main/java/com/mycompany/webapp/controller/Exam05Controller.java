package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.BoardsService;

@Controller
@RequestMapping("/exam05")
public class Exam05Controller {
	
	private static final Logger logger=LoggerFactory.getLogger(Exam05Controller.class);
	
	@Autowired
	private BoardsService boardsService;
	
	
	@RequestMapping("/content")
	public String content(Model model) {

		return "exam05/content";
	}
	
	@GetMapping("list")
	public String list(String pageNo,Model model, HttpSession session) {
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
		
		int totalRows=boardsService.getTotalRows();
		Pager pager=new Pager(6,5,totalRows,intPageNo);
		session.setAttribute("pager", pager);
		List<Board> list = boardsService.getBoardList(pager);
		model.addAttribute("list",list);
		model.addAttribute("pager",pager);
		return "exam05/boardlist";
	}
	
	@GetMapping("/read")
	public String read(int bno,Model model) {
		boardsService.addHitcount(bno);
		Board board=boardsService.getBoard(bno);
		model.addAttribute("board",board);
		return "exam05/read";
	}
	
	@GetMapping("downloadAttach")
	public void downloadAttach(int bno,HttpServletResponse response) {
		logger.info("실행");
		try {
			Board board=boardsService.getBoard(bno);
			//응답 HTTP 헤더에 저장될 바디의 타입
			response.setContentType(board.getBattachtype());
			//응답 HTTP 헤더에 다운로드할 수 있도록 파일 이름을 지정
			String originalName=board.getBattachoname();
			originalName= new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			logger.info(originalName);
			response.setHeader("Content-Disposition","attachment; filename=\"" +originalName+ "\";");
			
			//응답 HTTP 바디로 이미지 데이터를 출력
			InputStream is = new FileInputStream("D:\\WEB_PROJECTS\\uploadfiles\\"+board.getBattachsname());
			OutputStream os=response.getOutputStream();
			FileCopyUtils.copy(is,os);
			os.flush();
			is.close();
			os.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@GetMapping("/updateForm")
	public String updateForm(int bno, Model model) {
		Board board=boardsService.getBoard(bno);
		model.addAttribute("board",board);
		return "exam05/updateForm";
	}
	
	@PostMapping(value="/update",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String update(Board board) {
		boardsService.updateBoard(board);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}
	
	@GetMapping(value="/delete",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String delete(int bno) {
		boardsService.deleteBoard(bno);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		logger.info("흠냐");
		return jsonObject.toString(); 
	}
	
	@GetMapping("createForm")
	public String createWithAttach() {
		return "exam05/createForm";
	}
	
	@PostMapping(value="/create",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String create(Board board) {
		MultipartFile battach = board.getBattach();
		if(battach!=null && !battach.isEmpty()) {
			
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
		logger.info(board.getBtitle());
		logger.info(board.getBcontent());
		/*logger.info(board.getBattachoname());
		logger.info(board.getBattachsname());
		logger.info(board.getBattachtype());*/
		
		board.setBwriter("user1");
		boardsService.saveBoard(board);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString(); 
	}
}
