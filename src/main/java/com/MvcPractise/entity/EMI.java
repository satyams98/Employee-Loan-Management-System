package com.MvcPractise.entity;

import javax.persistence.Embeddable;

@Embeddable
public class EMI {
    private int month;
    double beginningAmount;
    double installment;
    double principalPaid;
    double interestPaid;
    double endingAmount;

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public double getBeginningAmount() {
        return beginningAmount;
    }

    public void setBeginningAmount(double beginningAmount) {
        this.beginningAmount = beginningAmount;
    }

    public double getInstallment() {
        return installment;
    }

    public void setInstallment(double installment) {
        this.installment = installment;
    }

    public double getInterestPaid() {
        return interestPaid;
    }

    public void setInterestPaid(double interestPaid) {
        this.interestPaid = interestPaid;
    }

    public double getPrincipalPaid() {
        return principalPaid;
    }

    public void setPrincipalPaid(double principalPaid) {
        this.principalPaid = principalPaid;
    }

    public double getEndingAmount() {
        return endingAmount;
    }

    public void setEndingAmount(double endingAmount) {
        this.endingAmount = endingAmount;
    }


}
