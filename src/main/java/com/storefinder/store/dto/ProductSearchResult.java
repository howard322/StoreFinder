package com.storefinder.store.dto;


import java.util.List;

public class ProductSearchResult {

    private List<ProductSearchView> productSearchViews;
    private List<ProductSearchStoreTotalView> productStoreTotalViews;

    public ProductSearchResult(List<ProductSearchView> productSearchViews, List<ProductSearchStoreTotalView> productStoreTotalViews) {
        this.productSearchViews = productSearchViews;
        this.productStoreTotalViews = productStoreTotalViews;
    }

    public List<ProductSearchView> getProductSearchViews() {
        return productSearchViews;
    }

    public List<ProductSearchStoreTotalView> getProductStoreTotalViews() {
        return productStoreTotalViews;
    }
}
