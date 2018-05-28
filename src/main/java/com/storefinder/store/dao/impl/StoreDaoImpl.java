package com.storefinder.store.dao.impl;

import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.model.Store;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class StoreDaoImpl extends AbstractDao<Store, Long> {

    public Store findByName(String name) {
        Query query = getCurrentSession().createQuery("from Store store where store.name = :name")
                .setString("name", name);

        return (Store) query.uniqueResult();
    }

    @Override
    protected String getEntityName() {
        return "Store";
    }

    @Override
    protected Class getAssignedClass() {
        return Store.class;
    }
}
