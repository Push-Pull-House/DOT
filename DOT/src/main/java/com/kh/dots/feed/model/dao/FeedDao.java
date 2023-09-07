package com.kh.dots.feed.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.dots.common.model.vo.Images;
import com.kh.dots.feed.model.vo.Feed;

@Repository
public class FeedDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertFeed(Feed feed) {
		return sqlSession.insert("feed.insertFeed",feed);
	}

	public int insertFeedImg(List<Images> imgs) {
		return sqlSession.insert("feed.insertFeedImg",imgs);
	}

	public Feed selectFeedData(int fno) {
		return sqlSession.selectOne("feed.selectFeedData",fno);
	}

	public List<Images> selectFeedImgList(int fno) {
		return sqlSession.selectList("feed.selectFeedImgList",fno);
	}

	public int updateFeedText(Feed feed) {
		return sqlSession.update("feed.updateFeedText",feed);
	}

	public int deleteImage(Map<String, Object> map) {
		return sqlSession.delete("feed.deleteImage",map);
	}

	public int updateImage(Images i) {
		return sqlSession.update("feed.updateImage",i);
	}

	public int insertImage(Images i) {
		return sqlSession.insert("feed.insertImage",i);
	}
}
