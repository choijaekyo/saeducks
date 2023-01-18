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
    order_num VARCHAR2(100) NOT NULL,
    order_user_no NUMBER NOT NULL,
    order_reg_date DATE DEFAULT SYSDATE,
    order_quantity NUMBER NOT NULL,
    order_price NUMBER NOT NULL,
    order_status VARCHAR2(100) DEFAULT '배송준비중',
 	order_invoice_no VARCHAR2(100),
    order_recipient_name VARCHAR2(100) NOT NULL,
    order_recipient_tel VARCHAR2(100) NOT NULL,
    order_address_zip_num VARCHAR2(100) NOT NULL,
    order_address_basic VARCHAR2(1000) NOT NULL,
    order_address_detail VARCHAR2(1000) NOT NULL,
    order_payment_method VARCHAR2(100) NOT NULL,
    order_return_bank VARCHAR2(100),
    order_return_account VARCHAR2(100),
 	order_return_reason VARCHAR2(2000),
    payment_key VARCHAR(100)
);
*/
	
    private int orderNo;
    private int orderProductNo;
    private String orderNum; //주문번호 
    private int orderUserNo;
    private Timestamp orderRegDate;
    private int orderQuantity; // 상품번호 단위 총 수량
    private int orderPrice; // 상품번호 단위 총 가격
    private String orderStatus;
    private String orderInvoiceNo; // 송장번호
    private String orderRecipientName;
    private String orderRecipientTel;
    private String orderAddressZipNum;
    private String orderAddressBasic;
    private String orderAddressDetail;
    private String orderPaymentMethod;
    private String orderReturnBank;
    private String orderReturnAccount;
    private String orderReturnReason; // 환불사유
    private String paymentKey;

}
