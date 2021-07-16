package org.hch.mapper;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	
	public void insertUser(MemberVO vo);
	
	public void insertUserAuth(AuthVO vo);
	
	/* 아이디 중복 검사 */
	public int idCheck(String userid);
}
