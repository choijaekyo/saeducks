package kr.co.seaduckene.common;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
CREATE TABLE notice(
    notice_no NUMBER PRIMARY KEY,
    notice_title VARCHAR2(60) NOT NULL,
    notice_content VARCHAR2(4000) NOT NULL,
    notice_views  NUMBER DEFAULT 0,
    notice_reg_date DATE DEFAULT sysdate,
    notice_up_date DATE
);

CREATE SEQUENCE notice_no_seq
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
public class NoticeVO {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeViews;
	private Timestamp noticeRegDate;
	private Timestamp noticeUpDate;
	
}

 
 
 
 
 
 
 
 
 
 
 