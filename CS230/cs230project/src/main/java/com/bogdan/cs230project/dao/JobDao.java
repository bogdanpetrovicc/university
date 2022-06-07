package com.bogdan.cs230project.dao;

import com.bogdan.cs230project.entity.Job;
import com.bogdan.cs230project.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class JobDao extends AbstractDao<Job> {

    public JobDao() {
        super(Job.class);
    }

    public Job findByName(final String jobName) {
        final String QUERY = "select j from Job j where j.name = :job";
        Job job = null;
        Transaction transaction;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            job = session.createQuery(QUERY, Job.class)
                    .setParameter("job", jobName)
                    .getSingleResult();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return job;
    }
}