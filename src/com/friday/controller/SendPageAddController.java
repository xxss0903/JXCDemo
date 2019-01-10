package com.friday.controller;

import com.friday.model.sendpage.Sendpage;
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
public class SendPageAddController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        System.out.println("添加送货单");
        Map<String, Object> model = new HashMap<String, Object>();
        SendpageServiceImpl sendpageService = new SendpageServiceImpl();
        List<Sendpage> allSendpage = sendpageService.getAllSendpage();
        if (allSendpage.size() > 0) {
            for (Sendpage sendpage : allSendpage) {
                System.out.println(sendpage.toString());
            }
            model.put("result", allSendpage);
        } else {
            System.out.println("送货单为0");
        }
        return new ModelAndView("sendpage_add", model);
    }
}
