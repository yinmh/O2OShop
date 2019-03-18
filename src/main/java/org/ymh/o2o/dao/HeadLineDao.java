package org.ymh.o2o.dao;

import org.apache.ibatis.annotations.Param;
import org.ymh.o2o.entity.HeadLine;

import java.util.List;

public interface HeadLineDao {

	/**
	 * 根据传入的查询条件(头条名查询头条)
	 * 
	 * @return
	 */
	List<HeadLine> queryHeadLine(@Param("headLineCondition") HeadLine headLineCondition);

}
