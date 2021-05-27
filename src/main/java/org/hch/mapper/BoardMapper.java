package org.hch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hch.domain.BoardVO;
import org.hch.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	public List<BoardVO> getListWithPaging(Criteria cri);
	public BoardVO read(Long bno);
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public int update(BoardVO baord);
	public int delete(Long bno);
	public int getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno")Long bno, @Param("amount")int amount);
}
