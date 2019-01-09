package com.friday.model.sendpage;

/**
 * 开票信息
 */
public class SendpageKp {

    private Integer kId;
    private String kDate;
    private String kSkDate;
    // 收款类型
    private Integer kSkType;
    private Float kAmount;

    public Integer getkId() {
        return kId;
    }

    public void setkId(Integer kId) {
        this.kId = kId;
    }

    public String getkDate() {
        return kDate;
    }

    public void setkDate(String kDate) {
        this.kDate = kDate;
    }

    public String getkSkDate() {
        return kSkDate;
    }

    public void setkSkDate(String kSkDate) {
        this.kSkDate = kSkDate;
    }

    public Integer getkSkType() {
        return kSkType;
    }

    public void setkSkType(Integer kSkType) {
        this.kSkType = kSkType;
    }

    public Float getkAmount() {
        return kAmount;
    }

    public void setkAmount(Float kAmount) {
        this.kAmount = kAmount;
    }
}
