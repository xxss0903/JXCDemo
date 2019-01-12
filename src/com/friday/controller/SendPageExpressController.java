package com.friday.controller;

import com.friday.model.sendpage.SendpageExpress;
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
public class SendPageExpressController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        SendpageServiceImpl sendpageService = new SendpageServiceImpl();

        List<SendpageExpress> allKp = sendpageService.getAllExpress();
        model.put("result", allKp);

        return new ModelAndView("sendpage_express", model);
    }
}
