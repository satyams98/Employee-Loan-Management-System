package com.MvcPractise.dao;

import com.MvcPractise.entity.Employee;
import org.springframework.stereotype.Repository;

@Repository
public interface DAO {
    public boolean saveEmployee(Employee employee);
    public Employee getEmployeeUsingMail(String email);



    public boolean isProofIdExists(String proofId);

    public boolean isMailExists(String email);

    public boolean isContactNoExists(String mobileNo);



}
