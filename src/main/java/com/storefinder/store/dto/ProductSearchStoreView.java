package com.storefinder.store.dto;

import com.storefinder.store.model.ProductItem;
import com.storefinder.util.ImageUtil;

public class ProductSearchStoreView {

    private ProductItem item;

    private Integer qty;

    public ProductSearchStoreView(ProductItem item, Integer qty) {
        this.item = item;
        this.qty = qty;
    }

    public Long getStoreId() {
        return item.getStore().getStoreId();
    }

    public Float getPrice() {
        return item.getPrice();
    }

    public String getStoreName() {
        return item.getStore().getName();
    }

    public String getProductCode() {
        return item.getProductRefCode();
    }

    public String getProductDetails() {
        return item.getProductRef().getName();
    }

    public String getProductName() {
        return item.getName();
    }

    public String getContent() {
        return ImageUtil.getImageAsString(item.getContent());
    }

    public Integer getQty() {
        return qty;
    }

    public Float getTotalPrice() {
        return getPrice() * getQty();
    }
}
