package com.kh.pitapet.community.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.pitapet.common.util.PageInfo;
import com.kh.pitapet.community.model.vo.Board;

@Mapper
public interface BoardMapper {
	
	int getBoardCount();

	List<Board> findAll(RowBounds rowBounds);
	
	List<Board> listAll(String search_option, String keyword, PageInfo pageInfo);

	Board selectBoardByNo(@Param("no") int no);
	
	int insertBoard(Board board);

	int updateBoard(Board board);

	int updateStatus(@Param("no") int no, @Param("status") String status);

}
