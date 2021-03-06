package com.friday.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.friday.service.impl.StockInServiceImpl;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.friday.service.OrderProductService;
import com.friday.service.impl.OrderProductServiceImpl;

public class OrderProductController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			
			OrderProductService orderProductService = new OrderProductServiceImpl();
			StockInServiceImpl stockInService = new StockInServiceImpl();
			HttpSession session = request.getSession();
			
			String uId = (String) session.getAttribute("account");
			Map<Integer, Integer> order = new HashMap<Integer, Integer>();
			String dateString = request.getParameter("orderTime");
			String inShopString = request.getParameter("select_shop");
			int shopId = Integer.parseInt(inShopString);
			Date date = dateString.isEmpty() ? new Date(System.currentTimeMillis()) : Date.valueOf(dateString);//如果时间没有填写就使用当前时间
			String bz = request.getParameter("remark");
			String oId = "DD" + new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date(System.currentTimeMillis()));
			String inId = "RK" + new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date(System.currentTimeMillis()));

			Map<String, String[]> paraMap = request.getParameterMap(); 
			Iterator<String> iterator = paraMap.keySet().iterator();
			while (iterator.hasNext()) {
				String key = iterator.next();
				String value = paraMap.get(key)[0];
				Pattern pattern = Pattern.compile("[0-9]*");
				if (pattern.matcher(key).matches()) {
					if(value.isEmpty()) continue;
					order.put(Integer.parseInt(key), Integer.parseInt(value));
				}
			}
			
			int flag = orderProductService.orderProduct(order,shopId, date, bz, uId, oId);
			if(flag == 1) {
				model.put("products", orderProductService.getTypeAndProduct());
				model.put("success", "添加订单成功");
				// 订单添加成功之后将其加入到库存表单中
				stockInService.stockIn(oId, inId, date, shopId, bz, uId);

				return new ModelAndView("order_product", model);
			} else {
				model.put("error", "操作失败");
				return new ModelAndView("error", model);
			}
		} catch (Exception e) {
			model.put("error", "操作失败");
			e.printStackTrace();
			return new ModelAndView("error", model);
		}
	}

}
