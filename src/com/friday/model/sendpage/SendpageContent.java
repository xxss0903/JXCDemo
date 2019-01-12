package com.friday.model.sendpage;

import java.util.List;

/**
 * 送货内容
 */
public class SendpageContent {
    private Integer cId;
    private String cNumber;
    private String cDate;
    private String cCategory;
    private Integer cItemsId;
    private List<SendpageItems> cItemsObj;

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
        if (cCategory != null) {
            if (cCategory.equals("1")) {
                this.cCategory = SendpageEnums.CategoryEnum.BIAOQIAN.getName();
            }
        } else {
            this.cCategory = SendpageEnums.CategoryEnum.BIAOQIAN.getName();
        }
    }

    public Integer getcItemsId() {
        return cItemsId;
    }

    public void setcItemsId(Integer cItemsId) {
        this.cItemsId = cItemsId;
    }

    public List<SendpageItems> getcItemsObj() {
        return cItemsObj;
    }

    public void setcItemsObj(List<SendpageItems> cItemsObj) {
        this.cItemsObj = cItemsObj;
    }
}
