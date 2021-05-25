package org.hch.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private String ipAddress;
	
	private int replyCnt;
	
	public String getIpAddress() {
		return ipAddress.substring(0, ipAddress.lastIndexOf(".")-2);
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
}
