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
                SendpageItemsMapper itemsMapper = sqlSession.getMapper(SendpageItemsMapper.class);
                SendpageItemMapper itemMapper = sqlSession.getMapper(SendpageItemMapper.class);
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
                    List<SendpageItems> sendpageItems = itemsMapper.selectAllBySendpageId(content.getcItemsId());
                    for (SendpageItems item : sendpageItems) {
                        SendpageItem sendpageItem = itemMapper.selectByPrimaryKey(item.getiItemId());
                        item.setSendpageItem(sendpageItem);
                    }

                    content.setcItemsObj(sendpageItems);
                    sendpage.setsContent(content);
                    sendpage.setsCompany(company);
                    sendpage.setsProducer(producer);
                    sendpage.setsKp(kp);
                    sendpage.setsExpress(express);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allSendpage;
    }

    @Override
    public Sendpage getSendpageById(Integer sendpageId) {
        SqlSession sqlSession = null;
        Sendpage sendpage = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageMapper sendpageManager = sqlSession.getMapper(SendpageMapper.class);
            sendpage = sendpageManager.selectByPrimaryKey(sendpageId);
            if (sendpage != null) {
                // 送货内容
                SendpageContentMapper contentMapper = sqlSession.getMapper(SendpageContentMapper.class);
                SendpageItemsMapper itemsMapper = sqlSession.getMapper(SendpageItemsMapper.class);
                SendpageItemMapper itemMapper = sqlSession.getMapper(SendpageItemMapper.class);
                // 公司信息
                SendpageCompanyMapper companyMapper = sqlSession.getMapper(SendpageCompanyMapper.class);
                // 生产商
                SendpageProducerMapper producerMapper = sqlSession.getMapper(SendpageProducerMapper.class);
                // 发票信息
                SendpageKpMapper kpMapper = sqlSession.getMapper(SendpageKpMapper.class);
                // 快递信息
                SendpageExpressMapper expressMapper = sqlSession.getMapper(SendpageExpressMapper.class);
                SendpageContent content = contentMapper.selectByPrimaryKey(sendpage.getsContentId());
                SendpageCompany company = companyMapper.selectByPrimaryKey(sendpage.getsCompanyId());
                SendpageProducer producer = producerMapper.selectByPrimaryKey(sendpage.getsCompanyId());
                SendpageKp kp = kpMapper.selectByPrimaryKey(sendpage.getsKpId());
                SendpageExpress express = expressMapper.selectByPrimaryKey(sendpage.getsCompanyId());
                List<SendpageItems> sendpageItems = itemsMapper.selectAllBySendpageId(content.getcItemsId());
                for (SendpageItems item : sendpageItems) {
                    SendpageItem sendpageItem = itemMapper.selectByPrimaryKey(item.getiItemId());
                    item.setSendpageItem(sendpageItem);
                }

                content.setcItemsObj(sendpageItems);
                sendpage.setsContent(content);
                sendpage.setsCompany(company);
                sendpage.setsProducer(producer);
                sendpage.setsKp(kp);
                sendpage.setsExpress(express);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return sendpage;
    }

    @Override
    public List<SendpageCompany> getAllCompany() {
        SqlSession sqlSession = null;
        List<SendpageCompany> allCompany = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageCompanyMapper mapper = sqlSession.getMapper(SendpageCompanyMapper.class);
            allCompany = mapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allCompany;
    }

    @Override
    public List<SendpageExpress> getAllExpress() {
        SqlSession sqlSession = null;
        List<SendpageExpress> allExpress = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageExpressMapper mapper = sqlSession.getMapper(SendpageExpressMapper.class);
            allExpress = mapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allExpress;
    }

    @Override
    public List<SendpageProducer> getAllProducer() {
        SqlSession sqlSession = null;
        List<SendpageProducer> allExpress = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageProducerMapper mapper = sqlSession.getMapper(SendpageProducerMapper.class);
            allExpress = mapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allExpress;
    }

    @Override
    public List<SendpageKp> getAllKaipiao() {
        SqlSession sqlSession = null;
        List<SendpageKp> allKp = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageKpMapper mapper = sqlSession.getMapper(SendpageKpMapper.class);
            allKp = mapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allKp;

    }

    @Override
    public List<SendpageItem> getAllItem() {
        SqlSession sqlSession = null;
        List<SendpageItem> allItem = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageItemMapper mapper = sqlSession.getMapper(SendpageItemMapper.class);
            allItem = mapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allItem;
    }

    @Override
    public List<SendpageCategory> getAllCategory() {
        SqlSession sqlSession = null;
        List<SendpageCategory> allItem = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageCategoryMapper mapper = sqlSession.getMapper(SendpageCategoryMapper.class);
            allItem = mapper.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allItem;
    }

    @Override
    public List<SendpageItem> getAllItemByCategoryId(Integer cId) {
        SqlSession sqlSession = null;
        List<SendpageItem> allItem = null;
        try {
            sqlSession = SessionUtils.getSession();
            SendpageItemMapper mapper = sqlSession.getMapper(SendpageItemMapper.class);
            allItem = mapper.selectByCategoryId(cId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            SessionUtils.closeSession(sqlSession);
        }
        return allItem;
    }


}
