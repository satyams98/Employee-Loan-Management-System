package com.MvcPractise.dao;

import com.MvcPractise.entity.Employee;
import com.MvcPractise.entity.LoanAgreement;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class DAOImplementation implements DAO{
    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public boolean saveEmployee(Employee employee) {
        sessionFactory.getCurrentSession().save(employee);

        return true;
    }

    @Override
    public Employee getEmployeeUsingMail(String email) {
        Session session =sessionFactory.openSession();
        Query query =session.createQuery("FROM Employee e where e.email=:email", Employee.class);
        query.setParameter("email", email);
        session.getSession().beginTransaction();
        Employee employee = (Employee) query.uniqueResult();
        session.getTransaction().commit();


        return employee;
    }

    @Override
    public Employee getEmployeeUsingProof(String proofType, String proofId) {
        Session session =sessionFactory.openSession();
        Query query =session.createQuery("FROM Employee e where e.proofId=:proofId and e.proofType=:proofType", Employee.class);
        query.setParameter("proofId", proofId);
        query.setParameter("proofType", proofType);
        session.getSession().beginTransaction();
        Employee employee = (Employee) query.uniqueResult();
        session.getTransaction().commit();

        return employee;
    }


    @Override
    public boolean isProofIdExists(String proofId) {
        Session session =sessionFactory.openSession();
        Query query =session.createQuery("FROM Employee e where e.proofId=:proofId", Employee.class);
        query.setParameter("proofId", proofId);
        session.getSession().beginTransaction();
        Employee employee = (Employee) query.uniqueResult();
        session.getTransaction().commit();


        if(employee!=null){
            return true;
        }
        return false;
    }

    @Override
    public boolean isMailExists(String email) {
        Employee employee=getEmployeeUsingMail(email);
        if (employee!=null){
            return true;
        }
        return false;
    }

    @Override
    public boolean isContactNoExists(String mobileNo) {
        Session session =sessionFactory.openSession();
        Query query =session.createQuery("FROM Employee e where e.mobileNo=:mobileNo", Employee.class);
        query.setParameter("mobileNo", mobileNo);
        session.getSession().beginTransaction();
        Employee employee = (Employee) query.uniqueResult();
        session.getTransaction().commit();

        if(employee!=null){
            return true;
        }
        return false;
    }


    @Override
    public boolean updateEmployee(Employee employee) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Employee e where e.proofId=:proofId", Employee.class);
        query.setParameter("proofId", employee.getProofId());

        Employee employee1 = (Employee) query.uniqueResult();

        deleteEmployee(employee1);
        return saveEmployee(employee);


    }


    @Override
    public boolean deleteEmployee(Employee employee) {

         sessionFactory.getCurrentSession().delete(employee);
         return true;
    }


    @Override
    public boolean deleteRecord(String email){

        Employee employee = sessionFactory.getCurrentSession().get(Employee.class, email);

        sessionFactory.getCurrentSession().delete(employee);
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public boolean saveLoanAgreement(LoanAgreement loanAgreement) {
        sessionFactory.getCurrentSession().clear();
        sessionFactory.getCurrentSession().save(loanAgreement);

        return true;
    }

    @Override
    public LoanAgreement getLoanAgreement(Long loanAgreementId) {
        return sessionFactory.getCurrentSession().get(LoanAgreement.class, loanAgreementId);

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public boolean updateEmployeeRecord(Employee employee) {
        sessionFactory.getCurrentSession().clear();
        sessionFactory.getCurrentSession().update(employee);

        return true;
    }

    @Override
    public boolean mergeEmployeeRecord(Employee employee) {
        sessionFactory.getCurrentSession().merge(employee);
        return true;
    }


}
