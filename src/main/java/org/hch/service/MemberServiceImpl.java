package org.hch.service;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;
import org.hch.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberMapper mapper;
	
	@Override
	public void register(MemberVO vo) {
		mapper.insertUser(vo);
	}
	
	@Override
	public void registerAuth(AuthVO vo) {
		mapper.insertUserAuth(vo);
	}
	
	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String userid) throws Exception {	
		return mapper.idCheck(userid);
	}
}
