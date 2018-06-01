package com.storefinder.web.controller;


import com.storefinder.store.dao.impl.CheckoutDao;
import com.storefinder.store.dao.impl.LocationsDao;
import com.storefinder.store.dao.impl.ProductItemDaoImpl;
import com.storefinder.store.dao.impl.StoreDaoImpl;
import com.storefinder.store.dto.CheckoutForm;
import com.storefinder.store.dto.CheckoutItemForm;
import com.storefinder.store.dto.PreCheckoutForm;
import com.storefinder.store.dto.ProductSearchStoreTotalView;
import com.storefinder.store.dto.ProductSearchStoreView;
import com.storefinder.store.model.Checkout;
import com.storefinder.store.model.CheckoutItem;
import com.storefinder.store.model.ProductItem;
import com.storefinder.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CheckoutController {

    @Autowired
    private LocationsDao locationsDao;

    @Autowired
    private CheckoutDao checkoutDao;

    @Autowired
    private StoreDaoImpl storeDao;

    @Autowired
    private ProductItemDaoImpl productItemDao;

    @PreAuthorize("hasRole('ROLE_BUYER')")
    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public ModelAndView checkout(@ModelAttribute("preCheckoutForm") PreCheckoutForm preCheckoutForm) {

        ModelAndView mav = new ModelAndView("checkoutForm");
        mav.addObject("preCheckoutForm", preCheckoutForm);
        mav.addObject("checkoutForm", new CheckoutForm());
        mav.addObject("locations", locationsDao.getLocationOpts());


        List<ProductSearchStoreView> checkoutItems = new ArrayList<ProductSearchStoreView>();

        for (CheckoutItemForm checkoutItem : preCheckoutForm.getCheckoutItems()) {
            ProductItem item = productItemDao.get(checkoutItem.getItemId());
            checkoutItems.add(new ProductSearchStoreView(item, checkoutItem.getQty()));
        }

        mav.addObject("checkoutItemsSummary", new ProductSearchStoreTotalView(
                storeDao.get(preCheckoutForm.getStoreId()), checkoutItems));

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_BUYER')")
    @RequestMapping(value = "/checkout-final", method = RequestMethod.POST)
    public ModelAndView checkoutFinal(@ModelAttribute("checkoutForm") CheckoutForm checkoutForm) throws ParseException {

        ModelAndView mav = new ModelAndView("hello");

        Checkout checkout = new Checkout();
        checkout.setCreatedDate(new Date());
        checkout.setStore(storeDao.get(checkoutForm.getStoreId()));
        checkout.setCity(locationsDao.get(checkoutForm.getCityId()));
        checkout.setBuyer(SecurityUtil.getLoggedInUsername());
        checkout.setName(checkoutForm.getName());
        checkout.setAddress(checkoutForm.getAddress());
        checkout.setPhoneNumber(checkoutForm.getPhoneNumber());
        checkout.setAcquireMethod(checkoutForm.getAcquireMethod());
        checkout.setAcquireDate(new SimpleDateFormat("yyyy/MM/DD HH:mm").parse(checkoutForm.getDate()));
        checkout.setPaymentType(checkoutForm.getPaymentType());
        checkout.setCardNumber(checkoutForm.getCardNumber());
        checkout.setCardExpiry(checkoutForm.getCardExpiry());
        checkout.setCardCvv(checkoutForm.getCardCvv());
        checkout.setTotal(checkoutForm.getTotal());

        List<CheckoutItem> checkoutItemList = new ArrayList<CheckoutItem>();
        for (CheckoutItemForm itemForm : checkoutForm.getCheckoutItems()) {
            CheckoutItem checkoutItem = new CheckoutItem();

            ProductItem productItem = productItemDao.get(itemForm.getItemId());
            checkoutItem.setItem(productItem);
            checkoutItem.setQty(itemForm.getQty());
            checkoutItem.setSubtotal(productItem.getPrice() * itemForm.getQty());
            checkoutItem.setCheckout(checkout);

            checkoutItemList.add(checkoutItem);
        }

        checkout.setCheckoutItems(checkoutItemList);

        checkoutDao.save(checkout);

        mav.addObject("message", "Successfully checked-out items!");

        return mav;
    }
}
