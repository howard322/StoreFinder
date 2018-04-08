package com.storefinder.store.dao.impl;


import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.dao.ProductItemDao;
import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;
import com.storefinder.util.ImageUtil;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class ProductItemDaoImpl extends AbstractDao<ProductItem, Long> implements ProductItemDao {

    @Override
    public ProductItem saveProduct(ProductItem product) {
        return save(product, ProductItem.class);
    }

    @Override
    public List<ProductItemView> findProductsByUsername(String username) {
        Query query = getCurrentSession().createQuery("from ProductItem item where item.username = :username")
                .setString("username", username);

        List<ProductItem> items = (List<ProductItem>) query.list();
        List<ProductItemView> results = new ArrayList<ProductItemView>();

        for (ProductItem item : items) {
            ProductItemView itemView = new ProductItemView(item.getId(), item.getName(), item.getPrice(),
                    ImageUtil.getImageAsString(item.getContent()));

            results.add(itemView);
        }

        return results;
    }

}
