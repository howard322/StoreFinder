package com.storefinder.web.controller;


import com.storefinder.store.constant.ProductStatus;
import com.storefinder.store.dao.ProductItemDao;
import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;
import com.storefinder.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProductItemController {

    public ProductItemController() {
    }

    @Autowired
    private ProductItemDao productItemDao;

    private static final String PRODUCT_LIST_PAGE = "productList";
    private static final String PRODUCT_EDIT_PAGE = "productEdit";


    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/product-list", method = RequestMethod.GET)
    public ModelAndView loadTest() {
        String username = SecurityUtil.getLoggedInUsername();

        List<ProductItemView> productItems = productItemDao.findProductsByUsername(username);

        ModelAndView mav = new ModelAndView(PRODUCT_LIST_PAGE);
        mav.addObject("products", productItems);

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/product-create", method = RequestMethod.GET)
    public ModelAndView createProduct() {
        ModelAndView mav = new ModelAndView(PRODUCT_EDIT_PAGE);
        mav.addObject("mode", "Add");
        mav.addObject("product", new ProductItem());

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(value = "/product-update", method = RequestMethod.GET)
    public ModelAndView updateProduct(@RequestParam(value = "id") Long id) {
        ModelAndView mav = new ModelAndView(PRODUCT_EDIT_PAGE);
        ProductItem item = productItemDao.getProduct(id);

        mav.addObject("mode", "Edit");
        mav.addObject("product", item);

        return mav;
    }

    @RequestMapping(value = "/product-delete", method = RequestMethod.POST)
    public ModelAndView deleteProduct(@RequestParam Long id) {
        String username = SecurityUtil.getLoggedInUsername();
        ModelAndView mav = new ModelAndView(PRODUCT_LIST_PAGE);

        productItemDao.deleteProduct(id);

        List<ProductItemView> productItems = productItemDao.findProductsByUsername(username);
        mav.addObject("products", productItems);
        mav.addObject("message", "Product deleted.");

        return mav;
    }


    @RequestMapping(value = "/product-save", method = RequestMethod.POST)
    public ModelAndView handleFileUpload(@ModelAttribute("product") ProductItem product,
                                         @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {

        ModelAndView mav = new ModelAndView(PRODUCT_LIST_PAGE);
        String username = SecurityUtil.getLoggedInUsername();

        if (fileUpload != null && fileUpload.length > 0) {
            // get 0 since we are only uploading 1 file
            CommonsMultipartFile file = fileUpload[0];

            product.setFilename(file.getOriginalFilename());
            product.setContent(file.getBytes());
            product.setUsername(username);
            product.setStatus(ProductStatus.NEW);

            productItemDao.saveProduct(product);

            List<ProductItemView> productItems = productItemDao.findProductsByUsername(username);
            mav.addObject("products", productItems);
            mav.addObject("message", "Product saved.");
        }

        return mav;
    }
}
