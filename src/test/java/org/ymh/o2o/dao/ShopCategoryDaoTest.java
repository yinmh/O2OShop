package org.ymh.o2o.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.ymh.o2o.BaseTest;
import org.ymh.o2o.entity.ShopCategory;

import java.util.List;

public class ShopCategoryDaoTest extends BaseTest {
	@Autowired
	private ShopCategoryDao shopCategoryDao;

	@Test
	public void testQueryShopCategory() {
		List<ShopCategory> shopCategoryList = shopCategoryDao.queryShopCategory(null);
		System.out.println(shopCategoryList.size());
	}
}
