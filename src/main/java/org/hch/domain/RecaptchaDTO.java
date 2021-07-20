package org.hch.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecaptchaDTO {
	private String success;
	private String challenge_ts;
	private String hostname;
	private String score;
	private String action;
}
