package org.hch.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import org.hch.domain.BoardAttachVO;
import org.hch.domain.BoardVO;
import org.hch.domain.Criteria;
import org.hch.domain.LikeVO;
import org.hch.domain.PageDTO;
import org.hch.service.BoardService;
import org.hch.service.LikeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController {
	private final BoardService service;
	private final LikeService likeService;
	
	public static String currentUserName() { 
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal(); 
		return user.getUsername(); 
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total =service.getTotal(cri);
		
		log.info("total :" + total);
		model.addAttribute("pageInfo", new PageDTO(cri, total));
	}
	
	@GetMapping("/insert")
	@PreAuthorize("isAuthenticated()")
	public void insert() {
		
	}
	
	@PostMapping("/insert")
	@PreAuthorize("isAuthenticated()")
	public String insert(BoardVO board, RedirectAttributes rttr) {
		log.info("insert: " + board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.insert(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public void get(Long bno, @ModelAttribute("cri") Criteria cri, Model model, Principal principal) {
		log.info("/get");
		LikeVO likevo = new LikeVO();
		likevo.setBno(bno);
		likevo.setUserid(currentUserName());
		
		int likes = 0;
		int check = likeService.likecount(likevo);
		if(check == 0) {
			likeService.likeinsert(likevo);
		}else if(check == 1) {
			likes = likeService.likegetinfo(likevo);
		}
		
		int dislike = 0;
		int checkDis = likeService.dislikecount(likevo);
		if(checkDis == 0) {
			likeService.dislikeinsert(likevo);
		}else if(checkDis == 1) {
			dislike = likeService.dislikegetinfo(likevo);
		}
		model.addAttribute("member", principal.getName());
		model.addAttribute("likes", likes);
		model.addAttribute("dislike", dislike);
		model.addAttribute("board", service.get(bno));
	}
	
	@GetMapping("/modify")
	public void modify(Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/modify");
		model.addAttribute("board", service.get(bno));
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
			
		return "redirect:/board/list" + cri.getListLink();
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files...");
		log.info(attachList);
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			}catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove: " + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
	
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList " + + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK); 
	}
	
	
}
