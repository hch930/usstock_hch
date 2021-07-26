package org.hch.mapper;

import org.hch.domain.LikeVO;

public interface LikeMapper {
	public int likecount(LikeVO likevo);
	
	public int likegetinfo(LikeVO likevo);
	
	public void likeinsert(LikeVO likevo);
	
	public void likeupdate(LikeVO likevo);
}
