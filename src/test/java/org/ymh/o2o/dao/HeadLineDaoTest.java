package org.ymh.o2o.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.ymh.o2o.BaseTest;
import org.ymh.o2o.entity.HeadLine;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class HeadLineDaoTest extends BaseTest {
	@Autowired
	private HeadLineDao headLineDao;

	@Test
	public void testQueryArea() {
		List<HeadLine> headLineList = headLineDao.queryHeadLine(new HeadLine());
		assertEquals(4, headLineList.size());
	}
}
