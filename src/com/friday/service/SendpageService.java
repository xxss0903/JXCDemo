package com.friday.service;

import com.friday.model.sendpage.Sendpage;
import com.friday.model.sendpage.SendpageContent;

import java.util.List;

/**
 * 发货单操作
 */
public interface SendpageService {
    List<Sendpage> getAllSendpage();
}
