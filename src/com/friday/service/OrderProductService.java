package com.friday.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.xml.crypto.Data;

import com.friday.model.Order;
import com.friday.model.ProductType;

public interface OrderProductService {
	
	Map<String, Object> getTypeAndProduct() throws Exception;
	
	int orderProduct(Map<Integer, Integer> order, Date date, String bz , String uId, String oId) throws Exception;
	int orderProduct(Map<Integer, Integer> order,Integer shopId, Date date, String bz , String uId, String oId) throws Exception;

	/**
	 * 根据查询条件获取订单列表
	 * @param start 开始时间
	 * @param end 结束时间
	 * @param style 订单状态
	 * @param orderId 订单编号
	 * @return
	 * @throws Exception
	 */
	List<Object> queryOrder(Date start, Date end, int style, String orderId) throws Exception;

	Order queryOrder(String orderId) throws Exception;
}