package org.hch.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReplyVO {
	private Long rno; //댓글 번호
	private Long bno; //게시판 번호
	
	private String reply; //댓글 내용
	private String replyer; //댓글 작성자
	private Date replyDate; //댓글 작성일
	private Date updateDate; //수정일
	private String ipAddress; //ip주소
	
	public String getIpAddress() {
		return ipAddress.substring(0, ipAddress.lastIndexOf(".")-2);
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
}
