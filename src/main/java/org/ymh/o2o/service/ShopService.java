package org.ymh.o2o.service;

import org.ymh.o2o.dto.ImageHolder;
import org.ymh.o2o.dto.ShopExecution;
import org.ymh.o2o.entity.Shop;
import org.ymh.o2o.exceptions.ShopOperationException;
import org.ymh.o2o.util.ImageUtil;

import java.io.File;
import java.io.InputStream;

public interface ShopService {
    ShopExecution addShop(ImageHolder imageHolder, Shop shop);
    Shop getByShopId(long shopId);
    ShopExecution modifyShop(Shop shop, ImageHolder imageHolder) throws ShopOperationException;
    /**
     * 根据shopCondition分页返回相应店铺列表
     *
     * @param shopCondition
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public ShopExecution getShopList(Shop shopCondition, int pageIndex, int pageSize);

}
