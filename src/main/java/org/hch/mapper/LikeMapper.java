package org.hch.mapper;

import org.hch.domain.LikeVO;

public interface LikeMapper {
	public int likecount(LikeVO likevo);
	
	public int likegetinfo(LikeVO likevo);
	
	public void likeinsert(LikeVO likevo);
	
	public int likeupdate(LikeVO likevo);
	
	public int dislikecount(LikeVO likevo);
	
	public int dislikegetinfo(LikeVO likevo);
	
	public void dislikeinsert(LikeVO likevo);
	
	public int dislikeupdate(LikeVO likevo);
}
