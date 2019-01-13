package com.friday.inter;


import com.friday.model.sendpage.SendpageItem;

import java.util.List;

public interface SendpageItemMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageItem selectByPrimaryKey(Integer iId);

    int insert(SendpageItem obj);

    int insertSelective(SendpageItem obj);

    int updateByPrimaryKeySelective(SendpageItem obj);

    List<SendpageItem> selectByCategoryId(Integer cId);

    int updateByPrimaryKey(SendpageItem obj);

    List<SendpageItem> selectAll();

}
