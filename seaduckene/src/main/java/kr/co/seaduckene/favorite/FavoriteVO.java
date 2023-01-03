package kr.co.seaduckene.favorite;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE favorite (
    favorite_no NUMBER PRIMARY KEY,
    favorite_category_no NUMBER NOT NULL,
    favorite_user_no NUMBER NOT NULL
);

CREATE SEQUENCE favorite_seq
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
public class FavoriteVO {

	private int favoriteNo;
	private int favoriteNoCategoryNo;
	private int favoriteNoUserNo;	
}
