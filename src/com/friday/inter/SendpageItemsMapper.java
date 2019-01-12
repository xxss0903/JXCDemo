package com.friday.inter;


import com.friday.model.sendpage.SendpageItems;

import java.util.List;

public interface SendpageItemsMapper {

    int deleteByPrimaryKey(Integer cId);

    SendpageItems selectByPrimaryKey(Integer cId);

    int insert(SendpageItems sendpage);

    int insertSelective(SendpageItems sendpage);

    int updateByPrimaryKeySelective(SendpageItems sendpage);

    int updateByPrimaryKey(SendpageItems sendpage);

    List<SendpageItems> selectAll();

    List<SendpageItems> selectAllBySendpageId(Integer sId);

}
