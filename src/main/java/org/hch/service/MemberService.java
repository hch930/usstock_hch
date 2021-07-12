package org.hch.service;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO vo);
	
	public void registerAuth(AuthVO vo);
	
	public int idChk(MemberVO vo);
}
