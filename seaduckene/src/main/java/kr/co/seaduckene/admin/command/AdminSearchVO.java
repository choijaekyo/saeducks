package kr.co.seaduckene.admin.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
SELECT u.user_id, u.user_name, u.user_tel, u.user_email, 
       d.order_num, d.order_quantity, d.order_price, d.order_status,
       d.order_recipient_name, d.order_recipient_tel,
       d.order_address_zip_num, d.order_address_basic,
       d.order_address_detail, d.order_payment_method,
       d.order_return_bank, d.order_return_account
FROM duck_user u
INNER JOIN duck_order d
ON u.user_no = d.order_user_no
WHERE u.user_name = '%dd%' OR u.user_tel = '12' OR d.order_num = 'asdasd';
*/

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminSearchVO {
	
	private String userId; 
	private String userName; 
	private String userTel;
	private String userEmail;
	private String orderNum;
	private int orderQuantity;
	private int orderPrice;
	private String orderStatus;
	private String orderRecipientName;
	private String orderRecipientTel;
	private String orderAddressZipNum;
	private String orderAddressBasic;
	private String orderAddressDetail;
	private String orderPaymentMethod;
	private String orderReturnBank;
	private String orderReturnAccount;
	private Timestamp orderRegDate;

}
