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
	//몇 번 게시글에 좋아요을 확인을 할 것이다. 그럼 번호만 알면 되는 거 아닌가?
	//우리가 구해야 하는 건, 몇 번 게시글에 누가 좋아요를 눌렀는가?
	//유저 아이디는 고정되어 있으니 글 번호만 알면 된다. 글 번호를 담아가지고 리턴을 할 것이다.
}
