package org.ymh.o2o.dao;

import org.apache.ibatis.annotations.Param;
import org.ymh.o2o.entity.Shop;

import java.util.List;

public interface ShopDao {
	/**
	 * 新增店铺
	 * 
	 * @param shop
	 * @return
	 */
	int insertShop(Shop shop);
	/**
	 * 通过shop信息 修改店铺
	 *
	 * @param shop
	 * @return shop
	 */
	int updateShop(Shop shop);

	/**
	 * 通过shop id 查询店铺
	 *
	 * @param shopId
	 * @return shop
	 */
	Shop queryByShopId(long shopId);
	/**
	 * 分页查询店铺，可输入的条件有：店铺名(模糊),店铺状态，店铺类别，区域Id,owner
	 *
	 * @param shopCondition
	 * @param rowIndex
	 *            从第几行开始取数据
	 * @param pageSize
	 *            返回的条数
	 * @return
	 */
	List<Shop> queryShopList(@Param("shopCondition") Shop shopCondition, @Param("rowIndex") int rowIndex,
							 @Param("pageSize") int pageSize);

	/**
	 * 返回queryShopList总数
	 *
	 * @param shopCondition
	 * @return
	 */
	int queryShopCount(@Param("shopCondition") Shop shopCondition);
}
