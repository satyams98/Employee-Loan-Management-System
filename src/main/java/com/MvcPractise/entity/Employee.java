package com.MvcPractise.entity;

import org.hibernate.annotations.Cascade;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.*;

@Entity
public class Employee {

    @Id
    private String email;
    private long id;
    private String firstName;
    private String lastName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dob;
    private String sex;
    private String religion;
    private String proofType;
    private String proofId;
    private String mobileNo;

    private double monthlyIncome;
    private double totalMonthlyExpenses;
    private double maxEligibleLoanAmount;
    private double maxEligibleEMI;
    private double dbr;

    @OneToMany(mappedBy = "employee")
    @Cascade({org.hibernate.annotations.CascadeType.ALL, org.hibernate.annotations.CascadeType.DELETE})
    private List<LoanAgreement> loanAgreements=new ArrayList<>();

    public double getMonthlyIncome() {
        return monthlyIncome;
    }

    public void setMonthlyIncome(double monthlyIncome) {
        this.monthlyIncome = monthlyIncome;
    }

    public double getTotalMonthlyExpenses() {
        return totalMonthlyExpenses;
    }

    public void setTotalMonthlyExpenses(double totalMonthlyExpenses) {
        this.totalMonthlyExpenses = totalMonthlyExpenses;
    }

    public double getMaxEligibleLoanAmount() {
        return maxEligibleLoanAmount;
    }

    public void setMaxEligibleLoanAmount(double maxEligibleLoanAmount) {
        this.maxEligibleLoanAmount = maxEligibleLoanAmount;
    }

    public double getMaxEligibleEMI() {
        return maxEligibleEMI;
    }

    public void setMaxEligibleEMI(double maxEligibleEMI) {
        this.maxEligibleEMI = maxEligibleEMI;
    }

    public List<LoanAgreement> getLoanAgreements() {
        return loanAgreements;
    }

    public void setLoanAgreements(List<LoanAgreement> loanAgreements) {
        this.loanAgreements = loanAgreements;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getProofType() {
        return proofType;
    }

    public void setProofType(String proofType) {
        this.proofType = proofType;
    }

    public String getProofId() {
        return proofId;
    }

    public void setProofId(String proofId) {
        this.proofId = proofId;
    }





    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name="street", column = @Column(name="currentStreet")),
            @AttributeOverride(name="country", column = @Column(name="currentCountry")),
            @AttributeOverride(name="city", column = @Column(name="currentCity")),
            @AttributeOverride(name="zip", column = @Column(name="currentZip")),
            @AttributeOverride(name="state", column = @Column(name="currentState"))

    })
    private Address currentAdd;

    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name="street", column = @Column(name="permanentStreet")),
            @AttributeOverride(name="country", column = @Column(name="permanentCountry")),
            @AttributeOverride(name="city", column = @Column(name="permanentCity")),
            @AttributeOverride(name="zip", column = @Column(name="permanentZip")),
            @AttributeOverride(name="state", column = @Column(name="permanentState"))

    })
    private Address permanentAdd;

    public List<Family> getFamilyList() {
        return familyList;
    }

    public void setFamilyList(List<Family> familyList) {
        this.familyList = familyList;
    }

    @Cascade({org.hibernate.annotations.CascadeType.ALL, org.hibernate.annotations.CascadeType.DELETE})
    @ElementCollection
    List<Family> familyList= new ArrayList<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Address getCurrentAdd() {
        return currentAdd;
    }

    public void setCurrentAdd(Address currentAdd) {
        this.currentAdd = currentAdd;
    }

    public Address getPermanentAdd() {
        return permanentAdd;
    }

    public void setPermanentAdd(Address permanentAdd) {
        this.permanentAdd = permanentAdd;
    }

    public double getDbr() {
        return dbr;
    }

    public void setDbr(double dbr) {
        this.dbr = dbr;
    }
}
