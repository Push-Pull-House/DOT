package com.kh.dots.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dots.chatting.model.service.ChatService;
import com.kh.dots.chatting.model.vo.ChatRoom;
import com.kh.dots.chatting.model.vo.ChatRoomJoin;
import com.kh.dots.feed.model.service.FeedService;
import com.kh.dots.feed.model.vo.Choice;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.model.vo.Friend;
import com.kh.dots.feed.model.vo.Like;
import com.kh.dots.feed.model.vo.Reply;
import com.kh.dots.follow.model.service.FollowService;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Image;

@Controller
@Slf4j
public class FeedController {
	
	@Autowired
	private FeedService fService;
	
	@Autowired
	private ChatService cService;

	@Autowired
	private MemberService mService;

	@Autowired
	public FollowService followService;
	
	@GetMapping("/mainFeed")
	public String forwardFeedMain(HttpSession session, Model model) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		List<ChatRoom> crList = cService.selectChatRoomList(loginUser.getUserNo());
		List<Member> follow = followService.searchFollowList(loginUser.getUserNo());
		List<ChatRoomJoin> crImage = cService.selectChatRoomListImage(loginUser.getUserNo());
	
		log.info("crList = {}", crList);
		log.info("follow = {}", follow);
		log.info("crImage = {}", crImage);
		
		List <Member> member= fService.profile(loginUser.getUserNo());
		List <Image> feedImg = fService.feedimg4();
		List <Feed> feedList = fService.feedList4();
		List <Reply> reply = fService.reply4();
		List <Like> like = fService.like4(loginUser.getUserNo());
		List <Choice> choice = fService.choice4(loginUser.getUserNo());
		List <Friend> follwer = fService.friend4(loginUser.getUserNo());
		List <Friend> follow4 = fService.friend5(loginUser.getUserNo());
		
		log.info("like = {}", like);
		
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("follow", follow);
		model.addAttribute("chatRoomImage", crImage);
		
		model.addAttribute("m",loginUser);
		model.addAttribute("fw",follow4);
		model.addAttribute("fr",follwer);
		model.addAttribute("ci",choice);
		model.addAttribute("lk",like);
		model.addAttribute("rp",reply);
		model.addAttribute("mem",member);
		model.addAttribute("fi",feedImg);
		model.addAttribute("fd",feedList);
		
		return "sns/mainFeed.jsp";
	}
	@ResponseBody
	@PostMapping("/mainFeed/insertReply")
	public int insertReply(Reply r, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			r.setReplyWriter(m.getUserNo());
		}
		int result = fService.insertReply(r);
		return result;
		
	}
	
	@GetMapping("/mainFeed/selectReplyList")
	@ResponseBody
	public List<Reply> selectReplyList(int bno) {
		return fService.selectReplyList(bno);
	}
	
	@PostMapping("/mainFeed/likeCount")
	@ResponseBody
	public List<Feed> likeCount(int feedNo) {
		return fService.likeCount(feedNo);
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/addLike")
	public int addLike(Like l,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			l.setLikeMember(m.getUserNo());
			l.setLikeFno(f.getFeedNo());
			f.setFeedWriter(m.getUserNo());
		}
		int il = fService.insertLike(l);
		int ul = fService.updateLike(f);
		
		int result = 0 ;
		if(ul > 0 && ul > 0) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/removeLike")
	public int removeLike(Like l,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			l.setLikeMember(m.getUserNo());
			l.setLikeFno(f.getFeedNo());
			f.setFeedWriter(m.getUserNo());
		}
		int il = fService.removeLike(l);
		int ul = fService.removeLikeCount(f);
		
		int result = 0 ;
		if(ul > 0 && ul > 0) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/addChoice")
	public int addChoice(Choice c,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			c.setChoiceMember(m.getUserNo());
			c.setChoiceFno(f.getFeedNo());
		}
		List<Choice> list = fService.checkChoice(f);
		int ac = 0;
		if(list .isEmpty()) {
			ac = fService.addChoice(c);
		}
		int result = 0 ;
		if(ac > 0 ) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/mainFeed/removeChoice")
	public int removeChoice(Choice c,Feed f, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if (m != null) {
			c.setChoiceMember(m.getUserNo());
			c.setChoiceFno(f.getFeedNo());
		}
		int rc = fService.removeChoice(c);
		
		int result = 0 ;
		if(rc > 0 ) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	   @PostMapping("/mainFeed/unfollow")
	   public String unFollow( Member mb,HttpSession Session ) {
	      Member m = (Member)Session.getAttribute("loginUser");
	      Map <String,Integer> map= new HashMap();
	      map.put("loginUserNo",m.getUserNo());
	      map.put("userNo",mb.getUserNo());
	      int result = fService.unFollow(map);
	      return result+"";
	   }
	   
	   @ResponseBody
	   @PostMapping("/mainFeed/addfollow")
	   public String addFollow(Member mb, HttpSession Session) {
	      Member m = (Member)Session.getAttribute("loginUser");
	      Map <String,Integer> map= new HashMap();
	      map.put("loginUserNo",m.getUserNo());
	      map.put("userNo",mb.getUserNo());
	      
	      int result = fService.addFollow(map);
	      return result+"";
	   }
	
	

	
}
