package com.storefinder.store.dao.impl;

import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.model.CheckoutItem;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CheckoutItemDao extends AbstractDao<CheckoutItem, Long> {

    @Override
    protected String getEntityName() {
        return "CheckoutItem";
    }

    @Override
    protected Class getAssignedClass() {
        return CheckoutItem.class;
    }
}
