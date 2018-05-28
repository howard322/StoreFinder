package com.storefinder.store.dto;


import java.util.List;

public class PreCheckoutForm {

    private Long storeId;

    private Float total;

    private List<CheckoutItemForm> checkoutItems;

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public List<CheckoutItemForm> getCheckoutItems() {
        return checkoutItems;
    }

    public void setCheckoutItems(List<CheckoutItemForm> checkoutItems) {
        this.checkoutItems = checkoutItems;
    }
}
