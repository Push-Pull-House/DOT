package com.kh.dots.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.dots.common.model.template.Pagination;
import com.kh.dots.common.model.vo.Alarm;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.PageInfo;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.common.service.CommonService;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {

	@Autowired
	private CommonService cService;

	@Autowired
	private MemberService mService;

	@ResponseBody
	@RequestMapping(value = "/upToDate",method = RequestMethod.POST)
	public int upToDate(HttpSession session, @RequestParam HashMap<String,Object> param) {

		// Member m = (Member) session.getAttribute("loginUser");
		
		//List<Alarm> alarmlist2 = (List<Alarm>) session.getAttribute("alarmlist");
		log.info("abcabcalist={}",  param.get("alarmlist1"));
		Object a = param.get("alarmlist1");
		List<Alarm> list = new ArrayList();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			List<Map<String, Object>> dataList = objectMapper.readValue(a.toString(), new TypeReference<List<Map<String, Object>>>(){});
			
			for(Map<String,Object> data : dataList) {
				Alarm al = new Alarm();
				al.setAlarmNo((Integer) data.get("alarmNo"));
				al.setAlarmWriter((Integer) data.get("alarmWriter"));
				al.setAlarmAcceptUser((int) data.get("alarmAcceptUser"));
				al.setAlarmContent((String) data.get("alarmContent"));
				al.setAlarmType((String) data.get("alarmType"));
				al.setUserNick((String) data.get("userNick"));
				al.setFilePath((String) data.get("filePath"));
				al.setChangeName((String) data.get("changeName"));
				list.add(al);
			}
			
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		session.setAttribute("alarmlist", list);
		
		log.info("alarmListabcabcc={}",session.getAttribute("alarmlist"));
		
		int result = 0; 

		return result;
	}

	@GetMapping("/search")
	public String search(HttpSession Session, Model model) {
		Member m = (Member) Session.getAttribute("loginUser");
		List<Member> rf = mService.recommandFollowList(m.getUserNo());
		log.info("rf={}", rf);
		model.addAttribute("rf", rf);
		return "common/search.jsp";
	}

	// 검색 기능
	@GetMapping("/searchList.se")
	public String selectList(@RequestParam(name = "keyword") String keyword, Model model, HttpSession Session) {
		Member m = (Member) Session.getAttribute("loginUser");
		List<Member> rf = mService.recommandFollowList(m.getUserNo());
		log.info("rf={}", rf);
		model.addAttribute("rf", rf);
		log.info("keyword = {}", keyword);
		List<Search> MyHistory = cService.MyHistory(m.getUserNo());
		int result = 0;
		if (MyHistory != null) {
			if (!MyHistory.get(0).getSearchKeyword().equals(keyword)) {
				Search search = new Search();
				search.setSearchWriter(m.getUserNo());
				search.setSearchKeyword(keyword);
				result = cService.insertSearch(search);
				log.info("result={}", result);
			}
		}
		List<Images> slist = cService.selectList(keyword);
		log.info("slist = {} ", slist);

		model.addAttribute("slist", slist);
		return "common/search.jsp";
	}

	@GetMapping("/Alarm.al")
	public String enterAlarm(HttpSession Session, Model model) {

		return "common/alarm.jsp";
	}

	@GetMapping("/otherperson.op")
	public String otherpseron(int ano, Model model, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Alarm al = cService.selectAlarmOne(ano);
		log.info("ano={}",ano);
		log.info("al={}",al);
		Member otherUser = mService.checkMember(al.getAlarmWriter());
		List<Images> myImglist = mService.selectListMyImg(al.getAlarmWriter());
		List<Member> follower = mService.searchFollowerList(al.getAlarmWriter());
		List<Member> follow = mService.searchFollowList(al.getAlarmWriter());
		int result = cService.updateRead(ano);
		List<Alarm> list = cService.selectMyAlarm(loginUser.getUserNo());
		session.setAttribute("alarmlist", list);

		model.addAttribute("follower", follower);
		model.addAttribute("follow", follow);
		model.addAttribute("otherUser", otherUser);
		model.addAttribute("myImglist", myImglist);

		return "member/YourFeed.jsp";
	}
	
	@GetMapping("/myperson.op")
	public String myperson(int ano, Model model, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Alarm al = cService.selectAlarmOne(ano);
		log.info("ano={}",ano);
		log.info("al={}",al);
		Member otherUser = mService.checkMember(al.getAlarmAcceptUser());
		List<Images> myImglist = mService.selectListMyImg(al.getAlarmAcceptUser());
		List<Member> follower = mService.searchFollowerList(al.getAlarmAcceptUser());
		List<Member> follow = mService.searchFollowList(al.getAlarmAcceptUser());
		int result = cService.updateRead(ano);
		List<Alarm> list = cService.selectMyAlarm(loginUser.getUserNo());
		session.setAttribute("alarmlist", list);

		model.addAttribute("follower", follower);
		model.addAttribute("follow", follow);
		model.addAttribute("otherUser", otherUser);
		model.addAttribute("myImglist", myImglist);

		return "member/MyFeed.jsp";
	}

	/* 어드민 기능 */
	@GetMapping("/adminMain")
	public String adminMain(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {
		int offset = (currentPage - 1) * 5;
		int limit = 5;

		log.info("paramMap ={}", paramMap);

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> memList1 = cService.memList1();
		List<Member> memList = cService.memList(paramMap, rowBounds);
		log.info("memList ={}", memList1);
		int total = cService.selectMListCount(paramMap);
		log.info("total ={}", total);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);

		log.info("pi ={}", pi);
		model.addAttribute("memList", memList);
		model.addAttribute("pi", pi);

		return "admin/adminMain.jsp";
	}
	
	@PostMapping("/delMemberadmin")
	public String delMemberadmin(int[] rowCheck) {
		int result = 0;
		
		for (int i = 0; i < rowCheck.length; i++) {
			Map<String,Object> map = new HashMap<String,Object>();
			Member m = mService.checkMember(rowCheck[i]);
			map.put("uno",m.getUserNo());
			map.put("status",m.getStatus());
			result = cService.deleteMemberAdmin(map);
			if (result == 0) {
				break;
			}
		}
		return "redirect:/adminMain";
	}

	@GetMapping("/adminFeed")
	public String adminFeed(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {
		int offset = (currentPage - 1) * 5;
		int limit = 5;

		log.info("paramMap ={}", paramMap);

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Feed> feList1 = cService.feList1();
		List<Feed> feList = cService.feList(paramMap, rowBounds);
		log.info("feList1 ={}", feList1);
		int total = cService.selectFListCount(paramMap);
		log.info("total ={}", total);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);

		log.info("pi ={}", pi);
		model.addAttribute("feList", feList);
		model.addAttribute("pi", pi);
		return "admin/adminFeed.jsp";
	}

	@PostMapping("/deleteFeed")
	public String deleteFeed(int[] rowCheck) {
		log.info("rowCheck={}", rowCheck);
		int result = 0;
		for (int i = 0; i < rowCheck.length; i++) {
			result = cService.deleteFeed(rowCheck[i]);
			if (result == 0) {
				break;
			}
		}
		return "redirect:/adminFeed";
	}
	
	@GetMapping("/adminWList")
	public String adminWList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		int offset = (currentPage -1) *5;
		int limit = 5;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> WList = cService.WList(paramMap, rowBounds);
		log.info("WList ={}", WList);
		int total = cService.selectWListCount(paramMap);		
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("WList", WList);
		model.addAttribute("pi", pi);
		return "admin/adminWList.jsp";
	}
	
	@GetMapping("/adminBList")
	public String adminBList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		int offset = (currentPage -1) *5;
		int limit = 5;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> BList = cService.BList(paramMap, rowBounds);
		log.info("BList ={}", BList);
		int total = cService.selectBListCount(paramMap);		
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(total, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("BList", BList);
		model.addAttribute("pi", pi);
		return "admin/adminBList.jsp";
	}

}
