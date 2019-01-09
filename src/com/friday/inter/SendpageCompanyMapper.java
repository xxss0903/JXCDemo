package com.friday.inter;


import com.friday.model.sendpage.SendpageCompany;

import java.util.List;

public interface SendpageCompanyMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageCompany selectByPrimaryKey(Integer cId);

    int insert(SendpageCompany sendpage);

    int insertSelective(SendpageCompany sendpage);

    int updateByPrimaryKeySelective(SendpageCompany sendpage);

    int updateByPrimaryKey(SendpageCompany sendpage);

    List<SendpageCompany> selectAll();

}
