package com.MvcPractise.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Employee {
    @Id
    @GeneratedValue
    private long id;
    private String firstName;
    private String lastName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dob;
    private String sex;
    private String religion;
    private String proofType;
    private String proofId;

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

    private long mobileNo;
    private String email;

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

    public long getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(long mobileNo) {
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
}
