package com.storefinder.store.dto;


import com.storefinder.store.constant.PaymentType;
import com.storefinder.store.constant.AcquireMethod;

import java.util.List;

public class CheckoutForm {

    private String name;

    private String address;

    private String phoneNumber;

    private Long cityId;

    private AcquireMethod acquireMethod;

    private PaymentType paymentType;

    private String date;

    private String cardNumber;

    private String cardExpiry;

    private String cardCvv;

    private Float total;

    private Long storeId;

    public List<CheckoutItemForm> checkoutItems;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Long getCityId() {
        return cityId;
    }

    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }

    public AcquireMethod getAcquireMethod() {
        return acquireMethod;
    }

    public void setAcquireMethod(AcquireMethod acquireMethod) {
        this.acquireMethod = acquireMethod;
    }

    public PaymentType getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentType paymentType) {
        this.paymentType = paymentType;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardExpiry() {
        return cardExpiry;
    }

    public void setCardExpiry(String cardExpiry) {
        this.cardExpiry = cardExpiry;
    }

    public String getCardCvv() {
        return cardCvv;
    }

    public void setCardCvv(String cardCvv) {
        this.cardCvv = cardCvv;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public List<CheckoutItemForm> getCheckoutItems() {
        return checkoutItems;
    }

    public void setCheckoutItems(List<CheckoutItemForm> checkoutItems) {
        this.checkoutItems = checkoutItems;
    }
}
