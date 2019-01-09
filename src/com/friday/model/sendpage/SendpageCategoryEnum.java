package com.friday.model.sendpage;

/**
 * 送货类别
 */
public enum SendpageCategoryEnum {
    BIAOQIAN(1, "标签材料");

    private Integer num;
    private String name;

    SendpageCategoryEnum(Integer num, String name){
        this.num = num;
        this.name = name;
    }

    public Integer getNum() {
        return num;
    }

    public String getName() {
        return name;
    }
}
