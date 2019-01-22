package com.friday.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.friday.model.Order;
import com.friday.service.impl.OrderProductServiceImpl;
import com.friday.service.impl.StockOutServiceImpl;
import com.friday.service.impl.StockQueryServiceImpl;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.friday.service.StockInService;
import com.friday.service.impl.StockInServiceImpl;

public class GoodsBackController implements Controller {

    /**
     * 商品退回
     */
    @Override
    public ModelAndView handleRequest(HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        try {
            StockInService stockInService = new StockInServiceImpl();
            StockOutServiceImpl stockOutService = new StockOutServiceImpl();
            HttpSession session = request.getSession();

            String uId = (String) session.getAttribute("account");
            String oid = request.getParameter("orderid");
            String timeString = request.getParameter("intime");
            String gtypeString = request.getParameter("gtype");
            int gtype = Integer.parseInt(gtypeString);
            String bz = request.getParameter("remark");
            Date date = timeString.isEmpty() ? new Date(System.currentTimeMillis()) : Date.valueOf(timeString);


            int flag = stockInService.goodsBack(oid, date, bz, uId);

            if (flag == 1) {
                model.put("msg", "成功");
                // 退回成功之后，将库存的数量减少，先根据订单id查到订单信息，再对对应的地区的库存做清退
                stockOutService.stockOutByOrderId(oid);

                return new ModelAndView("product_return", model);
            } else {
                model.put("msg", "失败");
                return new ModelAndView("product_return", model);

            }
        } catch (Exception e) {
            if (!e.getMessage().isEmpty()) {
                model.put("msg", e.getMessage());
            } else {
                model.put("msg", "失败");

            }
            e.printStackTrace();
            return new ModelAndView("product_return", model);
        }
    }

}
