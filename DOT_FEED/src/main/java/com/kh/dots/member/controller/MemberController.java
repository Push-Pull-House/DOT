package com.kh.dots.member.controller;


import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dots.common.Utils;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.validator.MemberValidator;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser","nextUrl"})
public class MemberController {
	private MemberService mService;
	
	private MemberValidator memValidator;
	
	private BCryptPasswordEncoder bcrypotPasswordEncoder;
	
	@Autowired
	private ServletContext application;
	
	public MemberController() {
	}
	
	@Autowired
	public MemberController(MemberService mService , MemberValidator memValidator , BCryptPasswordEncoder bcrypotPasswordEncoder) {
		this.mService = mService;
		this.memValidator = memValidator;
		this.bcrypotPasswordEncoder = bcrypotPasswordEncoder;
	}
	
	@Autowired
	public void setMemberService(MemberService mService) {
		this.mService = mService;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(memValidator);
	}
	


	
	@GetMapping("/login.me")
	public String loginMember() {
		return "member/login.jsp";
	}
	
	@PostMapping("/login.me")
	public String loginMember2() {
		return "member/login.jsp";
	}
	
	@GetMapping("/enrollForm.me")
	public String enrollForm() {
		return "forward:member/Enroll_Form.jsp";
	}
	
	@PostMapping("/login.melog")
	public String loginMember(
							@ModelAttribute Member m , 
							HttpSession session , 
							Model model
			) {
		//암호화 전 로그인 요청처리
//		Member loginUser = mService.loginUser(m);
//		
//		String url = "";
//		if(loginUser == null) {
//			model.addAttribute("alertMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
//			url = "forward:/member/login.jsp";
//		}else {
//			Images profileImg = mService.selectListImages(loginUser.getUserNo());
//			List<Object> mlist = mService.sideFriendList(loginUser.getUserNo());
//			log.info("mlist={}",mlist);
//			model.addAttribute("loginUser", loginUser);
//			session.setAttribute("profileImg", profileImg);
//			session.setAttribute("mlist", mlist);
//			url = "redirect:/mainFeed";
//		}
		
		//암호화 후 로그인 요청 처리
		Member loginUser = mService.selectOne(m.getUserId());
		// loginUser의 userPwd는 암호화된 상태의 비밀번호
		// m안의 userPwd는 암호화전 상태의 비밀번호
		// BcrpytPasswordEncoder객체의 matches 메소드 사용
		// matches(평문, 암호문)을 작성하면 내부적으로 두 값이 일치하는 검사 후 일치하면 true/ 일치하지 않으면 false
		String url = "";
		if(loginUser != null && bcrypotPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			// 로그인 성공
			Images profileImg = mService.selectListImages(loginUser.getUserNo());
			List<Object> mlist = mService.sideFriendList(loginUser.getUserNo());
			model.addAttribute("loginUser", loginUser);
			session.setAttribute("profileImg", profileImg);
			session.setAttribute("mlist", mlist);
			url = "redirect:/mainFeed";
	
		}else {
			model.addAttribute("alertMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
			url = "forward:/member/login.jsp";
		}
		
		return url;
	}
	
	@GetMapping("/logout.me")
	public String logoutMember(HttpSession session , SessionStatus status, Model model ) {
		
		session.invalidate();
		status.setComplete();
		model.addAttribute("alertMsg", "로그아웃 되었습니다.");
		return "forward:member/login.jsp";
	}
	
	@ResponseBody
	@GetMapping("/idCheck.me")
	public String idCheck(String userId) {
		
		int result = mService.idCheck(userId);
		if(result == 0) {
			if(userId.equals("")) {
				result = 2;
			}else{
				result = 0;
			}
		}

		return result+"";
	}
	
	@PostMapping("/insert.me")
	public String insertMember(@Validated Member m , HttpSession session, Model model) {
		//암호화 작업
		String encPwd = bcrypotPasswordEncoder.encode(m.getUserPwd());
		//암호화된 pwd를 Member m에 담아주기
		m.setUserPwd(encPwd);
		
		//1. memberService호출해서 insertMember 실행(Insert)
		int result = mService.insertMember(m);
		int result2 = mService.insertProFileImg();
		String url = "";
		if(result > 0) {
			//성공시
			model.addAttribute("alertMsg", "회원가입성공");
			url = "forward:member/login.jsp";
		}else {
			//실패
			model.addAttribute("alertMsg","회원가입실패");
			url = "forward:member/login.jsp";
		}
		
		return url;
	}
	
	@GetMapping("/sendSMS.me")
    public @ResponseBody
    String sendSMS(String userPhone) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + userPhone);
        System.out.println("인증번호 : " + numStr);
        mService.certifiedPhoneNumber(userPhone,numStr);
        return numStr;
    }
	
	@GetMapping("/MyFeed.me")
	public String Myfeed(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		List<Images> myImglist = mService.selectListMyImg(loginUser.getUserNo());
		model.addAttribute("myImglist", myImglist);
		return "member/MyFeed.jsp";
	}
	
	@ResponseBody
	@GetMapping("/detail.myfeed")
	public List<Images> detailMyFeedModal(int imgNo) {
		
		List<Images> result = mService.detailMyFeedModal(imgNo);
		
		return result;
	}
	
	@GetMapping("/YourFeed.me")
	public String Myfeed(Model model,HttpSession session, String uno) {
		int userNo = Integer.parseInt(uno);
		Member otherUser = mService.checkMember(userNo); List<Images> myImglist =
		mService.selectListMyImg(userNo); model.addAttribute("otherUser", otherUser);
		model.addAttribute("myImglist", myImglist); 
		return "/member/YourFeed.jsp";
	}
	
	@GetMapping("/MyEdit.me")
	public String MyEdit(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		return "/member/MyEdit.jsp";
	}
	
	@GetMapping("/MyFeedEnroll.me")
	public String MyFeedEnroll(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		return "/member/MyFeedEnroll.jsp";
	}
	
	@GetMapping("/changePwd")
	public String changePwd() {
		return "/member/changePwd.jsp";
	}
	
	@GetMapping("/deleteUser")
	public String deleteUser() {
		return "/member/deleteUser.jsp";
	}
	
	@PostMapping("/update.me")
	public String updateMember(Member m, Model model, HttpSession session, MultipartFile proFileImg) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		String webPath = "/resources/images";
		String severFolderPath = application.getRealPath(webPath+"/");
		String changeName = Utils.saveFile(proFileImg, severFolderPath);
		Images img = Images.
						builder().
						changeName(changeName).
						originName(proFileImg.getOriginalFilename()).
						fileLevel(1).
						filePath(webPath).build();
		if(m.getChangeName() == null) {
			if(img.getOriginName() == null) {
				m.setFilePath(profileImg.getFilePath());
				m.setOriginName(profileImg.getChangeName());
				m.setChangeName(profileImg.getChangeName());
				m.setFileLevel(profileImg.getFileLevel());
			}else {
				m.setFilePath(img.getFilePath());
				m.setOriginName(img.getChangeName());
				m.setChangeName(img.getChangeName());
				m.setFileLevel(img.getFileLevel());
			}
		}
		m.setUserNo(loginUser.getUserNo());
		File dir = new File(severFolderPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		int result = mService.updateMember(m);
		int result2 = mService.updateProfileImg(m);
		Images profileImg2 = mService.selectListImages(loginUser.getUserNo());
		String url = "";
		if(result > 0 && result2 > 0) {
			//성공시
			model.addAttribute("loginUser",m);
			session.setAttribute("profileImg", profileImg2);
			session.setAttribute("alertMsg", "회원정보수정성공");
			url = "redirect:/MyFeed.me";
		}else {
			//성공시
			model.addAttribute("alertMsg", "회원정수정실패");
			url = "redirect:/MyEdit.me";
		}
		return url;
	}
	
	@PostMapping("/changePwd.me")
	public String changePwd(HttpSession session, Model model, String userPwd, String userNewPwd, String userNewPwd1) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String url = "";
		if(bcrypotPasswordEncoder.matches(userPwd, loginUser.getUserPwd())) {
			if(!userNewPwd.equals(userNewPwd1)) {
				model.addAttribute("alertMsg","새비밀번호 변경에 실패했습니다.");
				url = "member/changePwd.jsp";
			}else {
				//암호화 작업
				String encPwd = bcrypotPasswordEncoder.encode(userNewPwd);
				Member m = new Member();
				m.setUserPwd(encPwd);
				m.setUserNo(loginUser.getUserNo());
				log.info("pwd = {}", m.getUserPwd());
				log.info("userNo={}",m.getUserNo());
				int result = mService.changePwd(m);
				model.addAttribute("alertMsg","비밀번호가 변경되었습니다.");
				url = "forward:/member/login.jsp";
			}
		}else { 
			model.addAttribute("alertMsg","비밀번호가 일치하지 않습니다.");
			url = "member/changePwd.jsp";
		}
		return url;
	}
	
	@PostMapping("/deleteUser.me")
	public String deleteUser(HttpSession session, Model model, Member m) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setUserNo(loginUser.getUserNo());
		String url = "";
		if(bcrypotPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				int result = mService.deleteUser(m);
				model.addAttribute("alertMsg","회원탈퇴가 정상적으로 이루어졌습니다.");
				url = "forward:/member/login.jsp";
		}else { 
			model.addAttribute("alertMsg","비밀번호가 일치하지 않습니다.");
			url = "member/deleteUser.jsp";
		}
		return url;
	}
	@ResponseBody
	@GetMapping("/mail.check")
	public String mailCheck(String email, String userId, HttpSession session2) {

		// 메일 받을 주소
		String to_email = email;
		Member m = new Member();
		m.setUserId(userId);
		Member m2 = mService.logincheck(m);
		
		if(m2 == null) {
			return 1+"";
		}else {
			log.info("to_email={}",to_email);
			log.info("myemail={}",m2.getUserEmail());
			
			if(to_email.equals(m2.getUserEmail())){
				// 인증 번호 생성기
				StringBuffer temp = new StringBuffer();
				Random rnd = new Random();
				for (int i = 0; i < 10; i++) {
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						temp.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						temp.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						temp.append((rnd.nextInt(10)));
						break;
					}
				}
				String AuthenticationKey = temp.toString();
				String title = "안녕하세요 DOT 인증 메일입니다.";
				String content = "인증 번호는 : " + temp;
				mService.sendEmail(to_email, AuthenticationKey, title, content);
				
				return AuthenticationKey; 
			}else {
				return "오류";
			}
		}
	}
	
	@ResponseBody
	@GetMapping("/mailpwd.check")
	public String mailPwd(String email, String userId, HttpSession session2) {

		// 메일 받을 주소
		String to_email = email;
		Member m = new Member();
		m.setUserId(userId);
		int result = mService.loginPwdReset(m);
		if(result>0) {
			Member m2 = mService.logincheck(m);
			String AuthenticationKey = m2.getUserPwd();
			String title = "안녕하세요 DOT 비밀번호 메일입니다.";
			String content = "비밀번호는 : 1234" ;
			mService.sendEmail(to_email, AuthenticationKey, title, content);

			return AuthenticationKey; 
		}else {
			String AuthenticationKey = "비밀번호 발송실패"; 
			return AuthenticationKey;
		}
		
	}
	
} 