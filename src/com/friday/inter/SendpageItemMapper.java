package com.friday.inter;


import com.friday.model.sendpage.SendpageItem;

import java.util.List;

public interface SendpageItemMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageItem selectByPrimaryKey(Integer cId);

    int insert(SendpageItem obj);

    int insertSelective(SendpageItem obj);

    int updateByPrimaryKeySelective(SendpageItem obj);

    int updateByPrimaryKey(SendpageItem obj);

    List<SendpageItem> selectAll();

}
