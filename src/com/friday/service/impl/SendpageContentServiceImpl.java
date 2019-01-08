package com.friday.service.impl;

import com.friday.inter.SendpageContentMapper;
import com.friday.model.sendpage.SendpageContent;

import java.util.List;

public class SendpageContentServiceImpl implements SendpageContentMapper{
    @Override
    public int deleteByPrimaryKey(Integer cId) {
        return 0;
    }

    @Override
    public SendpageContent selectByPrimaryKey(Integer cId) {
        return null;
    }

    @Override
    public int insert(SendpageContent sendpage) {
        return 0;
    }

    @Override
    public int insertSelective(SendpageContent sendpage) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(SendpageContent sendpage) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(SendpageContent sendpage) {
        return 0;
    }

    @Override
    public List<SendpageContent> selectAll() {
        return null;
    }
}
