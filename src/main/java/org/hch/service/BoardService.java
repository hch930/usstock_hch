package org.hch.service;

import java.util.List;

import org.hch.domain.BoardAttachVO;
import org.hch.domain.BoardVO;
import org.hch.domain.Criteria;

public interface BoardService {
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public BoardVO get(Long bno);
	
	public void insert(BoardVO board);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
}
