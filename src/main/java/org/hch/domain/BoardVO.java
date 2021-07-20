package org.hch.domain;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private Long bno;		//번호
	private String title;	//제목
	private String content;	//내용
	private String writer;	//작성자
	private Date regdate;	//작성일
	private Date updateDate;//수정일
	private String ipAddress;//아이피주소
	private int hit;		//조회수
	private char deleteYn; //삭제여부
	
	private int replyCnt;	//댓글수
	
	private List<BoardAttachVO> attachList;	//BoardAttachVO 한번에 처리
	
	public String getIpAddress() {
		return ipAddress.substring(0, ipAddress.lastIndexOf(".")-2);
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
}
