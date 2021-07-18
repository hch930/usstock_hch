package org.hch.service;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO vo);
	
	public void registerAuth(AuthVO vo);
	
	/* 아이디 중복 검사 */
	public int idCheck(String userid);
}
