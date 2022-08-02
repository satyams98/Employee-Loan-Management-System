package com.MvcPractise.dao;

import com.MvcPractise.entity.Employee;
import com.MvcPractise.entity.LoanAgreement;
import com.MvcPractise.service.LoanService;
import org.apache.taglibs.standard.lang.jstl.EmptyOperator;
import org.springframework.stereotype.Repository;

@Repository
public interface DAO {
    public boolean saveEmployee(Employee employee);
    public Employee getEmployeeUsingMail(String email);

    public Employee getEmployeeUsingProof(String proofType, String proofId);

    public boolean isProofIdExists(String proofId);

    public boolean isMailExists(String email);

    public boolean isContactNoExists(String mobileNo);

    public boolean updateEmployee(Employee employee);

    public boolean deleteEmployee(Employee employee);
    public boolean deleteRecord(String email);

    public boolean saveLoanAgreement(LoanAgreement loanAgreement);

    public LoanAgreement getLoanAgreement(Long loanAgreementId);

    public boolean updateEmployeeRecord(Employee employee);

    public boolean mergeEmployeeRecord(Employee employee);





}
