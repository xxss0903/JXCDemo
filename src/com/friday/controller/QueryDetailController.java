package com.friday.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            String did = request.getParameter("did");
            String table = request.getParameter("table");
            model.put("details", detailQueryService.queryDetail(did, table));
            model.put("did", did);
            ModelAndView modelView = new ModelAndView("detail", model);
            if (table.equals("order")) {
                // 订购产品得订单添加入库和退回功能，传递订单编号
                modelView.addObject("orderid", did);
            }
            return modelView;
        } catch (Exception e) {
            model.put("error", "获取失败");
            e.printStackTrace();
            return new ModelAndView("error", model);
        }
    }
}
