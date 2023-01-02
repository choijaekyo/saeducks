package kr.co.seaduckene.board.command;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
CREATE TABLE replyLike(
    like_no NUMBER PRIMARY KEY,
    like_reply_no NUMBER NOT NULL,
    like_user_no NUMBER NOT NULL,
    like_state NUMBER
);

CREATE SEQUENCE reply_like_no_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000
    NOCYCLE
    NOCACHE;
 */

@Getter
@Setter
@ToString
@NoArgsConstructor // 메게변수 없는 생성자
@AllArgsConstructor // 메게변수 다 있는 생성자
public class BoardReplyLikeVO {
	
	private int likeNo;
	private int likeReplyNo;
	private int likeUserNo;
	private int likeState;
	
}

 
 
 
 
 
 
 
 
 
 
 