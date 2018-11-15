package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import net.skhu.dto.Board;
import net.skhu.mapper.BoardMapper;

@Controller
@RequestMapping("/user")
public class BoardController {
	
	@Autowired BoardMapper boardMapper;
	//@Autowired UploadedFileMapper fileMapper;
	
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String board(Model model) {
		List<Board> boards = boardMapper.findAll();
		model.addAttribute("boards", boards);
		return "user/board";
	}
	
	@RequestMapping(value="board", method=RequestMethod.POST)
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
		return "board";
	}
	
	@RequestMapping(value="/board_notice", method=RequestMethod.GET)
	public String board_notice(Model model, @RequestParam("id") int id) {
		Board board = boardMapper.findOne(id);
		//List<UploadedFile> files = fileMapper.findByBoardId(id);
		model.addAttribute("board", board);
		//model.addAttribute("files", files);
		return "board_notice";
	}
	@RequestMapping(value="/board_notice_create", method=RequestMethod.GET)
	public String board_notice_create(Model model) {
		Board board = new Board();
		model.addAttribute("board", board);
		return "board_notice_edit";
	}
	
	@RequestMapping(value="/board_notice_create", method=RequestMethod.POST)
	public String board_notice_insert(Model model, Board board) {
		boardMapper.insertNotice(board);
		return "redirect:board";
	}
	
	@RequestMapping(value="/board_notice_edit", method=RequestMethod.GET)
	public String board_notice_edit(Model model, @RequestParam("boardId") int boardId) {
		Board board = boardMapper.findOne(boardId);
		//List<UploadedFile> files = fileMapper.findByBoardId(boardId);
		model.addAttribute("board", board);
		//model.addAttribute("files", files);
		return "board_notice_edit";
	}
	
	@RequestMapping(value="/board_notice_edit", method=RequestMethod.POST)
	public String board_notice_update(Model model, Board board) {
		boardMapper.updateNotice(board);
		return "redirect:board_notice?id=" + board.getBoardId();
	}
	
	@Transactional
	@RequestMapping("/boardDelete")
	public void boardDelete(@RequestParam("id") int id) throws Exception {
		//fileMapper.deleteByBoardId(id);
		boardMapper.deleteNotice(id);
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
	
}
