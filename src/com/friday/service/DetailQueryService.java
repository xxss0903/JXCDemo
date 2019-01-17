package com.friday.service;

import java.util.List;

public interface DetailQueryService {

	/**
	 * 查询订单详情
	 * @param dId 订单id
	 * @param table 订单类型
	 * @return
	 * @throws Exception
	 */
	List<Object> queryDetail(String dId, String table) throws Exception;
}
