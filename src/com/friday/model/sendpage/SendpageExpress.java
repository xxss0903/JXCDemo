package com.friday.model.sendpage;

/**
 * 快递信息
 */
public class SendpageExpress {

    private Integer eId;
    private String eAddress;
    private String ePerson;
    private String ePhone;
    private Integer sId;

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String geteAddress() {
        return eAddress;
    }

    public void seteAddress(String eAddress) {
        this.eAddress = eAddress;
    }

    public String getePerson() {
        return ePerson;
    }

    public void setePerson(String ePerson) {
        this.ePerson = ePerson;
    }

    public String getePhone() {
        return ePhone;
    }

    public void setePhone(String ePhone) {
        this.ePhone = ePhone;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }
}
