package com.kh.pitapet.community.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.pitapet.community.model.vo.Reply;

@Mapper
public interface ReplyMapper {
   
   int getReplyCount();

    List<Reply> list(Integer no);
    
    Reply selectReplyByNo(@Param("no") int no);
    
    int insertReply(Reply reply);
    
    int updateReply(Reply reply);

    int updateReplyStatus(@Param("no") int no, @Param("status") String status);

}