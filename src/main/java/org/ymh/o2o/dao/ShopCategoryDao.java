package org.ymh.o2o.dao;

import org.apache.ibatis.annotations.Param;
import org.ymh.o2o.entity.ShopCategory;

import java.util.List;

public interface ShopCategoryDao {
    /**
     * 根据传入的查询条件返回店铺类别列表
     *
     * @param shopCategoryCondition
     * @return
     */
    List<ShopCategory> queryShopCategory(@Param("shopCategoryCondition") ShopCategory shopCategoryCondition);

}
