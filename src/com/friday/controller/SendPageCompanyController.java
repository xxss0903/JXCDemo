package com.friday.controller;

import com.friday.model.sendpage.Sendpage;
import com.friday.model.sendpage.SendpageCompany;
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
public class SendPageCompanyController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("编辑送货单历史");
        Map<String, Object> model = new HashMap<String, Object>();
        SendpageServiceImpl sendpageService = new SendpageServiceImpl();
        List<SendpageCompany> allCompany = sendpageService.getAllCompany();

        model.put("result", allCompany);
        return new ModelAndView("sendpage_company", model);
    }
}
