package kr.co.seaduckene.product.command;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE product_image(
	    product_image_no NUMBER PRIMARY KEY,
	    product_image_path VARCHAR2(100) NOT NULL,
	    product_image_folder VARCHAR2(100) NOT NULL,
	    product_image_file_name VARCHAR2(100) NOT NULL,
	    prodcut_image_uuid VARCHAR2(100) NOT NULL,
	    product_image_product_no NUMBER  
	);
*/

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductImageVO {
	
    private int productImageNo; 
    private String productImagePath; 
    private String productImageFolder;
    private String productImageFileName; 
    private String prodcutImageUuid;
    private int productImageProductNo;

}