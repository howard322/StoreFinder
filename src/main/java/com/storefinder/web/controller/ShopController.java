package com.storefinder.web.controller;

import com.storefinder.store.dao.impl.ProductRefDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShopController {


    @Autowired
    private ProductRefDao productRefDao;

    @PreAuthorize("hasRole('ROLE_SELLER')")
    @RequestMapping(value = "/shopee", method = RequestMethod.GET)
    public ModelAndView createProduct() {
        ModelAndView mav = new ModelAndView("shop");

        mav.addObject("productRefs", productRefDao.getProductRefOpts());

        return mav;
    }
}