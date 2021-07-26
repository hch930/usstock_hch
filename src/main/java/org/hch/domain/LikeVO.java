package org.hch.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LikeVO {
	private String userid;
	private Long bno;
	private int likes;
	private int dislike;
	private int count;
}
