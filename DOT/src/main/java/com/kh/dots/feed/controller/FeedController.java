package com.kh.dots.feed.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dots.common.Utils;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.common.model.vo.Search;
import com.kh.dots.common.service.CommonService;
import com.kh.dots.feed.model.vo.Feed;
import com.kh.dots.feed.service.FeedService;
import com.kh.dots.member.model.service.MemberService;
import com.kh.dots.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FeedController {

	@Autowired
	private FeedService fService;
	
	@Autowired MemberService mService;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private CommonService cService;

	@GetMapping("/mainFeed")
	
	public String forwardFeedMain(HttpSession Session,Model model) {
		Member m = (Member)Session.getAttribute("loginUser");
		List<Search> MyHistory1 = cService.MyHistory(m.getUserNo());
		List<Search> MyHistory = new ArrayList();
		for(int i=0; i<MyHistory1.size(); i++) {
			if(i<8) {
				Search s = MyHistory1.get(i);
				MyHistory.add(s);
			}else {
				break;
			}
		}
		Session.setAttribute("history",MyHistory);
		return "sns/mainFeed.jsp";
	}
	
	@GetMapping("/MyFeedEnroll.me")
	public String MyFeedEnroll(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		return "/member/MyFeedEnroll.jsp";
	}
	
	@PostMapping("/feedEnroll.fe") 
	public String feedEnroll(HttpSession session, Feed feed, String hashTag,
			MultipartFile feedImg1,
			MultipartFile feedImg2,
			MultipartFile feedImg3,
			MultipartFile feedImg4,
			MultipartFile feedImg5,
			Model model
			) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		feed.setFeedHashtag(hashTag);
		feed.setFeedWriter(loginUser.getUserNo());
		log.info("Feed={}",feed.toString());
		
		String webPath = "resources/images";
		String severFolderPath = application.getRealPath(webPath+"/");
		
		List<MultipartFile> feedImgs = new ArrayList();
		feedImgs.add(feedImg1);
		feedImgs.add(feedImg2);
		feedImgs.add(feedImg3);
		feedImgs.add(feedImg4);
		feedImgs.add(feedImg5);
		// 디렉토리생성 , 해당디렉토리가 존재하지 않는다면 생성
		File dir = new File(severFolderPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		List<Images> imgs = new ArrayList();
		int level = 2;
		for(MultipartFile img : feedImgs) {
			if(img != null && !img.isEmpty()) {
				String originalFilename = img.getOriginalFilename();
				if(originalFilename != null && !originalFilename.isEmpty()) {
					String changeName = Utils.saveFile(img, severFolderPath);
					 Images image = Images.builder()
		                        .fileWriter(loginUser.getUserNo())
		                        .changeName(changeName)
		                        .originName(originalFilename)
		                        .fileLevel(level++)
		                        .filePath(webPath)
		                        .build();
		                imgs.add(image);
				}
			}else {
				Images image = Images.builder()
                        .fileWriter(loginUser.getUserNo())
                        .changeName("DotLogo_D.png")
                        .originName("DotLogo_D.png")
                        .fileLevel(level++)
                        .filePath(webPath)
                        .build();
                imgs.add(image);
			}
		}
		log.info("imgs={}",imgs);
		
		int result1 = fService.insertFeed(feed);
		int result2 = fService.insertFeedImg(imgs);
		if(result1>0 && result2>0) {
			session.setAttribute("alertMsg","게시물 작성 성공!");
			return "redirect:/MyFeed.me";
		}else {
			session.setAttribute("alertMsg","게시물 작성 실패!");
			return "redirect:/MyFeedEnroll.me";
		}
	}
	
	@GetMapping("/MyFeedEdit.me")
	public String MyFeedEdit(HttpSession session, int fno, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Images profileImg = mService.selectListImages(loginUser.getUserNo());
		
		Feed feed = fService.selectFeedData(fno);
		List<Images> feedImgs = fService.selectFeedImgList(fno);
		model.addAttribute("feed",feed);
		model.addAttribute("feedImgs",feedImgs);
		return "/member/MyFeedEdit.jsp";
	}
	
	@PostMapping("/feedEdit.fe")
	public String feedEdit(HttpSession session, Feed feed, String hashTag,
			MultipartFile feedImg1,
			MultipartFile feedImg2,
			MultipartFile feedImg3,
			MultipartFile feedImg4,
			MultipartFile feedImg5,
			int fno,
			String deleteList,
			Model model
			) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		feed.setFeedHashtag(hashTag);
		feed.setFeedWriter(loginUser.getUserNo());
		feed.setFeedNo(fno);
		
		String webPath = "resources/images";
		String severFolderPath = application.getRealPath(webPath+"/");
		List<MultipartFile> upfiles = new ArrayList();
		upfiles.add(feedImg1);
		upfiles.add(feedImg2);
		upfiles.add(feedImg3);
		upfiles.add(feedImg4);
		upfiles.add(feedImg5);
		int result = fService.updateFeed(feed, upfiles, severFolderPath, webPath, deleteList);
		
		if(result > 0) {
			session.setAttribute("alertMsg","게시물 수정 성공!");
			return "redirect:/MyFeed.me";
		}else {
			session.setAttribute("alertMsg","게시물 수정 실패!");
			return "redirect:/feedEdit.fe";
		}
	}
 
	 
}
