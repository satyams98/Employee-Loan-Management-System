package com.MvcPractise.dao;

import com.MvcPractise.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional(readOnly=true)
public class DAOImplementation implements DAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    @Override
    public boolean saveEmployee(Employee employee) {
        sessionFactory.getCurrentSession().save(employee);
        sessionFactory.getCurrentSession().flush();
        sessionFactory.getCurrentSession().flush();
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


}
