package com.MvcPractise.service;

import com.MvcPractise.dao.DAO;
import com.MvcPractise.entity.LoanAgreement;
import com.MvcPractise.entity.LoanProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoanService {
    @Autowired
    private DAO dao;

    public boolean saveLoanAgreement(LoanAgreement loanAgreement){
        return dao.saveLoanAgreement(loanAgreement);
    }

    public LoanAgreement getLoanAgreement(long loanAgreementId){
        return dao.getLoanAgreement(loanAgreementId);
    }
}
