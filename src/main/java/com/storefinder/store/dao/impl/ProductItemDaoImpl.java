package com.storefinder.store.dao.impl;


import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class ProductItemDaoImpl extends AbstractDao<ProductItem, Long> {

    public List<ProductItemView> findAllProducts() {
        List<ProductItemView> results = new ArrayList<ProductItemView>();

        for (ProductItem item : getAll()) {
            results.add(new ProductItemView(item));
        }

        return results;
    }

    public List<ProductItemView> findProductsByUsername(String username) {
        Query query = getCurrentSession().createQuery("from ProductItem item where item.username = :username")
                .setString("username", username);

        List<ProductItem> items = (List<ProductItem>) query.list();
        List<ProductItemView> results = new ArrayList<ProductItemView>();

        for (ProductItem item : items) {
            results.add(new ProductItemView(item));
        }

        return results;
    }

    public boolean checkDuplicateProductType(String username, Long productRefId) {
        Query query = getCurrentSession().createQuery(" from ProductItem item where item.username = :username "
                + " and item.productRef = :productRefId and item.status = 'APPROVED'")
                .setString("username", username)
                .setLong("productRefId", productRefId);

        List<ProductItem> items = (List<ProductItem>) query.list();

        return items.size() > 1;
    }

    @Override
    protected String getEntityName() {
        return "ProductItem";
    }

    @Override
    protected Class getAssignedClass() {
        return ProductItem.class;
    }
}
