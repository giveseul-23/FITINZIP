package com.spring.fitinzip.back.product;

import java.util.List;

import com.spring.fitinzip.back.product.vo.ProductVO;

public interface ProductService {
	
	void insertProduct(ProductVO vo);
	void updateProduct(ProductVO vo);
	void deleteProduct(ProductVO vo);
	ProductVO getProduct(ProductVO vo);
	List<ProductVO> getProductList();
}
