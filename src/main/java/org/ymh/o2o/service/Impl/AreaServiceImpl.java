package org.ymh.o2o.service.Impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.ymh.o2o.cache.JedisUtil;
import org.ymh.o2o.dao.AreaDao;
import org.ymh.o2o.entity.Area;
import org.ymh.o2o.service.AreaService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaDao areaDao;
    @Autowired
    private JedisUtil.Keys keys;
    @Autowired
    private JedisUtil.Strings strings;

    @Override
    public List<Area> getAreaList() {
        String key = AREALISTKEY;
        List<Area> areaList = null;
        ObjectMapper mapper = new ObjectMapper();
        if (!keys.exists(key)) {
            areaList = areaDao.queryAreaList();
            String jsonString;
            try {
                jsonString = mapper.writeValueAsString(areaList);
            } catch (JsonProcessingException e) {
                throw new ArithmeticException(e.getMessage());
            }
            strings.set(key,jsonString);
        }else{
            String jsonString = strings.get(key);
            JavaType javaType = mapper.getTypeFactory().constructParametricType(ArrayList.class,Area.class);
            try {
                areaList = mapper.readValue(jsonString, javaType);
            } catch (IOException e) {
                throw new ArithmeticException(e.getMessage());
            }
        }
        return areaList;
    }
}
