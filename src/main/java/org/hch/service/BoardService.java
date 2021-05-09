package org.hch.service;

import java.util.List;

import org.hch.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
}
