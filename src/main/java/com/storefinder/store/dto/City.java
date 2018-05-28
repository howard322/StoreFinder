package com.storefinder.store.dto;

public class City {

    private Long loc_id;

    private String name;

    public City(Long id, String name) {
        this.loc_id = id;
        this.name = name;
    }

    public Long getLoc_id() {
        return loc_id;
    }

    public void setLoc_id(Long loc_id) {
        this.loc_id = loc_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
