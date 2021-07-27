package org.hch.service;

import org.hch.domain.LikeVO;
import org.hch.mapper.LikeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LikeService {
	private final LikeMapper likeMapper;
	
	public int likecount(LikeVO likevo) {
		return likeMapper.likecount(likevo);
	}
	
	public int likegetinfo(LikeVO likevo) {
		return likeMapper.likegetinfo(likevo);
	}
	
	public void likeinsert(LikeVO likevo) {
		likeMapper.likeinsert(likevo);
	}
	
	public int likeupdate(LikeVO likevo) {
		likeMapper.likeupdate(likevo);
		return likevo.getAlldislike();
	}
	
	public int dislikecount(LikeVO likevo) {
		return likeMapper.dislikecount(likevo);
	}
	
	public int dislikegetinfo(LikeVO likevo) {
		return likeMapper.dislikegetinfo(likevo);
	}
	
	public void dislikeinsert(LikeVO likevo) {
		likeMapper.dislikeinsert(likevo);
	}
	
	public int dislikeupdate(LikeVO likevo) {
		likeMapper.dislikeupdate(likevo);
		return likevo.getAlldislike();
	}
}
