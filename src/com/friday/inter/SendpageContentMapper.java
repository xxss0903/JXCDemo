package com.friday.inter;

import com.friday.model.sendpage.SendpageContent;

import java.util.List;

/**
 * 送货单内容
 */
public interface SendpageContentMapper {
    int deleteByPrimaryKey(Integer cId);

    SendpageContent selectByPrimaryKey(Integer cId);

    int insert(SendpageContent sendpage);

    int insertSelective(SendpageContent sendpage);

    int updateByPrimaryKeySelective(SendpageContent sendpage);

    int updateByPrimaryKey(SendpageContent sendpage);

    List<SendpageContent> selectAll();
}
