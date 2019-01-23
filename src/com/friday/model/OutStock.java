package com.friday.model;

import java.util.Date;

/**
 * 出库记录
 */
public class OutStock {
    private Integer oId;

    private Integer sId;

    private Date oDate;

    private String uId;

    private String oBz;
    // 出库的状态，如果已经出过库，那么就能退回，如果已经退回过了，那么就不能再退回了
    // 1，是已出库没退回，2是已经退回
    private Integer oSt;

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Date getoDate() {
        return oDate;
    }

    public void setoDate(Date oDate) {
        this.oDate = oDate;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId == null ? null : uId.trim();
    }

    public String getoBz() {
        return oBz;
    }

    public void setoBz(String oBz) {
        this.oBz = oBz == null ? null : oBz.trim();
    }

    public Integer getoSt() {
        return oSt;
    }

    public void setoSt(Integer oSt) {
        this.oSt = oSt;
    }
}