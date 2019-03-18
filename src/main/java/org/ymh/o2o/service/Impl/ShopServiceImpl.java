package org.ymh.o2o.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ymh.o2o.dao.ShopDao;
import org.ymh.o2o.dto.ImageHolder;
import org.ymh.o2o.dto.ShopExecution;
import org.ymh.o2o.entity.Shop;
import org.ymh.o2o.enums.ShopStateEnum;
import org.ymh.o2o.exceptions.ShopOperationException;
import org.ymh.o2o.service.ShopService;
import org.ymh.o2o.util.ImageUtil;
import org.ymh.o2o.util.PageCalculator;
import org.ymh.o2o.util.PathUtil;

import java.io.File;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopDao shopDao;

    @Override
    public ShopExecution getShopList(Shop shopCondition, int pageIndex, int pageSize) {
        //将页码转换成行码
        int rowIndex = PageCalculator.calculateRowIndex(pageIndex, pageSize);
        //依据查询条件，调用dao层返回相关的店铺列表
        List<Shop> shopList = shopDao.queryShopList(shopCondition, rowIndex, pageSize);
        //依据相同的查询条件，返回店铺总数
        int count = shopDao.queryShopCount(shopCondition);
        ShopExecution se = new ShopExecution();
        if (shopList != null) {
            se.setShopList(shopList);
            se.setCount(count);
        } else {
            se.setState(ShopStateEnum.INNER_ERROR.getState());
        }
        return se;
    }

    @Transactional
    @Override
    public ShopExecution addShop(ImageHolder imageHolder, Shop shop) {
        if (shop == null) {
            return new ShopExecution(ShopStateEnum.NULL_SHOP);
        }
        try {
            shop.setEnableStatus(0);
            shop.setCreateTime(new Date());
            shop.setLastEditTime(new Date());
            int rows = shopDao.insertShop(shop);
            if (rows <= 0) {
                throw new ShopOperationException("店铺创建失败");
            } else {
                if (imageHolder.getImage() != null) {
                    try {
                        addShopImg(shop, imageHolder);
                    } catch (Exception e) {
                        throw new ShopOperationException("addShopImg error:" + e.getMessage());
                    }
                    rows = shopDao.updateShop(shop);
                    if (rows <= 0) {
                        throw new ShopOperationException("更新图片地址失败");
                    }
                }
            }
        } catch (Exception e) {
            throw new ShopOperationException("addShop error:" + e.getMessage());
        }
        return new ShopExecution(ShopStateEnum.CHECK, shop);
    }

    @Override
    public Shop getByShopId(long shopId) {
        return shopDao.queryByShopId(shopId);
    }

    @Override
    public ShopExecution modifyShop(Shop shop, ImageHolder imageHolder) throws ShopOperationException {
        if (shop == null || shop.getShopId() == null) {
            return new ShopExecution(ShopStateEnum.NULL_SHOP);
        } else {
            // 1.判断是否需要处理图片
            try {
                if (imageHolder!=null) {
                    Shop tempShop = shopDao.queryByShopId(shop.getShopId());
                    if (tempShop.getShopImg() != null) {
                        ImageUtil.deleteFileOrPath(tempShop.getShopImg());
                    }
                    addShopImg(shop, imageHolder);
                }
                    // 2.更新店铺信息
                    shop.setLastEditTime(new Date());
                    int effectedNum = shopDao.updateShop(shop);
                    if (effectedNum <= 0) {
                        return new ShopExecution(ShopStateEnum.INNER_ERROR);
                    } else {
                        shop = shopDao.queryByShopId(shop.getShopId());
                        return new ShopExecution(ShopStateEnum.SUCCESS, shop);
                    }
            } catch (Exception e) {
                throw new ShopOperationException("modifyShop error:" + e.getMessage());
            }
        }
    }

    private void addShopImg(Shop shop, ImageHolder imageHolder) {
        String dest = PathUtil.getShopImagePath(shop.getShopId());
        String shopAddr = ImageUtil.generateThumbnail(imageHolder, dest);
        shop.setShopImg(shopAddr);
    }
}
