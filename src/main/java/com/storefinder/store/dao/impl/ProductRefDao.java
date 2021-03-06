package com.storefinder.store.dao.impl;

import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.model.ProductRef;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.Map;

@Repository
@Transactional
public class ProductRefDao extends AbstractDao<ProductRef, String> {

    @Override
    protected String getEntityName() {
        return "ProductRef";
    }

    @Override
    protected Class getAssignedClass() {
        return ProductRef.class;
    }

    public Map<String, String> getProductRefOpts() {
        Map<String, String> returnVal = new LinkedHashMap<String, String>();

        for (ProductRef ref: getAll()) {
            returnVal.put(ref.getCode(), ref.getName());
        }

        return returnVal;
    }
}
