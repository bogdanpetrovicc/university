package com.bogdan.cs230project.dao;

import com.bogdan.cs230project.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.criteria.CriteriaQuery;
import java.util.ArrayList;
import java.util.List;

public abstract class AbstractDao<T> {

    private final Class<T> entityClass;

    public AbstractDao(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    public void create(final T entity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            session.persist(entity);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        }
    }

    public T update(final T entity) {
        T t = null;
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            t = (T) session.merge(entity);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return t;
    }

    public void remove(T entity) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.delete(entity);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }

    public T find(Object id) {
        T t = null;
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            t = session.find(entityClass, id);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public List<T> findAll() {
        List<T> tList = new ArrayList<>();
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            CriteriaQuery<T> tCriteriaQuery = session.getCriteriaBuilder().createQuery(entityClass);
            tCriteriaQuery.select(tCriteriaQuery.from(entityClass));
            tList = session.createQuery(tCriteriaQuery).getResultList();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tList;
    }
}
