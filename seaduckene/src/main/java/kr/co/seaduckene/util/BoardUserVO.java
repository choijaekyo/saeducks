package kr.co.seaduckene.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

 /*
-- 내가 선택한 카테고리의 보더 
SELECT *
FROM
    (
    SELECT ROWNUM AS rn, tbl.* FROM
        (
            SELECT b.board_no, b.board_title, b.board_content, b.board_views, c.category_major_title, c.category_minor_title, d.user_nickname
            FROM duck_user d INNER JOIN favorite f
                             ON 1 = f.favorite_user_no
                             INNER JOIN category c
                             ON f.favorite_category_no = c.category_no
                             INNER JOIN board b
                             ON c.category_no = b.board_category_no
        ) tbl
    ) s
WHERE rn > 0
AND rn <= 9
ORDER BY s.category_minor_title DESC, s.board_views DESC;

-- 유저가 없을때 뷰가 가장 높은 카테고리의 보더
SELECT *
FROM
    (
    SELECT ROWNUM AS rn, tbl.* FROM
        (
            SELECT b.board_no, b.board_title, b.board_content, b.board_views, c.category_major_title, c.category_minor_title, d.user_nickname
            FROM board b INNER JOIN category c
                             ON b.board_category_no = c.category_no
                             INNER JOIN duck_user d
                             ON b.board_user_no = d.user_no
        ) tbl
    ) s
WHERE rn > 0
AND rn <= 9
ORDER BY s.category_minor_title DESC, s.board_views DESC;
 */

@Getter
@Setter
@ToString
@NoArgsConstructor // 메게변수 없는 생성자
@AllArgsConstructor // 메게변수 다 있는 생성자
public class BoardUserVO {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardViews;
	private String categoryMinorTitle;
	private String userNickname;
	private int userNo;
	
}

 
 
 
 
 
 
 
 
 
 
 