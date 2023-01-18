package kr.co.seaduckene.board.mapper;

import java.util.List;

import kr.co.seaduckene.board.command.BoardReplyLikeVO;

public interface IBoardReplyLikeMapper {

	// 좋아요 검색
	BoardReplyLikeVO searchLike(BoardReplyLikeVO vo);

	// 좋아요 등록
	void createLike(BoardReplyLikeVO vo);

	// 좋아요 삭제
	void deleteLike(int no);

	// 좋아요 클릭
	void makeLike(int no);

	// 현재 로그인 중인 사용자가 글 목록으로 왔을 때 좋아요 한 게시물 체크
	List<BoardReplyLikeVO> listLike(int userNo);


}
