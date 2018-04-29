package com.storefinder.store.model;


import org.hibernate.annotations.Type;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "store")
public class Store {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "store_id")
    private Long storeId;

    @Column(name = "name")
    private String name;

    @Type(type = "yes_no")
    @Column(name = "credit_payable")
    private boolean creditPayable;


    @Column(name = "loc_id")
    private Long locId;

    @ManyToOne
    @JoinColumn(name = "loc_id", referencedColumnName = "loc_id", insertable = false, updatable = false)
    private Locations location;


    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isCreditPayable() {
        return creditPayable;
    }

    public void setCreditPayable(boolean creditPayable) {
        this.creditPayable = creditPayable;
    }

    public Long getLocId() {
        return locId;
    }

    public void setLocId(Long locId) {
        this.locId = locId;
    }

    public Locations getLocation() {
        return location;
    }

    public void setLocation(Locations location) {
        this.location = location;
    }
}
