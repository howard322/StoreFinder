package com.storefinder.commons.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Transactional
public abstract class AbstractDao<T, I extends Serializable> {

    @Autowired
    private SessionFactory sessionFactory;

    protected abstract String getEntityName();

    protected abstract Class getAssignedClass();

    protected Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void save(final T object) {
        getCurrentSession().saveOrUpdate(object);
    }

    public void delete(final T object) {
        getCurrentSession().delete(object);
    }

    public void deleteById(final I id) {
        delete(get(id));
    }

    public T get(final I id) {
        return (T) getCurrentSession().get(getAssignedClass(), id);
    }

    public List<T> getAll() {
        return (List<T>) getCurrentSession().createQuery(String.format("from %s item", getEntityName())).list();
    }

}
