package com.storefinder.commons.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Transactional
public abstract class AbstractDao<T, I extends Serializable> {

    //generic methods for DB access to be used by the dao
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
        return (List<T>) getCurrentSession().createQuery(String.format("from %s item", getEntityName())).list(); //casting
        //getCurrentSession - will get the current content of the DB at the time of login
        //getEntityName - will get the model of the DB (fields)
        //getAssignClass -
        //T - Java generics - represents the model/entity
        //I - Data type of the ID of the field like loc_id
    }

}
