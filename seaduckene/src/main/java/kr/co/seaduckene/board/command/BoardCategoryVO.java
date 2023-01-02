package kr.co.seaduckene.board.command;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
CREATE TABLE boardImage(
    board_image_no NUMBER PRIMARY KEY,
    board_image_path VARCHAR2(100) NOT NULL,
    board_image_folder VARCHAR2(100) NOT NULL,
    board_image_file_name VARCHAR2(1000) NOT NULL,
    board_image_uuid VARCHAR2(1000) NOT NULL,
    board_board_no NUMBER NOT NULL
);

CREATE SEQUENCE board_image_no_seq
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
	
	private int boardImageNo;
	private String boardImagePath;
	private String boardImageFolder;
	private String boardImageFileName;
	private String boardImageUuid;
	private int boardBoardNo;
	
}

 
 
 
 
 
 
 
 
 
 
 