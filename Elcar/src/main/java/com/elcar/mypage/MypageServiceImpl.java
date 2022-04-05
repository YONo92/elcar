package com.elcar.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.elcar.dto.Member;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO mypageDAO;
	
	@Override
	public Member mypageInfo(String id) throws Exception {
		Member member = mypageDAO.queryMember(id);
		return member;
	}
	
	@Override
	public void memberModify(Member member) throws Exception {
		System.out.println(member.toString());
		mypageDAO.updateMember(member);
	}

	@Override
	public void memberPasswordModify(String member_id, String password) throws Exception {
		mypageDAO.updatePw(member_id, password);
	}

}