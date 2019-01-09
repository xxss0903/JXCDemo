package com.friday.service.impl;

import com.friday.inter.*;
import com.friday.model.sendpage.*;
import com.friday.service.SendpageService;
import com.friday.utils.SessionUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class SendpageServiceImpl implements SendpageService {
    @Override
    public List<Sendpage> getAllSendpage() {
        SqlSession sqlSession = null;
        List<Sendpage> allSendpage = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageMapper sendpageManager = sqlSession.getMapper(SendpageMapper.class);
            allSendpage = sendpageManager.selectAll();
            if (allSendpage.size() > 0) {
                // 送货内容
                SendpageContentMapper contentMapper = sqlSession.getMapper(SendpageContentMapper.class);
                // 公司信息
                SendpageCompanyMapper companyMapper = sqlSession.getMapper(SendpageCompanyMapper.class);
                // 生产商
                SendpageProducerMapper producerMapper = sqlSession.getMapper(SendpageProducerMapper.class);
                // 发票信息
                SendpageKpMapper kpMapper = sqlSession.getMapper(SendpageKpMapper.class);
                // 快递信息
                SendpageExpressMapper expressMapper = sqlSession.getMapper(SendpageExpressMapper.class);

                for (Sendpage sendpage : allSendpage) {
                    SendpageContent content = contentMapper.selectByPrimaryKey(sendpage.getsContentId());
                    SendpageCompany company = companyMapper.selectByPrimaryKey(sendpage.getsCompanyId());
                    SendpageProducer producer = producerMapper.selectByPrimaryKey(sendpage.getsCompanyId());
                    SendpageKp kp = kpMapper.selectByPrimaryKey(sendpage.getsKpId());
                    SendpageExpress express = expressMapper.selectByPrimaryKey(sendpage.getsCompanyId());

                    sendpage.setsContent(content);
                    sendpage.setsCompany(company);
                    sendpage.setsProducer(producer);
                    sendpage.setsKp(kp);
                    sendpage.setsExpress(express);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allSendpage;
    }

}
