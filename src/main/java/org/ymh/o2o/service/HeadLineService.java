package org.ymh.o2o.service;


import org.ymh.o2o.entity.HeadLine;

import java.io.IOException;
import java.util.List;

public interface HeadLineService {

	/**
	 * 根据传入的条件返回指定的头条列表
	 * 
	 * @param headLineCondition
	 * @return
	 * @throws IOException
	 */
	List<HeadLine> getHeadLineList(HeadLine headLineCondition);
}
