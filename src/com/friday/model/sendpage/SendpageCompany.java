package com.friday.model.sendpage;

/**
 * 送货公司信息
 */
public class SendpageCompany {

    private Integer tId;
    private String tCompany;
    private String tXy;
    private String tKhBank;
    // 银行账户
    private String tBaccount;
    private String tAddress;
    private String tPhone;
    private String tFaxPhone;
    // 邮编
    private String tMail;

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettCompany() {
        return tCompany;
    }

    public void settCompany(String tCompany) {
        this.tCompany = tCompany;
    }

    public String gettXy() {
        return tXy;
    }

    public void settXy(String tXy) {
        this.tXy = tXy;
    }

    public String gettKhBank() {
        return tKhBank;
    }

    public void settKhBank(String tKhBank) {
        this.tKhBank = tKhBank;
    }

    public String gettBaccount() {
        return tBaccount;
    }

    public void settBaccount(String tBaccount) {
        this.tBaccount = tBaccount;
    }

    public String gettAddress() {
        return tAddress;
    }

    public void settAddress(String tAddress) {
        this.tAddress = tAddress;
    }

    public String gettPhone() {
        return tPhone;
    }

    public void settPhone(String tPhone) {
        this.tPhone = tPhone;
    }

    public String gettFaxPhone() {
        return tFaxPhone;
    }

    public void settFaxPhone(String tFaxPhone) {
        this.tFaxPhone = tFaxPhone;
    }

    public String gettMail() {
        return tMail;
    }

    public void settMail(String tMail) {
        this.tMail = tMail;
    }
}
