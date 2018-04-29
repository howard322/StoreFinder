package com.storefinder.store.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "locations")
public class Locations {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "loc_id")
    private Long locId;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "parent_loc", referencedColumnName = "loc_id")
    private Locations parentLoc;

    public Long getLocId() {
        return locId;
    }

    public void setLocId(Long locId) {
        this.locId = locId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Locations getParentLoc() {
        return parentLoc;
    }

    public void setParentLoc(Locations parentLoc) {
        this.parentLoc = parentLoc;
    }
}
