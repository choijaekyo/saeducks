package kr.co.seaduckene.util;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
	CREATE TABLE ask_category_board (
	    ask_board_no NUMBER PRIMARY KEY,
	    ask_board_major_category VARCHAR2(100) NOT NUll,
	    ask_board_minor_category VARCHAR2(100) NOT NULL,
	    ask_board_title VARCHAR2(300) NOT NULL,
	    ask_board_content CLOB NOT NULL,
	    ask_board_reg_date DATE DEFAULT sysdate,
	    ask_board_update_date DATE ,
	    ask_board_reply_content CLOB,
	    ask_board_user_no NUMBER NOT NULL
	);
	
	CREATE SEQUENCE ask_category_board_seq
	    START WITH 1
	    INCREMENT BY 1
	    MAXVALUE 10000
	    NOCYCLE
	    NOCACHE;
*/
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AskCategoryBoardVO {

	private int askBoardNo;
	private String askBoardMajorCategory;
	private String askBoardMinorCategory;
	private String askBoardTitle;
	private String askBoardContent;
	private Timestamp askBoardRegDate;
	private Timestamp askBoardUpdateDate;
	private String askBoardReplyContent;
	private int askBoardUserNo;
	
	private String askBoardUserName;
	
}
