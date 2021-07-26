package org.hch.service;

import org.hch.domain.LikeVO;
import org.hch.mapper.LikeMapper;
import org.hch.mapper.MemberMapper;
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
	
	public void likeupdate(LikeVO likevo) {
		likeMapper.likeupdate(likevo);
	}
}
