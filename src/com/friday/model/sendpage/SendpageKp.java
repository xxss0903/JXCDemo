package com.friday.model.sendpage;

/**
 * 开票信息
 */
public class SendpageKp {

    private Integer kId;
    // 开票日期
    private String kDate;
    // 收款日期
    private String kSkDate;
    // 收款类型
    private Integer kSkType;
    // 收款金额
    private Float kAmount;
    // 开票类型的名称
    private String kSkTypeName;

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
        if (kSkType != null) {
            if (kSkType.equals(SendpageEnums.KpType.COMPANY.getNum())) {
                kSkTypeName = SendpageEnums.KpType.COMPANY.getName();
            }
        }
        this.kSkType = kSkType;
    }

    public Float getkAmount() {
        return kAmount;
    }

    public void setkAmount(Float kAmount) {
        this.kAmount = kAmount;
    }

    public String getkSkTypeName() {
        return kSkTypeName;
    }

    public void setkSkTypeName(String kSkTypeName) {
        this.kSkTypeName = kSkTypeName;
    }
}
