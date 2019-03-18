package org.ymh.o2o.service;

import org.springframework.stereotype.Service;
import org.ymh.o2o.entity.ShopCategory;

import java.util.List;


public interface ShopCategoryService {
    /**
     * 根据查询条件获取ShopCategory列表
     *
     * @param shopCategoryCondition
     * @return
     */
    List<ShopCategory> getShopCategoryList(ShopCategory shopCategoryCondition);
}
