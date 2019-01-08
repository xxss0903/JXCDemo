package com.friday.inter;


import com.friday.model.sendpage.Sendpage;

import java.util.List;

public interface SendpageMapper {

    int deleteByPrimaryKey(Integer cId);

    Sendpage selectByPrimaryKey(Integer cId);

    int insert(Sendpage sendpage);

    int insertSelective(Sendpage sendpage);

    int updateByPrimaryKeySelective(Sendpage sendpage);

    int updateByPrimaryKey(Sendpage sendpage);

    List<Sendpage> selectAll();

}
