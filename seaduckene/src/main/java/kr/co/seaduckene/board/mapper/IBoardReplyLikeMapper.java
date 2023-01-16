package kr.co.seaduckene.board.mapper;

import java.util.List;

public interface IBoardReplyLikeMapper {

	//좋아요 검색 
	int searchLike();
	
	//좋아요 등록
	void createLike();
	
	//좋아요 삭제
	void deleteLike();

	//현재 로그인 중인 사용자가 글 목록으로 왔을 때 좋아요 한 게시물 체크
	List<Integer> listLike(String userId);
	
}
