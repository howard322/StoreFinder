package com.storefinder.store.dto;

import com.storefinder.store.model.ProductItem;
import com.storefinder.store.model.Store;
import com.storefinder.util.ImageUtil;

public class ProductSearchStoreView {

    private Long storeId;

    private Float price;

    private String storeName;

    private String productCode;

    private Integer qty;

    private String content;

    public ProductSearchStoreView(ProductItem item, Integer qty) {
        Store store = item.getStore();
        this.storeId = store.getStoreId();
        this.price = item.getPrice();
        this.storeName = store.getName();
        this.productCode = item.getProductRefCode();
        this.content = ImageUtil.getImageAsString(item.getContent());
        this.qty = qty;
    }

    public Long getStoreId() {
        return storeId;
    }

    public Float getPrice() {
        return price;
    }

    public String getStoreName() {
        return storeName;
    }

    public String getProductCode() {
        return productCode;
    }

    public String getContent() {
        return content;
    }

    public Integer getQty() {
        return qty;
    }

    public Float getTotalPrice() {
        return getPrice() * getQty();
    }
}
