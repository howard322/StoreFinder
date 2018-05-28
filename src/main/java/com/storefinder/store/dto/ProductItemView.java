package com.storefinder.store.dto;


import com.storefinder.store.constant.ProductStatus;
import com.storefinder.store.model.ProductItem;
import com.storefinder.util.ImageUtil;

public class ProductItemView {

    private Long id;
    private String name;
    private Float price;
    private ProductStatus status;
    private String type;
    private String store;
    private String content;

    public ProductItemView(ProductItem productItem) {
        this.id = productItem.getId();
        this.name = productItem.getName();
        this.price = productItem.getPrice();
        this.status = productItem.getStatus();
        this.type = productItem.getProductRef().getName();
        this.store = productItem.getStore().getName();
        this.content = ImageUtil.getImageAsString(productItem.getContent());
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Float getPrice() {
        return price;
    }

    public ProductStatus getStatus() {
        return status;
    }

    public String getType() {
        return type;
    }

    public String getStore() {
        return store;
    }

    public String getContent() {
        return content;
    }
}
