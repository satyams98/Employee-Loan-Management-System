package com.MvcPractise.entity;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Entity
public class LoanAgreement {


    @Id
    @GeneratedValue
    private long loanAgreementId;
    @OneToOne(optional = false)
    @Cascade({org.hibernate.annotations.CascadeType.DELETE, org.hibernate.annotations.CascadeType.ALL})
    @JoinColumn(name = "loan_product_id")
    public LoanProduct loanProduct;


    public double loanAmount;

    @ManyToOne
    @JoinColumn(name = "employee_email",
    referencedColumnName = "email")
    private Employee employee;
    public double tenure;
    public double rate;
    public String loanStatus;
    public double emiAmount;

    public Date loanDisbursalDate;
    public Date emiDueDate;
    public double repaymentFrequency;

    private static final DecimalFormat df = new DecimalFormat("0.00");

    @ElementCollection(fetch = FetchType.EAGER)
    @Cascade({org.hibernate.annotations.CascadeType.DELETE, org.hibernate.annotations.CascadeType.ALL})
    private List<EMI> repaymentSchedule=new ArrayList<>();

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public void calculateEMI(){
        double effectiveRate = rate/(100*repaymentFrequency);
        double num = tenure*repaymentFrequency;

        double numerator = loanAmount * effectiveRate;
        double denominator = 1 - Math.pow( (1 + effectiveRate), (-num));

        double emi = numerator/denominator;

        emi = Double.parseDouble(df.format(emi));

        setEmiAmount(emi);
    }

    public void generateRS(){
        double effectiveRate = rate/(100*repaymentFrequency);
        double num = tenure*repaymentFrequency;

        double beginningAmount = loanAmount;
        double installment = emiAmount;
        double interestPaid = 0;
        double principalPaid = 0;
        double endingAmount = loanAmount;

        for(int month=1; month<=num; month++){


            beginningAmount = endingAmount;
            interestPaid = beginningAmount * effectiveRate;
            principalPaid = installment - interestPaid;
            endingAmount = beginningAmount - principalPaid;


            beginningAmount = Double.parseDouble(df.format(beginningAmount));
            interestPaid = Double.parseDouble(df.format(interestPaid));
            principalPaid = Double.parseDouble(df.format(principalPaid));
            endingAmount = Double.parseDouble(df.format(endingAmount));

            EMI emi = new EMI();
            emi.setMonth(month);
            emi.setBeginningAmount(beginningAmount);
            emi.setInstallment(installment);
            emi.setInterestPaid(interestPaid);
            emi.setPrincipalPaid(principalPaid);
            if(month==num)
                emi.setEndingAmount(0);
            else
            emi.setEndingAmount(endingAmount);

            repaymentSchedule.add(emi);


        }
    }


    public Long getLoanAgreementId() {
        return loanAgreementId;
    }

    public void setLoanAgreementId(Long loanAgreementId) {
        this.loanAgreementId = loanAgreementId;
    }

    public double getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }

    public double getTenure() {
        return tenure;
    }

    public void setTenure(double tenure) {
        this.tenure = tenure;
    }



    public String getLoanStatus() {
        return loanStatus;
    }

    public void setLoanStatus(String loanStatus) {
        this.loanStatus = loanStatus;
    }


    public Date getLoanDisbursalDate() {
        return loanDisbursalDate;
    }

    public void setLoanDisbursalDate(Date loanDisbursalDate) {
        this.loanDisbursalDate = loanDisbursalDate;
    }

    public Date getEmiDueDate() {
        return emiDueDate;
    }

    public void setEmiDueDate(Date emiDueDate) {
        this.emiDueDate = emiDueDate;
    }

    public double getRepaymentFrequency() {
        return repaymentFrequency;
    }

    public void setRepaymentFrequency(double repaymentFrequency) {
        this.repaymentFrequency = repaymentFrequency;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public double getEmiAmount() {
        return emiAmount;
    }

    public void setEmiAmount(double emiAmount) {
        this.emiAmount = emiAmount;
    }


    public List<EMI> getRepaymentSchedule() {
        return repaymentSchedule;
    }

    public void setRepaymentSchedule(List<EMI> repaymentSchedule) {
        this.repaymentSchedule = repaymentSchedule;
    }

    public LoanProduct getLoanProduct() {
        return loanProduct;
    }

    public void setLoanProduct(LoanProduct loanProduct) {
        this.loanProduct = loanProduct;
    }


}
