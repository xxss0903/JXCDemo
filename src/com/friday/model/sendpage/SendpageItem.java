package com.friday.model.sendpage;

/**
 * 单个商品的item
 */
public class SendpageItem {

    private Integer iId;
    private String iName;
    // 单价
    private Float iPrice;
    // 对应的category的id
    private Integer cId;
    // category的名称
    private String cName;

    public Integer getiId() {
        return iId;
    }

    public void setiId(Integer iId) {
        this.iId = iId;
    }

    public String getiName() {
        return iName;
    }

    public void setiName(String iName) {
        this.iName = iName;
    }

    public Float getiPrice() {
        return iPrice;
    }

    public void setiPrice(Float iPrice) {
        this.iPrice = iPrice;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }
}
