package org.ymh.o2o.service;

import org.ymh.o2o.entity.Area;

import java.util.List;

public interface AreaService {
    public static final String AREALISTKEY = "arealist";

    List<Area> getAreaList();
}
