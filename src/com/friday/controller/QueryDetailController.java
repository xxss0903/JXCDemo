package com.friday.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.friday.model.Order;
import com.friday.service.OrderProductService;
import com.friday.service.impl.OrderProductServiceImpl;
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
            OrderProductService orderProductService = new OrderProductServiceImpl();
            String did = request.getParameter("did");
            String table = request.getParameter("table");
            Order order = orderProductService.queryOrder(did);
            if (order != null) {
                model.put("details", detailQueryService.queryDetail(did, table));
                model.put("did", did);
                model.put("remark", order.getoBz());
                ModelAndView modelView = new ModelAndView("detail", model);
                return modelView;
            }
        } catch (Exception e) {
            model.put("error", "获取失败");
            e.printStackTrace();
        }
        return new ModelAndView("error", model);
    }
}
