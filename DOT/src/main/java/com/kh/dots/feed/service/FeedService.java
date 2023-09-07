package com.kh.dots.feed.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Feed;

public interface FeedService {

	int insertFeed(Feed feed);

	int insertFeedImg(List<Images> imgs);

	Feed selectFeedData(int fno);

	List<Images> selectFeedImgList(int fno);

	int updateFeed(Feed feed, List<MultipartFile> upfiles, String severFolderPath, String webPath, String deleteList);

}
