package com.storefinder.store.dto;


import com.storefinder.store.constant.ProductStatus;
import com.storefinder.store.model.ProductItem;
import com.storefinder.util.ImageUtil;

public class ProductItemView {

    private Long id;
    private String name;
    private Float price;
    private ProductStatus status;
    private String content;

    public ProductItemView(ProductItem productItem) {
        this.id = productItem.getId();
        this.name = productItem.getName();
        this.price = productItem.getPrice();
        this.status = productItem.getStatus();
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

    public String getContent() {
        return content;
    }
}
