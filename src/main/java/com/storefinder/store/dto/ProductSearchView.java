package com.storefinder.store.dto;


import java.util.List;

public class ProductSearchView {

    private final ProductSearchForm productSearchForm;
    private final List<ProductSearchStoreView> searchStoreViews;

    public ProductSearchView(ProductSearchForm searchForm, List<ProductSearchStoreView> searchStoreViews) {
        this.productSearchForm = searchForm;
        this.searchStoreViews = searchStoreViews;
    }

    public ProductSearchForm getProductSearchForm() {
        return productSearchForm;
    }

    public List<ProductSearchStoreView> getSearchStoreViews() {
        return searchStoreViews;
    }
}
