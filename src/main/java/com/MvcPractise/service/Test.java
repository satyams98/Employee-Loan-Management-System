package com.MvcPractise.service;

import com.MvcPractise.entity.Address;
import com.MvcPractise.entity.Employee;

public class Test {
    public static void main(String[] args) {
        Employee employee = new Employee();
        Address address = new Address();
        employee.setCurrentAdd(address);
        employee.getCurrentAdd().setCity("gkp");
        System.out.println(employee.getCurrentAdd().getCity());
    }
}
