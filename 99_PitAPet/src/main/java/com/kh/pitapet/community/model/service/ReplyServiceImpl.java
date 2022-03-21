package com.kh.pitapet.community.model.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.community.model.dao.ReplyMapper;
import com.kh.pitapet.community.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
   @Autowired
   private ReplyMapper mapper;
   	
//   @Inject
//   ReplyMapper replyMapper;

   @Override
   public int getReplyCount() {
 
      return mapper.getReplyCount();
   }

//   @Override
//   public List<Reply> getReplyList(PageInfo pageInfo) {
//	   int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
//		int limit = pageInfo.getListLimit();
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return mapper.findAll(rowBounds);
//   }

   @Override
   public Reply findReplyByNo(int no) {

      return mapper.selectReplyByNo(no);
   }

   @Override
   @Transactional
   public int saveReply(Reply reply) {
      int result = 0;
      
      if(reply.getNo() != 0) {
         result = mapper.updateReply(reply);
      } else {
         result = mapper.insertReply(reply);
      }
      
      return result;
   }

   @Override
   @Transactional
   public int delete(int no) {
      return mapper.updateReplyStatus(no, "N");
   }





}