package com.friday.model.sendpage;

import java.util.Date;

/**
 * 送货单
 */
public class Sendpage {
    // 送货单id
    private Integer sId;
    // 标题
    private String sTitle;
    // 日期
    private Date sDate;
    // 送货单号
    private String sNumber;
    // 送货内容id
    private Integer sContentId;
    // 开票id
    private Integer sKpId;
    // 公司id
    private Integer sCompanyId;
    // 开票总价
    private Float sTotalPrice;
    // 快递id
    private Integer sExpressId;
    // 生产商id
    private Integer sProducerId;

    private SendpageCompany sCompany;
    private SendpageExpress sExpress;
    private SendpageProducer sProducer;
    private SendpageKp sKp;
    private SendpageContent sContent;

    public SendpageCompany getsCompany() {
        return sCompany;
    }

    public void setsCompany(SendpageCompany sCompany) {
        this.sCompany = sCompany;
    }

    public SendpageExpress getsExpress() {
        return sExpress;
    }

    public void setsExpress(SendpageExpress sExpress) {
        this.sExpress = sExpress;
    }

    public SendpageProducer getsProducer() {
        return sProducer;
    }

    public void setsProducer(SendpageProducer sProducer) {
        this.sProducer = sProducer;
    }

    public SendpageKp getsKp() {
        return sKp;
    }

    public void setsKp(SendpageKp sKp) {
        this.sKp = sKp;
    }

    public SendpageContent getsContent() {
        return sContent;
    }

    public void setsContent(SendpageContent sContent) {
        this.sContent = sContent;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsTitle() {
        return sTitle;
    }

    public void setsTitle(String sTitle) {
        this.sTitle = sTitle;
    }

    public Date getsDate() {
        return sDate;
    }

    public void setsDate(Date sDate) {
        this.sDate = sDate;
    }

    public String getsNumber() {
        return sNumber;
    }

    public void setsNumber(String sNumber) {
        this.sNumber = sNumber;
    }

    public Integer getsContentId() {
        // 通过contentid获取content内容

        return sContentId;
    }

    public void setsContentId(Integer sContentId) {
        this.sContentId = sContentId;
    }

    public Integer getsKpId() {
        return sKpId;
    }

    public void setsKpId(Integer sKpId) {
        this.sKpId = sKpId;
    }

    public Integer getsCompanyId() {
        return sCompanyId;
    }

    public void setsCompanyId(Integer sCompanyId) {
        this.sCompanyId = sCompanyId;
    }

    public Float getsTotalPrice() {
        return sTotalPrice;
    }

    public void setsTotalPrice(Float sTotalPrice) {
        this.sTotalPrice = sTotalPrice;
    }

    public Integer getsExprexxId() {
        return sExpressId;
    }

    public void setsExprexxId(Integer sExpressId) {
        this.sExpressId = sExpressId;
    }

    public Integer getsProducerId() {
        return sProducerId;
    }

    public void setsProducerId(Integer sProducerId) {
        this.sProducerId = sProducerId;
    }

    @Override
    public String toString() {
        return sId.toString() + " # " + sTitle;
    }

    //    // 送货内容
//    private SendpageContent sSendContent;
//    // 开票数据
//    private SendpageKp sKPContent;
//    // 开票公司
//    private SendpageCompany sCompany;
//    // 制作商
//    private SendpageProducer sProducer;
//    // 快递信息
//    private SendpageExpress sExpress;
}
