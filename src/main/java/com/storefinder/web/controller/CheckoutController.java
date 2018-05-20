package com.storefinder.web.controller;


import com.storefinder.store.dao.impl.LocationsDao;
import com.storefinder.store.dto.CheckoutForm;
import com.storefinder.store.dto.CheckoutItemForm;
import com.storefinder.store.dto.PreCheckoutForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CheckoutController {

    @Autowired
    private LocationsDao locationsDao;

    @PreAuthorize("hasRole('ROLE_BUYER')")
    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public ModelAndView checkout(@ModelAttribute("preCheckoutForm") PreCheckoutForm preCheckoutForm) {

        ModelAndView mav = new ModelAndView("checkoutForm");
        mav.addObject("preCheckoutForm", preCheckoutForm);
        mav.addObject("checkoutForm", new CheckoutForm());
        mav.addObject("locations", locationsDao.getLocationOpts());

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_BUYER')")
    @RequestMapping(value = "/checkout-final", method = RequestMethod.POST)
    public ModelAndView checkoutFinal(@ModelAttribute("checkoutForm") CheckoutForm checkoutForm) {

        ModelAndView mav = new ModelAndView("/");

        return mav;
    }
}
