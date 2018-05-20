package com.storefinder.store.dto;


import java.util.List;

public class PreCheckoutForm {

    private Float total;

    private List<CheckoutItemForm> checkoutItems;

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
