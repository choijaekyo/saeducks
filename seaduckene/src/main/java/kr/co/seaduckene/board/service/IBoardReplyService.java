package kr.co.seaduckene.board.service;

import java.util.List;

import kr.co.seaduckene.board.command.BoardReplyListVO;
import kr.co.seaduckene.board.command.BoardReplyVO;

public interface IBoardReplyService {

	void replyRegist(BoardReplyVO vo); //댓글 등록
	
	List<BoardReplyListVO> getList(int bno, int pageNum); //목록 요청.
	
	int getTotal(int replyBoardNo); //댓글 개수(페이징)
	
	int pwCheck(BoardReplyVO vo); //비밀번호 확인
	
	void update(BoardReplyVO vo); //댓글 수정
	
	void delete(int replyNo); //댓글 삭제
	
}
