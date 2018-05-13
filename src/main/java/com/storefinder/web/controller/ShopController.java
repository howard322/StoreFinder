package com.storefinder.web.controller;

import com.storefinder.store.dao.impl.ProductRefDao;
import com.storefinder.store.dto.ProductSearchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ShopController {


    @Autowired
    private ProductRefDao productRefDao;

    @PreAuthorize("hasRole('ROLE_BUYER')")
    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public ModelAndView createProduct() {
        ModelAndView mav = new ModelAndView("shop");

        mav.addObject("productRefs", productRefDao.getProductRefOpts());

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_BUYER')")
    @RequestMapping(value = "/shop-search", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView searchProducts(@RequestBody List<ProductSearchForm> data) {
        ModelAndView mav = new ModelAndView("shop");

        mav.addObject("productRefs", productRefDao.getProductRefOpts());

        return mav;
    }
}