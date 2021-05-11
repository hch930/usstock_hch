package org.hch.service;

import java.util.List;

import org.hch.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> getList();
	
	public BoardVO get(Long bno);
	
	public void insert(BoardVO board);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
}
