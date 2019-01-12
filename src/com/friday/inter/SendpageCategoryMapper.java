package com.friday.inter;


import com.friday.model.sendpage.SendpageCategory;

import java.util.List;

public interface SendpageCategoryMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageCategory selectByPrimaryKey(Integer cId);

    int insert(SendpageCategory obj);

    int insertSelective(SendpageCategory obj);

    int updateByPrimaryKeySelective(SendpageCategory obj);

    int updateByPrimaryKey(SendpageCategory obj);

    List<SendpageCategory> selectAll();

}
