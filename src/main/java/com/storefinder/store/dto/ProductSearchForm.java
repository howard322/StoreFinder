package com.storefinder.store.dto;

public class ProductSearchForm {

    private String code;
    private Integer qty;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }
}
