package com.MvcPractise.service;

import com.MvcPractise.dao.DAO;
import com.MvcPractise.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;

@org.springframework.stereotype.Service
public class EmpService {

    @Autowired
    private DAO dao;

    public boolean createEmployeeRecord(Employee employee){
        return dao.saveEmployee(employee);
    }

    public Employee getEmployeeRecordUsingMail(String email){
        return dao.getEmployeeUsingMail(email);
    }

    public boolean isMailExists(String email){
        return dao.isMailExists(email);
    }
    public boolean isContactNoExists(String mobileNo){
        return dao.isContactNoExists(mobileNo);
    }

    public boolean isProofIdExists(String proofId){
        return dao.isProofIdExists(proofId);
    }
}
