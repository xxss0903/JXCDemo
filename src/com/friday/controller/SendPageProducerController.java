package com.friday.controller;

import com.friday.model.sendpage.Sendpage;
import com.friday.model.sendpage.SendpageExpress;
import com.friday.model.sendpage.SendpageProducer;
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
public class SendPageProducerController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        SendpageServiceImpl sendpageService = new SendpageServiceImpl();

        List<SendpageProducer> allProducer = sendpageService.getAllProducer();
        model.put("result", allProducer);

        return new ModelAndView("sendpage_producer", model);
    }
}
