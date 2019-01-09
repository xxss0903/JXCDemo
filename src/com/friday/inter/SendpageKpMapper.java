package com.friday.inter;


import com.friday.model.sendpage.SendpageKp;

import java.util.List;

public interface SendpageKpMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageKp selectByPrimaryKey(Integer cId);

    int insert(SendpageKp obj);

    int insertSelective(SendpageKp obj);

    int updateByPrimaryKeySelective(SendpageKp obj);

    int updateByPrimaryKey(SendpageKp obj);

    List<SendpageKp> selectAll();

}
