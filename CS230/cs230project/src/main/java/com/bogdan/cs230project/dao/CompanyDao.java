package com.bogdan.cs230project.dao;

import com.bogdan.cs230project.entity.Company;
import com.bogdan.cs230project.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CompanyDao extends AbstractDao<Company> {

    public CompanyDao() {
        super(Company.class);
    }

    public Company findByName(final String companyName) {
        final String QUERY = "select c from Company c where c.name = :company";
        Company company = null;
        Transaction transaction;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            company = session.createQuery(QUERY, Company.class)
                    .setParameter("company", companyName)
                    .getSingleResult();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return company;
    }
}
