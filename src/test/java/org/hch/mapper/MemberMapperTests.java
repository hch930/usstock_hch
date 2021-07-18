package org.hch.mapper;

import org.hch.domain.AuthVO;
import org.hch.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;
	
	BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
	
//	@Test
//	public void memberIdChk() throws Exception{
//		String id = "admin90";
//		String id2 = "test1111";
//		mapper.idCheck(id);
//		mapper.idCheck(id2);
//	}
	
	@Test
	public void register(){
		MemberVO vo = new MemberVO();
		AuthVO authVo = new AuthVO();
		String id = "hch930";
		String pw = "cndgus97";
		String name = "홍충현";
		String auth = "ROLE_USER";
		vo.setUserid(id);
		vo.setUserpw(pwEncoder.encode(pw));
		vo.setUserName(name);
		authVo.setUserid(id);
		authVo.setAuth(auth);
		mapper.idCheck(id);
		mapper.insertUser(vo);
		mapper.insertUserAuth(authVo);
	}
}
