package kr.co.seaduckene.admin.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE admin_date_log(
    admin_log_no NUMBER PRIMARY KEY,
    admin_no NUMBER,
    admin_log_last_date DATE DEFAULT sysdate
);

CREATE SEQUENCE admin_date_log_seq
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
public class AdminDateVO {
	
	private int adminLogNo;
	private int adminNo;
	private Timestamp adminLogLastDate;

}
