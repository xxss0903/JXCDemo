package com.friday.inter;


import com.friday.model.sendpage.SendpageExpress;

import java.util.List;

public interface SendpageExpressMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageExpress selectByPrimaryKey(Integer cId);

    int insert(SendpageExpress obj);

    int insertSelective(SendpageExpress obj);

    int updateByPrimaryKeySelective(SendpageExpress obj);

    int updateByPrimaryKey(SendpageExpress obj);

    List<SendpageExpress> selectAll();

}
