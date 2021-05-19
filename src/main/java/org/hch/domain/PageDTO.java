package org.hch.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage; //시작페이지
	private int endPage; //마지막페이지
	private boolean prev, next; // 이전, 다음
	
	private int total; // 전체 데이터 개수
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// ex) 11페이지 -> 1.1 소수점 반올림 -> 2 * 10 -> 20페이지
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10; 
		
		// ex) endpage(20) - 9 -> 11페이지
		this.startPage = this.endPage - 9;
		
		// ex) 데이터 개수 -> 110개, 110.0 / 10 -> 11
		//endpage * amount가 더 큰 경우 사용
		int realEnd = (int) (Math.ceil(total * 1.0) / cri.getAmount());
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
}
