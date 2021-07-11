package org.hch.service;

import java.util.List;

import org.hch.domain.BoardAttachVO;
import org.hch.domain.BoardVO;
import org.hch.domain.Criteria;
import org.hch.mapper.BoardAttachMapper;
import org.hch.mapper.BoardMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	private BoardMapper mapper;
	
	private BoardAttachMapper attachMapper;
	
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
		
	@Transactional
	@Override
	public void insert(BoardVO board) {
		log.info("insert: " + board);
		mapper.insertSelectKey(board);
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach ->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO get(Long bno) {
		log.info("get");
		mapper.boardHit(bno);
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
		
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach ->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotalCount");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno" + bno);
		return attachMapper.findByBno(bno);
	}
}
