package org.hch.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.hch.domain.Criteria;
import org.hch.domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = {327695L, 327692L, 327690L, 327688L, 327687L};
	
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
/*	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
	}
	
	

	@Test
	public void testRead() {
		Long targetRno = 4L;
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}

	
	@Test
	public void testDelete() {
		Long targetRno = 4L;
		mapper.delete(targetRno);
	}
	
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
			
	@Test
	public void testUpdate() {
		Long targetRno = 6L;
		ReplyVO vo = mapper.read(targetRno);
		vo.setReply("Update Reply ");
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: " + count);
	}


	//327695L
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
	*/
	@Test
	public void testList2() {
		Criteria cri = new Criteria(1, 10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 1572868L);
		replies.forEach(reply -> log.info(reply));
	}
}
