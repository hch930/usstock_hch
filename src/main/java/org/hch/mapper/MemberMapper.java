package org.hch.mapper;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	
	public void insertUser(MemberVO vo);
	
	public void insertUserAuth(AuthVO vo);
	
	public int idChk(MemberVO vo);
}
