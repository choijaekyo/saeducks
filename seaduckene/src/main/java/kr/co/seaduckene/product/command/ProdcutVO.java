package kr.co.seaduckene.product.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//CREATE TABLE product (
//	    product_no NUMBER PRIMARY KEY,
//	    product_name VARCHAR2(100) NOT NULL,
//	    product_price_normal NUMBER NOT NULL,
//	    product_price_selling NUMBER,
//	    product_detail VARCHAR2(2000)NOT NULL,
//	    product_stock NUMBER NOT NULL,
//	    product_reg_date DATE DEFAULT SYSDATE,
//	    product_up_date DATE,
//	    product_category_no NUMBER NOT NULL
//	); 

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProdcutVO {
	
	private int productNo;
	private String productName;
	private int productPriceNormal;
	private int productPriceSelling;
	private String productDetail;
	private int productStock;
	private Timestamp productRegDate;
	private Timestamp productUpDate;
	private int productCategoryNo;

}
