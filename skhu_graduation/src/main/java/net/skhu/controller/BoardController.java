package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Board;
import net.skhu.mapper.BoardMapper;

@Controller
@RequestMapping("/user")
public class BoardController {
	
	@Autowired BoardMapper boardMapper;
	
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String board(Model model) {
		List<Board> boards = boardMapper.findAll();
		model.addAttribute("boards", boards);
		return "user/board";
	}
}
