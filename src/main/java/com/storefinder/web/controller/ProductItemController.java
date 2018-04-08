package com.storefinder.web.controller;


import com.storefinder.store.constant.ProductStatus;
import com.storefinder.store.dao.ProductItemDao;
import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;
import com.storefinder.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
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

    private final ProductItemDao productItemDao;

    private static final String PRODUCT_LIST_PAGE = "productList";
    private static final String PRODUCT_EDIT_PAGE = "productEdit";

    @Autowired
    public ProductItemController(ProductItemDao productItemDao) {
        this.productItemDao = productItemDao;
    }

    @RequestMapping(value = "/product-list", method = RequestMethod.GET)
    public ModelAndView loadTest() {
        String username = SecurityUtil.getLoggedInUsername();

        List<ProductItemView> productItems = productItemDao.findProductsByUsername(username);

        ModelAndView modelAndView = new ModelAndView(PRODUCT_LIST_PAGE);
        modelAndView.addObject("products", productItems);

        return modelAndView;
    }

    @RequestMapping(value = "/product-create", method = RequestMethod.GET)
    public ModelAndView createProduct() {
        ModelAndView mav = new ModelAndView(PRODUCT_EDIT_PAGE);
        mav.addObject("mode", "Add");
        mav.addObject("product", new ProductItem());

        return mav;
    }


    @RequestMapping(value = "/product-save", method = RequestMethod.POST)
    public ModelAndView handleFileUpload(@ModelAttribute("product") ProductItem product,
                                         @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {

        ModelAndView modelAndView = new ModelAndView(PRODUCT_LIST_PAGE);
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
            modelAndView.addObject("products", productItems);
        }

        return modelAndView;
    }
}
