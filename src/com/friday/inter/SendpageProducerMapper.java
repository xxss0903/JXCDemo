package com.friday.inter;


import com.friday.model.sendpage.SendpageProducer;

import java.util.List;

public interface SendpageProducerMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageProducer selectByPrimaryKey(Integer cId);

    int insert(SendpageProducer sendpage);

    int insertSelective(SendpageProducer sendpage);

    int updateByPrimaryKeySelective(SendpageProducer sendpage);

    int updateByPrimaryKey(SendpageProducer sendpage);

    List<SendpageProducer> selectAll();

}
