package org.hch.service;

import java.util.List;

import org.hch.domain.BoardVO;
import org.hch.domain.Criteria;
import org.hch.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	private BoardMapper mapper;
	
//	@Override
//	public List<BoardVO> getList() {
//		log.info("getList");
//		return mapper.getList();
//	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public void insert(BoardVO board) {
		log.info("insert: " + board);
		mapper.insert(board);
	}
	
	@Override
	public BoardVO get(Long bno) {
		log.info("get");
		return mapper.read(bno);
	}
	
	@Override
	public boolean remove(Long bno) {
		log.info("delete");
		return mapper.delete(bno) == 1;
	}
	
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify");
		return mapper.update(board) == 1;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotalCount");
		return mapper.getTotalCount(cri);
	}
}
