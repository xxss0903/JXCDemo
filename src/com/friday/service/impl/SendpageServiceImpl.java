package com.friday.service.impl;

import com.friday.inter.SendpageContentMapper;
import com.friday.inter.SendpageMapper;
import com.friday.model.sendpage.Sendpage;
import com.friday.model.sendpage.SendpageContent;
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
                SendpageContentMapper contentMapper = sqlSession.getMapper(SendpageContentMapper.class);
                for (Sendpage sendpage : allSendpage) {
                    SendpageContent content = contentMapper.selectByPrimaryKey(sendpage.getsContentId());
                    sendpage.setsContent(content);
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
