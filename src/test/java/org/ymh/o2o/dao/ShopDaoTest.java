package org.ymh.o2o.dao;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.ymh.o2o.BaseTest;
import org.ymh.o2o.entity.Area;
import org.ymh.o2o.entity.PersonInfo;
import org.ymh.o2o.entity.Shop;
import org.ymh.o2o.entity.ShopCategory;

import java.security.acl.Owner;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class ShopDaoTest extends BaseTest {
	@Autowired
	private ShopDao shopDao;

	@Ignore
	@Test
	public void testInsertShop() {
		Shop shop = new Shop();
		PersonInfo owner = new PersonInfo();
		Area area = new Area();
		ShopCategory shopCategory = new ShopCategory();
		owner.setUserId(1L);
		area.setAreaId(2);
		shopCategory.setShopCategoryId(10L);
		shop.setOwner(owner);
		shop.setArea(area);
		shop.setShopCategory(shopCategory);
		shop.setShopName("测试的店铺");
		shop.setShopDesc("test");
		shop.setShopAddr("test");
		shop.setPhone("test");
		shop.setShopImg("test");
		shop.setCreateTime(new Date());
		shop.setEnableStatus(0);
		shop.setAdvice("审核中");
		int effectedNum = shopDao.insertShop(shop);
		assertEquals(1, effectedNum);
	}

	@Test
	@Ignore
	public void testUpdateShop() {
		Shop shop = new Shop();
		shop.setShopId(1L);
		shop.setShopDesc("测试描述");
		shop.setShopAddr("测试地址");
		shop.setLastEditTime(new Date());
		int effectedNum = shopDao.updateShop(shop);
		assertEquals(1, effectedNum);
	}

	@Test
	@Ignore
	public void testQueryByShopId() {
		long shopId = 73;
		Shop shop = shopDao.queryByShopId(shopId);
		System.out.println("areaId:" + shop.getArea().getAreaId());
		System.out.println("areaName" + shop.getArea().getAreaName());
	}
	@Test
	public void testQueryShopListAndCount() {
		Shop shopCondition = new Shop();
//		PersonInfo onwer = new PersonInfo();
//		onwer.setUserId(1L);
//		shopCondition.setOwner(onwer);

		ShopCategory childShopCategory  = new ShopCategory();
		ShopCategory parentShopCategory  = new ShopCategory();
			parentShopCategory.setShopCategoryId(12L);
		childShopCategory.setParent(parentShopCategory);
		shopCondition.setShopCategory(childShopCategory);
		List<Shop> shopList = shopDao.queryShopList(shopCondition, 0, 5);
		int count = shopDao.queryShopCount(shopCondition);
		System.out.println("店铺列表的大小：" + shopList.size());
		System.out.println("店铺总数：" + count);
	}
}
