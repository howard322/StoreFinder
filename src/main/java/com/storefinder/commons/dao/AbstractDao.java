package com.storefinder.commons.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

public abstract class AbstractDao<T, I extends Serializable> {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    protected Transaction getTransaction() {
        return getCurrentSession().getTransaction();
    }

    protected T save(final T object, final Class<T> clazz) {
        I id = (I) getCurrentSession().save(object);
        return get(clazz, id);
    }

    protected void delete(final T object) {
        getCurrentSession().delete(object);
    }

    protected void deleteById(final Class<T> clazz, final I id) {
        delete(get(clazz, id));
    }

    protected T get(final Class<T> clazz, final I id) {
        return (T) getCurrentSession().get(clazz, id);
    }

}
