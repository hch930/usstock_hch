package org.hch.mapper;

import java.util.List;

import org.hch.domain.BoardVO;

public interface BoardMapper {
	public List<BoardVO> getList();
	public BoardVO read(Long bno);
	public void insert(BoardVO board);
	public int update(BoardVO baord);
	public int delete(Long bno);
}
