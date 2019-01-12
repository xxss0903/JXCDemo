package com.friday.model.sendpage;

/**
 * 每个送货单中具体内容
 */
public class SendpageItems {

    // 送货的列表id
    private Integer iId;
    // 对应的item的id
    private Integer iItemId;
    // 数量
    private Integer iAmount;
    // 总价
    private Float iPriceTotal;
    // 备注
    private String iComment;
    // 送货单的id
    private Integer sId;
    // category的id
    private Integer cId;
    private SendpageItem sendpageItem;

    public Integer getiId() {
        return iId;
    }

    public void setiId(Integer iId) {
        this.iId = iId;
    }

    public Integer getiItemId() {
        return iItemId;
    }

    public void setiItemId(Integer iItemId) {
        this.iItemId = iItemId;
    }

    public Integer getiAmount() {
        return iAmount;
    }

    public void setiAmount(Integer iAmount) {
        this.iAmount = iAmount;
    }

    public Float getiPriceTotal() {
        return iPriceTotal;
    }

    public void setiPriceTotal(Float iPriceTotal) {
        this.iPriceTotal = iPriceTotal;
    }

    public String getiComment() {
        return iComment;
    }

    public void setiComment(String iComment) {
        this.iComment = iComment;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public SendpageItem getSendpageItem() {
        return sendpageItem;
    }

    public void setSendpageItem(SendpageItem sendpageItem) {
        this.sendpageItem = sendpageItem;
    }
}
