package com.friday.controller;

import com.friday.model.sendpage.SendpageItem;
import com.friday.service.impl.SendpageServiceImpl;
import com.friday.service.impl.StockQueryServiceImpl;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 按出库地点查询产品
 */
public class QueryProductListByShopController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String shopId = request.getParameter("shopid");
        System.out.println("请求商品 " + shopId);
        Map<String, Object> model = new HashMap<String, Object>();
        try {
            StockQueryServiceImpl stockQueryService = new StockQueryServiceImpl();
            List<Object> stocks = stockQueryService.stockQuery(Integer.parseInt(shopId));
            System.out.println("stocks = " + stocks.size());
            model.put("result", stocks);
            model.put("shopid", shopId);
            return new ModelAndView("product_list", model);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("error", model);
    }
}
