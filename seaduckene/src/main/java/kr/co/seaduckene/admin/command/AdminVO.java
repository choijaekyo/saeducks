package kr.co.seaduckene.admin.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE admin_login(
    admin_no NUMBER PRIMARY KEY,
    admin_id VARCHAR2(100) NOT NULL,
    admin_pw VARCHAR2(100) NOT NULL,
    admin_reg_date DATE DEFAULT sysdate,
    admin_date_log_no NUMBER
);

CREATE SEQUENCE admin_login_seq
    START WITH 1
    MAXVALUE 10000
    NOCYCLE
    NOCACHE;
*/

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminVO {
	
	private int adminNo;
	private String adminId;
	private String adminPw;
	private Timestamp adminRegDate;
	private int adminDateLogNo;

}
