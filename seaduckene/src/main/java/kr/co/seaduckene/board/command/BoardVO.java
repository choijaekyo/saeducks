package kr.co.seaduckene.board.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
CREATE TABLE board(
    board_no NUMBER PRIMARY KEY,
    board_title VARCHAR2(60) NOT NULL,
    board_content VARCHAR2(4000) NOT NULL,
    board_views  NUMBER DEFAULT 0,
    board_reg_date DATE DEFAULT sysdate,
    board_up_date DATE,
    board_user_no NUMBER NOT NULL,
    board_category_no NUMBER NOT NULL
);

CREATE SEQUENCE board_no_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000
    NOCYCLE
    NOCACHE;
 */

@Getter
@Setter
@ToString
<<<<<<< HEAD
@NoArgsConstructor //매개변수 없는 생성자.
@AllArgsConstructor 
public class BoardVO {
   
   private int boardNo;
   private String boardTitle;
   private String boardContent;
   private int boardViews;
   private Timestamp boardRegDate;
   private Timestamp boardUpDate;
   private int boardUserNo;
   private int boardCategoryNo;
   
=======
@NoArgsConstructor // 메게변수 없는 생성자
@AllArgsConstructor // 메게변수 다 있는 생성자
public class BoardVO {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardViews;
	private Timestamp boardRegDate;
	private Timestamp boardUpDate;
	private int boardUserNo;
	private int boardCategoryNo;
	
>>>>>>> refs/remotes/origin/master
}

 
 
 
 
 
 
 
 
 
 
 