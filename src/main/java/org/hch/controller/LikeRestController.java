package org.hch.controller;

import java.util.HashMap;
import java.util.Map;

import org.hch.domain.LikeVO;
import org.hch.service.LikeService;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequiredArgsConstructor
public class LikeRestController {
	private final LikeService likeService;
	
	@PutMapping("/like/likeupdate")
	public Map<String,String> likeupdate(@RequestBody LikeVO likevo){
		log.info("likeupdate");
		
		Map<String,String> map = new HashMap<String, String>();
		
		try {
			likeService.likeupdate(likevo);
			map.put("result", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
}
