package com.kh.pitapet.community.model.service;

import java.util.List;

import com.kh.pitapet.community.model.vo.Reply;

public interface ReplyService {
 
   int getReplyCount();
 
//   List<Reply> getReplyList(PageInfo pageInfo);
 
   int saveReply(Reply reply);
   
   Reply findReplyByNo(int no);
 
   int delete(int no);




}