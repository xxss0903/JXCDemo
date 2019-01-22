package com.friday.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.friday.model.Shop;
import com.friday.service.impl.StockQueryServiceImpl;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import com.friday.service.OrderProductService;
import com.friday.service.impl.OrderProductServiceImpl;

public class GetProductController implements Controller {

	/**
	 * 可订购商品列表
	 */
	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			OrderProductService orderProductService = new OrderProductServiceImpl();
            StockQueryServiceImpl stockQueryService = new StockQueryServiceImpl();
            List<Shop> shops = stockQueryService.shopQuery();
            model.put("shops", shops);
            model.put("products", orderProductService.getTypeAndProduct());
			return new ModelAndView("order_product", model);
		} catch (Exception e) {
			model.put("error", "这个页面出错了");
			e.printStackTrace();
			return new ModelAndView("error", model);
		}
	}
}
