package kr.co.seaduckene.board.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
CREATE TABLE category(
    category_no NUMBER PRIMARY KEY,
    category_major_title VARCHAR2(60) NOT NULL,
    category_minor_title VARCHAR2(60) NOT NULL,
    category_reg_date DATE DEFAULT sysdate
);

CREATE SEQUENCE category_no_seq
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
public class BoardCategoryVO {
	
	private int categoryNo;
	private String categoryMajorTitle;
	private String categoryMinorTitle;
	private Timestamp categoryRegDate;
	
	
}

 
 
 
 
 
 
 
 
 
 
 