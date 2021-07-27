package org.hch.controller;

import java.util.HashMap;

import org.hch.domain.LikeVO;
import org.hch.service.LikeService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequiredArgsConstructor
public class LikeController {
	private final LikeService likeService;
	
	@PostMapping("/like/likeupdate")
	public HashMap<String, Object> likeupdate(@RequestBody LikeVO likevo){
		log.info("likeupdate");
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		try {
			likeService.likeupdate(likevo);
			int like = likevo.getAlllike();
			log.info("like: " + like);
			
			map.put("result", "success");
			map.put("like", like);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
	
	@PostMapping("/like/dislikeupdate")
	public HashMap<String, Object> dislikeupdate(@RequestBody LikeVO likevo){
		log.info("dislikeupdate");
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		try {
			likeService.dislikeupdate(likevo);
			int dislike = likevo.getAlldislike();
			log.info("like: " + dislike);
			
			map.put("result", "success");
			map.put("dislike", dislike);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
}
