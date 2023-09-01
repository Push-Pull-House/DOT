package com.kh.dots.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.member.model.dao.MemberDao;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JavaMailSender sender;

	@Override
	public Member selectOne(String userId) {
		return memberDao.selectOne(userId);
	}
	
	@Override
	public Member selectOne(int userNo) {
		return memberDao.selectOne(userNo);
	}

	@Override
	public Member loginUser(Member m) {
		return memberDao.loginUser(m);
	}

	@Override
	public int idCheck(String userId) {
		return memberDao.idCheck(userId);
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(m);
	}

	@Override
	public void certifiedPhoneNumber(String userPhone, String numStr) {
		String api_key = "NCSSSDP4HJE9KLJ9";
        String api_secret = "4RUVN1EIWWDPLCOC0NNWSXEXOC1BHNNJ";
        Message coolsms = new Message(api_key, api_secret);
        
        log.info(coolsms.toString());
        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", userPhone);    // 수신전화번호
        params.put("from", "01039037312");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "핫띵크 휴대폰인증 테스트 메시지 : 인증번호는" + "["+numStr+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
        	coolsms.send(params);
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
		
	}

	@Override
	public Images selectListImages(int userNo) {
		return memberDao.selectListImages(userNo);
	}

	@Override
	public List<Images> selectListMyImg(int userNo) {
		return memberDao.selectListMyImg(userNo);
	}

	@Override
	public List<Images> detailMyFeedModal(int imgNo) {
		return memberDao.detailMyFeedModal(imgNo);
	}

	@Override
	public List<Object> sideFriendList(int userNo) {
		return memberDao.sideFriendList(userNo);
	}

	@Override
	public Member checkMember(int userNo) {
		return memberDao.checkMember(userNo);
	}

	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(m);
	}

	@Override
	public int updateProfileImg(Member m) {
		return memberDao.updateProfileImg(m);
	}

	@Override
	public int insertProFileImg() {
		return memberDao.insertProFileImg();
	}

	@Override
	public int changePwd(Member m) {
		return memberDao.changePwd(m);
	}

	@Override
	public int deleteUser(Member m) {
		return memberDao.deleteUser(m);
	}

	@Override
	public void sendEmail(String to_email, String authenticationKey, String title, String content) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("jwan9415@naver.com");
		message.setTo(to_email);
		message.setText(content);
		message.setSubject(title);
		
		sender.send(message);
		log.info("이메일전송!");
	}

	@Override
	public Member logincheck(Member m) {
		return memberDao.logincheck(m);
	}

	@Override
	public int loginPwdReset(Member m) {
		return memberDao.loginPwdReset(m);
	}
}
