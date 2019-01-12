package com.friday.service;

import com.friday.model.sendpage.*;

import java.util.List;

/**
 * 发货单操作
 */
public interface SendpageService {

    /**
     * 获取所有送货单
     * @return
     */
    List<Sendpage> getAllSendpage();

    /**
     * 获取送货单
     * @param sendpageId
     * @return
     */
    Sendpage getSendpageById(Integer sendpageId);

    /**
     * 获取送货公司信息
     * @return 所有送货公司，为空则返回一个空列表
     */
    List<SendpageCompany> getAllCompany();

    /**
     * 快递信息
     * @return
     */
    List<SendpageExpress> getAllExpress();

    /**
     * 生产商
     * @return
     */
    List<SendpageProducer> getAllProducer();

    /**
     * 开票信息
     * @return
     */
    List<SendpageKp> getAllKaipiao();

    /**
     * 送货的item类型
     * @return
     */
    List<SendpageItem> getAllItem();

    /**
     * 送货单的category
     * @return
     */
    List<SendpageCategory> getAllCategory();

}
