package com.friday.inter;

import java.util.List;

import com.friday.model.InStock;

public interface InStockMapper {
    int deleteByPrimaryKey(String iId);

    /**
     * 添加入库信息
     * @param record
     * @return
     */
    int insert(InStock record);

    int insertSelective(InStock record);

    /**
     * 根据入库id获取入库信息
     * @param iId
     * @return
     */
    InStock selectByPrimaryKey(String iId);

    int updateByPrimaryKeySelective(InStock record);

    int updateByPrimaryKey(InStock record);

    /**
     * 获取所有入库记录列表
     * @return
     */
    List<InStock> selectAll();
}