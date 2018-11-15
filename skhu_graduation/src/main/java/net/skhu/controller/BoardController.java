package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Board;
import net.skhu.dto.UploadedFile;
import net.skhu.mapper.BoardMapper;
import net.skhu.mapper.UploadedFileMapper;

@Controller
@RequestMapping("/user")
public class BoardController {
	
	@Autowired BoardMapper boardMapper;
	@Autowired UploadedFileMapper fileMapper;
	
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
		return "user/board";
	}
	
	@RequestMapping(value="/board_notice", method=RequestMethod.GET)
	public String board_notice(Model model, @RequestParam("id") int id) {
		Board board = boardMapper.findOne(id);
		List<UploadedFile> files = fileMapper.findByBoardId(id);
		model.addAttribute("board", board);
		model.addAttribute("files", files);
		return "user/board_notice";
	}
}
