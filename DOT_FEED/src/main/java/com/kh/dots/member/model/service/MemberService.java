package com.kh.dots.member.model.service;

import java.util.List;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.member.model.vo.Member;

public interface MemberService {

	Member selectOne(String userId);

	Member loginUser(Member m);

	int idCheck(String userId);

	int insertMember(Member m);

	void certifiedPhoneNumber(String userPhone, String numStr);

	Images selectListImages(int userNo);

	List<Images> selectListMyImg(int userNo);

	List<Images> detailMyFeedModal(int imgNo);

	List<Object> sideFriendList(int userNo);

	Member checkMember(int userNo);

	int updateMember(Member m);

	int updateProfileImg(Member m);

	int insertProFileImg();

	int changePwd(Member m);

	int deleteUser(Member m);

	void sendEmail(String to_email, String authenticationKey, String title, String content);

	Member logincheck(Member m);

	int loginPwdReset(Member m);

}