package kr.co.seaduckene.board.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
CREATE TABLE reply(
    reply_no NUMBER PRIMARY KEY,
    reply_content VARCHAR2(4000) NOT NULL,
    reply_reg_date DATE DEFAULT sysdate,
    reply_up_date DATE,
    reply_board_no NUMBER NOT NULL,
    reply_user_no NUMBER NOT NULL
);

CREATE SEQUENCE reply_no_seq
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
public class BoardReplyVO {
	
	private int replyNo;
	private String replyContent;
	private Timestamp replyRegDate;
	private Timestamp replyUpDate;
	private int replyBoardNo;
	private int replyUserNo;
	
}

 
 
 
 
 
 
 
 
 
 
 