package org.hch.mapper;

import java.util.List;

import org.hch.domain.BoardVO;

public interface BoardMapper {
	public List<BoardVO> getList();
	public void insert(BoardVO board);
}
