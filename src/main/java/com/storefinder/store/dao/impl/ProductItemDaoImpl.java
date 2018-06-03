package com.storefinder.store.dao.impl;


import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.dto.ProductSearchForm;
import com.storefinder.store.dto.ProductSearchResult;
import com.storefinder.store.dto.ProductSearchStoreTotalView;
import com.storefinder.store.dto.ProductSearchStoreView;
import com.storefinder.store.dto.ProductSearchView;
import com.storefinder.store.model.ProductItem;
import com.storefinder.store.model.Store;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

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
                .setString("username", username); //username of the seller to find which seller is selling the product

        List<ProductItem> items = (List<ProductItem>) query.list();
        List<ProductItemView> results = new ArrayList<ProductItemView>();

        for (ProductItem item : items) {
            results.add(new ProductItemView(item));
        }

        return results;
    }

    public boolean checkDuplicateProductType(String username, String productRefCode) {
        Query query = getCurrentSession().createQuery(" from ProductItem item where item.username = :username "
                + " and item.productRefCode = :productRefCode and item.status = 'APPROVED'")
                .setString("username", username)
                .setString("productRefCode", productRefCode);

        List<ProductItem> items = (List<ProductItem>) query.list();

        return items.size() >= 1;
    }

    public ProductSearchResult searchApprovedProducts(List<ProductSearchForm> searchForms) {
        List<String> productCodes = new ArrayList<String>();
        for (ProductSearchForm form : searchForms) {
            productCodes.add(form.getCode());
        }

        List<ProductItem> items = searchApprovedProductItems(productCodes);

        List<ProductSearchView> searchViews = new ArrayList<ProductSearchView>();

        for (ProductSearchForm searchForm : searchForms) {
            List<ProductSearchStoreView> searchStoreViews = new ArrayList<ProductSearchStoreView>();
            for (ProductItem item : items) {
                if (searchForm.getCode().equals(item.getProductRefCode())) {
                    searchStoreViews.add(new ProductSearchStoreView(item, searchForm.getQty()));
                }
            }
            searchViews.add(new ProductSearchView(searchForm, searchStoreViews));
        }

        Set<Store> stores = new LinkedHashSet<Store>();
        for (ProductItem item : items) {
            stores.add(item.getStore());
        }

        List<ProductSearchStoreTotalView> searchStoreTotalViews = new LinkedList<ProductSearchStoreTotalView>();
        for (Store store : stores) {
            List<ProductSearchStoreView> productsPerStore = new LinkedList<ProductSearchStoreView>();
            for (ProductItem item : items) {
                if (item.getStore().getStoreId().equals(store.getStoreId())) {
                    productsPerStore.add(new ProductSearchStoreView(item, searchQtyByProductRefCode(searchForms,
                            item.getProductRefCode())));
                }
            }
            searchStoreTotalViews.add(new ProductSearchStoreTotalView(store, productsPerStore));
        }

        return new ProductSearchResult(searchViews, searchStoreTotalViews);
    }

    private Integer searchQtyByProductRefCode(List<ProductSearchForm> searchForms, String code) {
        for (ProductSearchForm searchForm : searchForms) {
            if (searchForm.getCode().equals(code)) {
                return searchForm.getQty();
            }
        }

        return null;
    }


    public List<ProductItem> searchApprovedProductItems(List<String> productCodes) {
        Query query = getCurrentSession().createQuery(" from ProductItem item where item.productRefCode in :productCodes "
                + " and item.status = 'APPROVED'")
                .setParameterList("productCodes", productCodes);

        return (List<ProductItem>) query.list();
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
