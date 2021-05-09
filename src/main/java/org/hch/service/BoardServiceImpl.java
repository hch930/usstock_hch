package org.hch.service;

import java.util.List;

import org.hch.domain.BoardVO;
import org.hch.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		log.info("getList");
		return mapper.getList();
	}
	
	@Override
	public void insert(BoardVO board) {
		log.info("insert: " + board);
		mapper.insert(board);
	}
}