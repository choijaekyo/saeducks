package kr.co.seaduckene.admin.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
CREATE TABLE ask_list(
    ask_list_no NUMBER PRIMARY KEY,
    ask_list_user_no NUMBER NOT NULL,
    ask_list_select_no NUMBER NOT NULL,
    ask_list_content VARCHAR2(4000) NOT NULL,
    ask_list_reg_date DATE DEFAULT sysdate,
    ask_list_reply_content VARCHAR2(4000)
);

CREATE SEQUENCE ask_list_seq
    START WITH 1
    MAXVALUE 10000
    NOCYCLE
    NOCACHE;
 */

@Getter
@Setter
@ToString
@NoArgsConstructor // 메게변수 없는 생성자
@AllArgsConstructor // 메게변수 다 있는 생성자
public class AskListVO {
	
	private int askListNo;
	private int askListUserNo;
	private String askListUserName;
	private int askListSelectNo;
	private String askListContent;
	private Timestamp askListRegDate;
	private Timestamp askListUpdateDate;
	private String askListReplyContent;
	
}

 
 
 
 
 
 
 
 
 
 
 