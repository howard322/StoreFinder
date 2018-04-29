package com.storefinder.web.controller;


import com.storefinder.store.constant.ProductStatus;
import com.storefinder.store.dao.impl.ProductItemDaoImpl;
import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedList;
import java.util.List;

@Controller
public class ProductManagementController {

    public ProductManagementController() {
    }

    @Autowired
    private ProductItemDaoImpl productItemDao;

    private static final String PRODUCT_MANAGEMENT_PAGE = "productManagement";

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/product-management", method = RequestMethod.GET)
    public ModelAndView loadProductManagementPage() {
        List<ProductItemView> productItems = productItemDao.findAllProducts();

        List<ProductItemView> newProducts = new LinkedList<ProductItemView>();
        List<ProductItemView> approvedProducts = new LinkedList<ProductItemView>();
        List<ProductItemView> rejectedProducts = new LinkedList<ProductItemView>();

        for (ProductItemView product : productItems) {
            switch (product.getStatus()) {
                case NEW:
                    newProducts.add(product);
                    break;
                case APPROVED:
                    approvedProducts.add(product);
                    break;
                case REJECTED:
                    rejectedProducts.add(product);
                    break;
                default:
            }
        }

        ModelAndView mav = new ModelAndView(PRODUCT_MANAGEMENT_PAGE);
        mav.addObject("newProducts", newProducts);
        mav.addObject("approvedProducts", approvedProducts);
        mav.addObject("rejectedProducts", rejectedProducts);

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/product-approve", method = RequestMethod.POST)
    public ModelAndView approveProduct(@RequestParam Long id) {

        ProductItem productItem = productItemDao.get(id);
        productItem.setStatus(ProductStatus.APPROVED);
        productItemDao.save(productItem);

        return loadProductManagementPage();
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/product-reject", method = RequestMethod.POST)
    public ModelAndView rejectProduct(@RequestParam Long id) {

        ProductItem productItem = productItemDao.get(id);
        productItem.setStatus(ProductStatus.REJECTED);
        productItemDao.save(productItem);

        return loadProductManagementPage();
    }
}
