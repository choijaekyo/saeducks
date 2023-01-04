package kr.co.seaduckene.product.command;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//CREATE TABLE basket(
//	    basket_no NUMBER PRIMARY KEY,
//	    basket_product_no NUMBER NOT NULL,
//	    basket_user_no NUMBER NOT NULL,
//	    basket_quantity NUMBER NOT NULL,
//	    basket_price NUMBER NOT NULL
//	);


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProductBasketVO {
	
	private int basketNo;
	private String basketProductName;
	private int basketProductNo;
	private int basketUserNo;
	private int basketQuantity;
	private int basketPrice;

}
