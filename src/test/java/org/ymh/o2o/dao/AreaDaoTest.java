package org.ymh.o2o.dao;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.ymh.o2o.BaseTest;
import org.ymh.o2o.entity.Area;
import org.ymh.o2o.entity.Shop;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class AreaDaoTest extends BaseTest {
    @Autowired
    private AreaDao areaDao;


    @Test
    public void testQueryAreaList(){
        List<Area> areas = areaDao.queryAreaList();
        System.out.println(areas);
        assertEquals(2,areas.size());
    }

}
