package net.skhu.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import net.skhu.dto.Board;
import net.skhu.dto.User;
import net.skhu.mapper.BoardMapper;

@Controller
@RequestMapping("/user")
public class BoardController {

	@Autowired BoardMapper boardMapper;
	//@Autowired UploadedFileMapper fileMapper;

	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String board(Model model) {
		List<Board> boards = boardMapper.findAll();
		model.addAttribute("boards", boards);
		return "user/board";
	}

	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String board_search(Model model, 
			@RequestParam("searchSelect") int st1, @RequestParam("searchText") String st2) {
		List<Board> boards;
		if(st1 == 1) {		// 작성자 이름 검색
			boards = boardMapper.findByName('%' + st2 + '%');
		} else if (st1 == 2) {	// 제목 검색
			boards = boardMapper.findByTitle('%' + st2 + '%');
		} else {
			boards = boardMapper.findAll();
		}
		model.addAttribute("boards", boards);
		return "user/board";
	}

	// 공지사항
	@RequestMapping(value="/board_notice", method=RequestMethod.GET)
	public String board_notice(Model model, @RequestParam("id") int id) {
		Board board = boardMapper.findOne(id);
		//List<UploadedFile> files = fileMapper.findByBoardId(id);
		model.addAttribute("board", board);
		//model.addAttribute("files", files);
		return "user/board_notice";
	}
	@RequestMapping(value="/board_notice_create", method=RequestMethod.GET)
	public String board_notice_create(Model model) {
		Board board = new Board();
		model.addAttribute("board", board);
		return "user/board_notice_edit";
	}

	@RequestMapping(value="/board_notice_create", method=RequestMethod.POST)
	public String board_notice_insert(Model model, Board board, HttpSession session) {
		User user = (User) session.getAttribute("user");
		board.setUserId(user.getId());
		boardMapper.insertNotice(board);
		return "redirect:board";
	}

	@RequestMapping(value="/board_notice_edit", method=RequestMethod.GET)
	public String board_notice_edit(Model model, @RequestParam("boardId") int boardId) {
		Board board = boardMapper.findOne(boardId);
		//List<UploadedFile> files = fileMapper.findByBoardId(boardId);
		model.addAttribute("board", board);
		//model.addAttribute("files", files);
		return "user/board_notice_edit";
	}

	@RequestMapping(value="/board_notice_edit", method=RequestMethod.POST)
	public String board_notice_update(Model model, Board board) {
		boardMapper.updateNotice(board);
		return "redirect:board_notice?id=" + board.getBoardId();
	}

	@RequestMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("id") int id) throws Exception {
		//fileMapper.deleteByBoardId(id);
		boardMapper.deleteNotice(id);
		return "redirect:board";
	}

	/*
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public void upload(@RequestParam("fileUpload") MultipartFile[] files, 
			@RequestParam("boardId") int boardId) throws IOException {
		for(MultipartFile uploadFile : files) {
			if(uploadFile.getSize() <= 0) continue;
			String fileName = Paths.get(uploadFile.getOriginalFilename()).getFileName().toString();
			System.out.println(fileName);
			UploadedFile uploadedFile = new UploadedFile();
			uploadedFile.setBoardId(boardId);
			uploadedFile.setFileName(fileName);
			uploadedFile.setFileSize((int)uploadFile.getSize());
			uploadedFile.setData(uploadFile.getBytes());
			//fileMapper.insert(uploadedFile);
		}
	}

	@RequestMapping("/fileDelete")
	public void fileDelete(@RequestParam("fileId") int fileId) throws Exception {
		fileMapper.deleteById(fileId);
	}

	@RequestMapping("/download")
	public void download(@RequestParam("fileId") int id, HttpServletResponse response) throws Exception {
		UploadedFile uploadedFile = fileMapper.findOne(id);
		if(uploadedFile == null) return;
		String fileName = URLEncoder.encode(uploadedFile.getFileName(), "UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
		try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
			output.write(uploadedFile.getData());
		}
	}
	 */

	// 문의
	@RequestMapping(value="/board_question", method=RequestMethod.GET)
	public String board_question(Model model, @RequestParam("boardId") int id) {
		Board board = boardMapper.findOne(id);
		model.addAttribute("board", board);
		return "user/board_question";
	}

	@RequestMapping(value="/board_question_create", method=RequestMethod.GET)
	public String board_question_create(Model model) {
		Board board = new Board();
		model.addAttribute("board", board);
		return "user/board_question_edit";
	}

	@RequestMapping(value="/board_question_create", method=RequestMethod.POST)
	public String board_question_insert(Model model, Board board, HttpSession session) {
		User user = (User) session.getAttribute("user");
		board.setUserId(user.getId());
		if(board.getPassword().length() >= 4) {
			boardMapper.insertQuestion(board);
			return "redirect:board";
		} else if(board.getPassword().length() > 0){
			model.addAttribute("result", "-1");
			return "user/board_question_edit";
		} else {
			board.setPassword(null);
			boardMapper.insertQuestion(board);
			return "redirect:board";
		}
	}

	@RequestMapping(value="/board_question_edit", method=RequestMethod.GET)
	public String board_question_edit(Model model, @RequestParam("boardId") int boardId) {
		Board board = boardMapper.findOne(boardId);
		model.addAttribute("board", board);
		return "user/board_question_edit";
	}

	@RequestMapping(value="/board_question_edit", method=RequestMethod.POST)
	public String board_questione_update(Model model, Board board) {
		if(board.getPassword().length() >= 4) {
			boardMapper.updateQuestion(board);
			return "redirect:board_question?boardId=" + board.getBoardId();
		} else if(board.getPassword().length() > 0){
			model.addAttribute("result", "-1");
			return "user/board_question_edit";
		} else {
			board.setPassword(null);
			boardMapper.updateQuestion(board);
			return "redirect:board_question?boardId=" + board.getBoardId();
		}
	}

	@RequestMapping("/questionDelete")
	public String questionDelete(@RequestParam("id") int id) throws Exception {
		boardMapper.deleteQuestion(id);
		return "redirect:board";
	}

	@RequestMapping(value="/board_question_unlocked", method=RequestMethod.GET)
	public String board_question_locked(Model model, HttpSession session, 
			@RequestParam("boardId") int boardId) {
		Board board = boardMapper.findOne(boardId);
		User user = (User) session.getAttribute("user");
		if(!user.getRole().equals("관리자")) {
			if(board.getPassword() != null) {
				model.addAttribute("boardId", boardId);
				return "user/board_question_unlocked";
			} else {
				return "redirect:board_question?boardId=" + boardId;
			}
		} else {
			return "redirect:board_question?boardId=" + boardId;
		}
	}

	@RequestMapping(value="/board_question_unlocked", method=RequestMethod.POST)
	public String board_question_unlocked(Model model, @RequestParam("boardId") int boardId, 
			@RequestParam("password") String password) {
		Board board = boardMapper.findOne(boardId);
		if(board.getPassword().equals(password)) {
			model.addAttribute("board", board);
			return "redirect:board_question?boardId=" + boardId;
		} else {
			model.addAttribute("result", "-1");
			return "redirect:board_question_unlocked?boardId=" + boardId;
		}
	}

	// 답변
	@RequestMapping(value="/board_answer", method=RequestMethod.GET)
	public String board_answer(Model model, @RequestParam("boardId") int id) {
		Board board = boardMapper.findOne(id);
		model.addAttribute("board", board);
		return "user/board_answer";
	}

	@RequestMapping(value="/board_answer_create", method=RequestMethod.GET)
	public String board_answer_create(Model model, @RequestParam("boardId") int id) {
		Board question = boardMapper.findOne(id);
		Board board = new Board();
		board.setGroupNumber(id);
		board.setTitle("[답변] " + question.getTitle());
		model.addAttribute("board", board);
		return "user/board_answer_edit";
	}

	@RequestMapping(value="/board_answer_create", method=RequestMethod.POST)
	public String board_answer_insert(Model model, Board board, HttpSession session) {
		User user = (User) session.getAttribute("user");
		board.setUserId(user.getId());
		boardMapper.insertAnswer(board);
		return "redirect:board";
	}

	@RequestMapping(value="/board_answer_edit", method=RequestMethod.GET)
	public String board_answer_edit(Model model, @RequestParam("boardId") int boardId) {
		Board board = boardMapper.findOne(boardId);
		model.addAttribute("board", board);
		return "user/board_answer_edit";
	}

	@RequestMapping(value="/board_answer_edit", method=RequestMethod.POST)
	public String board_answer_update(Model model, Board board) {
		boardMapper.updateAnswer(board);
		return "redirect:board_answer?boardId=" + board.getBoardId();
	}

	@RequestMapping("/answerDelete")
	public String answerDelete(@RequestParam("id") int id) throws Exception {
		boardMapper.deleteAnswer(id);
		return "redirect:board";
	}
}
