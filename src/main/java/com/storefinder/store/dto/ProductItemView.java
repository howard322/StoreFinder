package com.storefinder.store.dto;


public class ProductItemView {

    private Long id;
    private String name;
    private Float price;
    private String content;

    public ProductItemView(Long id, String name, Float price, String content) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.content = content;
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

    public String getContent() {
        return content;
    }
}
