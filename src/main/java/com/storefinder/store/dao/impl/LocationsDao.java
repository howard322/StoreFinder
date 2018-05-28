package com.storefinder.store.dao.impl;


import com.storefinder.commons.dao.AbstractDao;
import com.storefinder.store.dto.City;
import com.storefinder.store.model.Locations;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
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

    public List<City> getAllCities() {
        String query = String.format("from %s where locId = parentLoc order by name asc", getEntityName());

        List<Locations> locations = (List<Locations>) getCurrentSession().createQuery(query).list();

        List<City> cities = new LinkedList<City>();
        for (Locations city : locations) {
            cities.add(new City(city.getLocId(), city.getName()));
        }

        return cities;
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
