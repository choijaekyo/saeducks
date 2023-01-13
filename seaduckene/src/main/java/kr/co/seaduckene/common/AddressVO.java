package kr.co.seaduckene.common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE address   (
    address_no NUMBER PRIMARY KEY,
    address_detail VARCHAR2(500) NOT NULL,
    address_basic VARCHAR2(500) NOT NULL,
    address_zip_num VARCHAR2(500) NOT NULL,
    address_representative NUMBER DEFAULT 1,
    address_user_no NUMBER NOT NULL
);

CREATE SEQUENCE address_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000
    NOCACHE
    NOCYCLE;
*/

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AddressVO {

	private int addressNo;
	private String addressDetail;
	private String addressBasic;
	private String addressZipNum;
	private int addressRepresentative;
	private int addressUserNo;
	
}
