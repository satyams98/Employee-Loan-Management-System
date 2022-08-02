package com.MvcPractise.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class LoanProduct {
    @Id
    @GeneratedValue
    private Long LoanProductId;

    private String loanProductCode;
    private String loanProductName;

    private double tenure;
    private double minLoanAmount;
    private double maxLoanAmount;
    private double roi;
    private double LTV;
    private String status;
    private String emiStatus;
    private double emiPerMonth;

    public String getLoanProductCode() {
        return loanProductCode;
    }

    public void setLoanProductCode(String loanProductCode) {
        this.loanProductCode = loanProductCode;
    }

    public String getLoanProductName() {
        return loanProductName;
    }

    public void setLoanProductName(String loanProductName) {
        this.loanProductName = loanProductName;
    }

    public double getTenure() {
        return tenure;
    }

    public void setTenure(double tenure) {
        this.tenure = tenure;
    }

    public double getMinLoanAmount() {
        return minLoanAmount;
    }

    public void setMinLoanAmount(double minLoanAmount) {
        this.minLoanAmount = minLoanAmount;
    }

    public double getMaxLoanAmount() {
        return maxLoanAmount;
    }

    public void setMaxLoanAmount(double maxLoanAmount) {
        this.maxLoanAmount = maxLoanAmount;
    }

    public double getRoi() {
        return roi;
    }

    public void setRoi(double roi) {
        this.roi = roi;
    }

    public double getLTV() {
        return LTV;
    }

    public void setLTV(double LTV) {
        this.LTV = LTV;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmiStatus() {
        return emiStatus;
    }

    public void setEmiStatus(String emiStatus) {
        this.emiStatus = emiStatus;
    }

    public double getEmiPerMonth() {
        return emiPerMonth;
    }

    public void setEmiPerMonth(double emiPerMonth) {
        this.emiPerMonth = emiPerMonth;
    }


    public Long getLoanProductId() {
        return LoanProductId;
    }

    public void setLoanProductId(Long loanProductId) {
        LoanProductId = loanProductId;
    }
}
