package com.kh.dots.feed.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dots.common.Utils;
import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.dao.FeedDao;
import com.kh.dots.feed.model.vo.Feed;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedDao fDao;

	@Override
	public int insertFeed(Feed feed) {
		return fDao.insertFeed(feed);
	}

	@Override
	public int insertFeedImg(List<Images> imgs) {
		return fDao.insertFeedImg(imgs);
	}

	@Override
	public Feed selectFeedData(int fno) {
		return fDao.selectFeedData(fno);
	}

	@Override
	public List<Images> selectFeedImgList(int fno) {
		return fDao.selectFeedImgList(fno);
	}

	@Override
	public int updateFeed(Feed feed, List<MultipartFile> upfiles, String severFolderPath, String webPath,
			String deleteList) {
		log.info("Feed={}",feed.toString());
		log.info("deleteList",deleteList);
		log.info("upfiles={}",upfiles);
		int result = fDao.updateFeedText(feed);
		int result2 = 0;
		// 삭제
		if(deleteList != null && !deleteList.equals("")) {
			Map<String, Object> map = new HashMap();
			map.put("feedNo", feed.getFeedNo());
			map.put("deleteList",deleteList);
			
			result2 = fDao.deleteImage(map); 
		}
		
		
		if(result > 0) {
			List<Images> list = new ArrayList();
			List<Images> preList = fDao.selectFeedImgList(feed.getFeedNo());
			int level = 2;
			if(upfiles != null) {
				for(int i = 0 ; i < upfiles.size() ; i++) {
					
					if(!upfiles.get(i).isEmpty()) {
					String changeName = Utils.saveFile(upfiles.get(i), severFolderPath);
					
					Images img = Images
								 .builder()
								 .fileWriter(feed.getFeedWriter())
			                     .changeName(changeName)
			                     .originName(upfiles.get(i).getOriginalFilename())
			                     .fileLevel(level)
			                     .filePath(webPath)
			                     .fileFno(feed.getFeedNo())
			                     .build();
					level++;
			         list.add(img);
					}else {
						level++;
					}
				}
				log.info("list={}",list);
			}
			
			for( Images i : list) {
				result = fDao.updateImage(i);
				if(result == 0) {
					result = fDao.insertImage(i);
				}
			}
		}
		return result;
	}
}
