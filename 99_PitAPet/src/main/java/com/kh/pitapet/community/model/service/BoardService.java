package com.kh.pitapet.community.model.service;

import java.util.List;

import com.kh.pitapet.community.model.vo.Board;
import com.kh.pitapet.common.util.PageInfo;

public interface BoardService {

	int getBoardCount();

	List<Board> getBoardList(PageInfo pageInfo);
	
	List<Board> listAll(String search_option, String keyword, PageInfo pageInfo);
	
	// List<Board> getBoardSearch(PageInfo pageInfo);

	int save(Board board);

	Board findBoardByNo(int no);

	int delete(int no);


}
