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
 * 打印机打印送货单controller
 */
public class SendPagePrintImplController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("打印送货单历史");
        Map<String, Object> model = new HashMap<String, Object>();
        SendpageServiceImpl sendpageService = new SendpageServiceImpl();

        String searchId = request.getParameter("sendpageid");
        if (searchId != null && !searchId.isEmpty()) {
            // 搜索送货单
            Sendpage sendpage = sendpageService.getSendpageById(Integer.valueOf(searchId));
            model.put("sendpage", sendpage);
        } else {
            // 获取送货单第一个
            List<Sendpage> allSendpage = sendpageService.getAllSendpage();
            if (allSendpage.size() > 0) {
                for (Sendpage sendpage : allSendpage) {
                    System.out.println(sendpage.toString());
                }
                model.put("sendpage", allSendpage.get(0));
            } else {
                System.out.println("送货单为0");
            }
        }

        return new ModelAndView("sendpage_print", model);
    }
}
