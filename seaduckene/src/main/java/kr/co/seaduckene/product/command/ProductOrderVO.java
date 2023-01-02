package kr.co.seaduckene.product.command;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProductOrderVO {
	
/*
	CREATE TABLE duck_order (
    order_no NUMBER PRIMARY KEY,
    order_product_no NUMBER NOT NULL,
    order_num NUMBER NOT NULL,
    order_user_no NUMBER NOT NULL,
    order_reg_date DATE DEFAULT SYSDATE,
    order_quantity NUMBER NOT NULL,
    order_price NUMBER NOT NULL,
    order_status VARCHAR2(100) DEFAULT '배송준비중',
    order_recipient_name VARCHAR2(100) NOT NULL,
    order_recipient_tel NUMBER NOT NULL,
    order_address_zip_num NUMBER NOT NULL,
    order_address_basic VARCHAR2(1000) NOT NULL,
    order_address_detail VARCHAR2(1000) NOT NULL,
    order_payment_method VARCHAR2(100) NOT NULL,
    order_return_bank VARCHAR2(100),
    order_return_account NUMBER 
);
*/
	
    private int orderNo;
    private int orderProductNo;
    private int orderNum;
    private int orderUserNo;
    private Timestamp orderRegDate;
    private int orderQuantity;
    private int orderPrice;
    private String orderStatus;
    private String orderRecipientName;
    private int orderRecipientTel;
    private int orderAddressZipNum;
    private String orderAddressBasic;
    private String orderAddressDetail;
    private String orderPaymentMethod;
    private String orderReturnBank;
    private int orderReturnAccount;

}
