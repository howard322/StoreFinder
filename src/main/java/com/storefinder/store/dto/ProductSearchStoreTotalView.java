package com.storefinder.store.dto;


import com.storefinder.store.model.Store;

import java.util.List;

public class ProductSearchStoreTotalView {

    private final Store store;
    private final List<ProductSearchStoreView> selectedProducts;

    public ProductSearchStoreTotalView(Store store, List<ProductSearchStoreView> selectedProducts) {
        this.store = store;
        this.selectedProducts = selectedProducts;
    }

    public Long getStoreId() {
        return store.getStoreId();
    }

    public String getStoreName() {
        return store.getName();
    }

    public Float getTotal() {
        Float total = 0f;
        for (ProductSearchStoreView searchStoreView : selectedProducts) {
            total = total + searchStoreView.getTotalPrice();
        }

        return total;
    }

    public List<ProductSearchStoreView> getSelectedProducts() {
        return selectedProducts;
    }
}
