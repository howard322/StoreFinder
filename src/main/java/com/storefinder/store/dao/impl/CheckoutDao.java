package com.storefinder.store.dao.impl;

import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.model.Checkout;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CheckoutDao extends AbstractDao<Checkout, Long> {

    @Override
    protected String getEntityName() {
        return "Checkout";
    }

    @Override
    protected Class getAssignedClass() {
        return Checkout.class;
    }
}
