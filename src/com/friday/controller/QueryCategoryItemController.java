package com.friday.controller;

import com.friday.inter.SendpageItemMapper;
import com.friday.model.sendpage.SendpageCategory;
import com.friday.model.sendpage.SendpageItem;
import com.friday.service.impl.SendpageServiceImpl;
import com.friday.utils.SessionUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 送货单controller
 */
public class QueryCategoryItemController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cId = request.getParameter("cid");
        Map<String, Object> model = new HashMap<String, Object>();
        System.out.println("category id " + cId);
        try {
            SendpageServiceImpl sendpageService = new SendpageServiceImpl();
            List<SendpageItem> allItem = sendpageService.getAllItemByCategoryId(Integer.parseInt(cId));
            model.put("result", allItem);

            return new ModelAndView("sendpage_item", model);
        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("error", model);
        }

    }
}
