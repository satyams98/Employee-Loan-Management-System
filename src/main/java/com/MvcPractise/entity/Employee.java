package com.MvcPractise.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Employee {
    @Id
    private long id;
    private String firstName;
    private String lastName;
    private long mobileNo;
    private String add1;
    private String add2;
    private int pinCode;
    private String emailAdd;
}
