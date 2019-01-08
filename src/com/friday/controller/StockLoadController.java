package com.friday.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.friday.service.StockQueryService;
import com.friday.service.impl.StockQueryServiceImpl;

public class StockLoadController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			StockQueryService stockQueryService = new StockQueryServiceImpl();
			model.put("shop", stockQueryService.shopQuery());
		} catch (Exception e) {
			model.put("error","加载失败");
			e.printStackTrace();
			return new ModelAndView("error",model);
		
		}
		
		return new ModelAndView("stock_query",model);
	
		
	}

}
