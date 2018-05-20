package com.storefinder.store.dao.impl;


import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.model.Locations;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashMap;
import java.util.Map;

@Repository
public class LocationsDao extends AbstractDao<Locations, Long> {

    public Map<Long, String> getLocationOpts() {
        Map<Long, String> returnVal = new LinkedHashMap<Long, String>();

        for (Locations loc: getAll()) {
            returnVal.put(loc.getLocId(), loc.getName());
        }

        return returnVal;
    }

    @Override
    protected String getEntityName() {
        return "Locations";
    }

    @Override
    protected Class getAssignedClass() {
        return Locations.class;
    }
}
