package com.friday.controller;

import com.friday.model.sendpage.*;
import com.friday.service.impl.SendpageServiceImpl;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 送货单controller
 */
public class SendPageCategoryController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        SendpageServiceImpl sendpageService = new SendpageServiceImpl();

        List<SendpageCategory> allProducer = sendpageService.getAllCategory();
        model.put("result", allProducer);

        return new ModelAndView("sendpage_category", model);
    }
}
