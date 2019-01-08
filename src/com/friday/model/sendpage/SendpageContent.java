package com.friday.model.sendpage;

/**
 * 送货内容
 */
public class SendpageContent {
    private Integer cId;
    private String cNumber;
    private String cDate;
    private String cCategory;
    private Integer cItemsId;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcNumber() {
        return cNumber;
    }

    public void setcNumber(String cNumber) {
        this.cNumber = cNumber;
    }

    public String getcDate() {
        return cDate;
    }

    public void setcDate(String cDate) {
        this.cDate = cDate;
    }

    public String getcCategory() {
        return cCategory;
    }

    public void setcCategory(String cCategory) {
        this.cCategory = cCategory;
    }

    public Integer getcItemsId() {
        return cItemsId;
    }

    public void setcItemsId(Integer cItemsId) {
        this.cItemsId = cItemsId;
    }
}
