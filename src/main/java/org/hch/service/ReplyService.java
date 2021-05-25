package org.hch.service;

import java.util.List;

import org.hch.domain.Criteria;
import org.hch.domain.ReplyPageDTO;
import org.hch.domain.ReplyVO;

public interface ReplyService {
	public int insert(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
