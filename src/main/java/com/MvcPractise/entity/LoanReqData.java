package com.MvcPractise.entity;

public class LoanReqData {
    double monthlyIncome;
    double monthlyExpense;
    double repayFrequency;
    double tenure;
    double roi;

    public double getRoi() {
        return roi;
    }

    public void setRoi(double roi) {
        this.roi = roi;
    }



    public double getMonthlyIncome() {
        return monthlyIncome;
    }

    public void setMonthlyIncome(double monthlyIncome) {
        this.monthlyIncome = monthlyIncome;
    }

    public double getMonthlyExpense() {
        return monthlyExpense;
    }

    public void setMonthlyExpense(double monthlyExpense) {
        this.monthlyExpense = monthlyExpense;
    }

    public double getRepayFrequency() {
        return repayFrequency;
    }

    public void setRepayFrequency(double repayFrequency) {
        this.repayFrequency = repayFrequency;
    }

    public double getTenure() {
        return tenure;
    }

    public void setTenure(double tenure) {
        this.tenure = tenure;
    }
}
