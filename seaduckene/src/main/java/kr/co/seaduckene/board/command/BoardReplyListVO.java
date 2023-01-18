package kr.co.seaduckene.board.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
SELECT * FROM
 	  	(
	  	SELECT ROWNUM AS rn, tbl.* FROM
			 (
                SELECT r.reply_no, d.user_nickname, r.reply_reg_date, r.reply_content, b.board_no, d.user_no
                FROM reply r
                INNER JOIN duck_user d ON r.reply_user_no = d.user_no
                INNER JOIN board b ON b.board_no = r.reply_board_no
                WHERE b.board_no = 35
                ORDER BY r.reply_no DESC
              ) tbl
        )
WHERE rn > 1
AND rn <= 10; 
 */

@Getter
@Setter
@ToString
@NoArgsConstructor // 메게변수 없는 생성자
@AllArgsConstructor // 메게변수 다 있는 생성자
public class BoardReplyListVO {
	
	private int replyNo;
	private String replyContent;
	private Timestamp replyRegDate;
	private Timestamp replyUpDate;
	private int replyBoardNo;
	private int replyUserNo;
	
	private int userNo;
	private String userNickname;
	
	private int likeCount;
	
	//카운터를 추가해서 총 개수를 구하자.
	//컨트롤러에서 스크립터에다가 리스트 불러오는 게 비동기니까, 비동기 구문을 하나 더해서 좋아요를 했는지 안했는지 넣자.
	//
}

 
 
 
 
 
 
 
 
 
 
 