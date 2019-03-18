package org.ymh.o2o.service;


import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.ymh.o2o.BaseTest;
import org.ymh.o2o.dto.ImageHolder;
import org.ymh.o2o.dto.ShopExecution;
import org.ymh.o2o.entity.Area;
import org.ymh.o2o.entity.PersonInfo;
import org.ymh.o2o.entity.Shop;
import org.ymh.o2o.entity.ShopCategory;
import org.ymh.o2o.enums.ShopStateEnum;
import org.ymh.o2o.exceptions.ShopOperationException;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;

import static org.junit.Assert.assertEquals;

public class ShopServiceTest extends BaseTest {
	@Autowired
	private ShopService shopService;
	@Test
	@Ignore
	public void testModifyShop() throws ShopOperationException, FileNotFoundException {
		Shop shop = new Shop();
		shop.setShopId(1L);
		shop.setShopName("修改后的店铺名称");
		File shopImg = new File("F:\\upload\\images\\item\\shop\\11\\2017082423541882962.jpg");
		InputStream is = new FileInputStream(shopImg);
		ImageHolder imageHolder =new ImageHolder(shopImg.getName(),is);
		ShopExecution shopExecution = shopService.modifyShop(shop,imageHolder);
		System.out.println("新的图片地址为：" + shopExecution.getShop().getShopImg());
	}

	@Test
	public void testGetShopList() {
		Shop shopCondition = new Shop();
		ShopCategory sc = new ShopCategory();
		sc.setShopCategoryId(14L);
		shopCondition.setShopCategory(sc);
		ShopExecution se = shopService.getShopList(shopCondition, 1, 2);
		System.out.println("店铺列表数为：" + se.getShopList().size());
		System.out.println("店铺总数为：" + se.getCount());
	}
//	@Test
//	public void testAddShop() throws ShopOperationException, FileNotFoundException {
//		Shop shop = new Shop();
//		PersonInfo owner = new PersonInfo();
//		Area area = new Area();
//		ShopCategory shopCategory = new ShopCategory();
//		owner.setUserId(1L);
//		area.setAreaId(2);
//		shopCategory.setShopCategoryId(10L);
//		shop.setOwner(owner);
//		shop.setArea(area);
//		shop.setShopCategory(shopCategory);
//		shop.setShopName("测试的店铺3");
//		shop.setShopDesc("test3");
//		shop.setShopAddr("test3");
//		shop.setPhone("test3");
//		shop.setCreateTime(new Date());
//		shop.setEnableStatus(ShopStateEnum.CHECK.getState());
//		shop.setAdvice("审核中");
//		File shopImg = new File("F:\\upload\\images\\item\\shop\\1\\1.jpg");
//		ShopExecution se = shopService.addShop(shopImg,shop);
//		assertEquals(ShopStateEnum.CHECK.getState(), se.getState());
//	}

}
