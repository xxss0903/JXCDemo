package com.friday.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.friday.model.GoodsBack;
import com.friday.model.Order;
import com.friday.service.OrderProductService;
import com.friday.service.impl.OrderProductServiceImpl;
import com.friday.service.impl.StockInServiceImpl;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import com.friday.service.DetailQueryService;
import com.friday.service.impl.DetailQueryServiceImpl;

public class QueryDetailController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        try {
            DetailQueryService detailQueryService = new DetailQueryServiceImpl();
            StockInServiceImpl stockInService = new StockInServiceImpl();
            OrderProductService orderProductService = new OrderProductServiceImpl();
            String did = request.getParameter("did");
            String table = request.getParameter("table");
            String bz = "";
            try {
                int didNumber = Integer.parseInt(did);
                GoodsBack goodsBack = stockInService.queryGoodsBackById(didNumber);
                if (goodsBack != null) {
                    bz = goodsBack.getgBz();
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                Order order = orderProductService.queryOrder(did);
                bz = order.getoBz();
            }
            model.put("details", detailQueryService.queryDetail(did, table));
            model.put("did", did);
            model.put("remark", bz);
            return new ModelAndView("detail", model);
        } catch (Exception e) {
            model.put("error", "获取失败");
            e.printStackTrace();
        }
        return new ModelAndView("error", model);
    }
}
