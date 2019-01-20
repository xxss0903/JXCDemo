package com.friday.model;

import java.util.Date;

public class Order {
    private String oId;

    private String uId;

    private Date oDate;

    private String oBz;

    private Integer oStyle;
    private String styleName;

    public String getoId() {
        return oId;
    }

    public void setoId(String oId) {
        this.oId = oId == null ? null : oId.trim();
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId == null ? null : uId.trim();
    }

    public Date getoDate() {
        return oDate;
    }

    public void setoDate(Date oDate) {
        this.oDate = oDate;
    }

    public String getoBz() {
        if (oBz == null) {
            return "";
        }
        return oBz;
    }

    public void setoBz(String oBz) {
        this.oBz = oBz == null ? null : oBz.trim();
    }

    public Integer getoStyle() {
        return oStyle;
    }

    public void setoStyle(Integer oStyle) {
        String styleName = "";
        switch (oStyle) {
            case 0:
                styleName = "未处理";
                break;
            case 1:
                styleName = "已入库";
                break;
            case -1:
                styleName = "已退回";
                break;
            default:
                styleName = "未处理";
                break;
        }
        setStyleName(styleName);
        this.oStyle = oStyle;
    }

    public String getStyleName() {
        return styleName;
    }

    public void setStyleName(String styleName) {
        this.styleName = styleName;
    }
}