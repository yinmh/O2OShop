package org.ymh.o2o.service;

import org.ymh.o2o.dto.ImageHolder;
import org.ymh.o2o.dto.ProductExecution;
import org.ymh.o2o.entity.Product;
import org.ymh.o2o.exceptions.ProductOperationException;

import java.util.List;

public interface ProductService {
	ProductExecution getProductList(Product productCondition, int pageIndex, int pageSize);


	ProductExecution addProduct(Product product, ImageHolder thumbnail, List<ImageHolder> productImgList)
			throws ProductOperationException;

	Product getProductById(long productId);

	ProductExecution modifyProduct(Product product, ImageHolder thumbnail, List<ImageHolder> productImgHolderList)
			throws ProductOperationException;
}
