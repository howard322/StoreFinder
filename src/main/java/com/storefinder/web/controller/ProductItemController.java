package com.storefinder.web.controller;


import com.storefinder.store.constant.ProductStatus;
import com.storefinder.store.dao.StoreDao;
import com.storefinder.store.dao.impl.ProductItemDaoImpl;
import com.storefinder.store.dao.impl.ProductRefDao;
import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;
import com.storefinder.store.model.Store;
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
    private ProductItemDaoImpl productItemDao;

    @Autowired
    private ProductRefDao productRefDao;

    @Autowired
    private StoreDao storeDao;

    private static final String PRODUCT_LIST_PAGE = "productList";
    private static final String PRODUCT_EDIT_PAGE = "productEdit";


    @PreAuthorize("hasRole('ROLE_SELLER')")
    @RequestMapping(value = "/product-list", method = RequestMethod.GET)
    public ModelAndView loadTest() {
        String username = SecurityUtil.getLoggedInUsername();

        List<ProductItemView> productItems = productItemDao.findProductsByUsername(username);

        ModelAndView mav = new ModelAndView(PRODUCT_LIST_PAGE);
        mav.addObject("products", productItems);

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_SELLER')")
    @RequestMapping(value = "/product-create", method = RequestMethod.GET)
    public ModelAndView createProduct() {
        ModelAndView mav = new ModelAndView(PRODUCT_EDIT_PAGE);

        mav.addObject("productRefs", productRefDao.getProductRefOpts());
        mav.addObject("mode", "Add");
        mav.addObject("product", new ProductItem());

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_SELLER')")
    @RequestMapping(value = "/product-update", method = RequestMethod.GET)
    public ModelAndView updateProduct(@RequestParam(value = "id") Long id) {
        ModelAndView mav = new ModelAndView(PRODUCT_EDIT_PAGE);
        ProductItem item = productItemDao.get(id);

        mav.addObject("productRefs", productRefDao.getProductRefOpts());
        mav.addObject("mode", "Edit");
        mav.addObject("product", item);

        return mav;
    }

    @PreAuthorize("hasRole('ROLE_SELLER')")
    @RequestMapping(value = "/product-delete", method = RequestMethod.POST)
    public ModelAndView deleteProduct(@RequestParam Long id) {
        String username = SecurityUtil.getLoggedInUsername();
        ModelAndView mav = new ModelAndView(PRODUCT_LIST_PAGE);

        productItemDao.deleteById(id);

        List<ProductItemView> productItems = productItemDao.findProductsByUsername(username);
        mav.addObject("products", productItems);
        mav.addObject("message", "Product deleted.");

        return mav;
    }


    @PreAuthorize("hasRole('ROLE_SELLER')")
    @RequestMapping(value = "/product-save", method = RequestMethod.POST)
    public ModelAndView handleFileUpload(@ModelAttribute("product") ProductItem product,
                                         @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {

        ModelAndView mav = new ModelAndView(PRODUCT_LIST_PAGE);
        String username = SecurityUtil.getLoggedInUsername();

        if (productItemDao.checkDuplicateProductType(username, product.getProductRefCode())) {
            ModelAndView errorMav = new ModelAndView(PRODUCT_EDIT_PAGE);
            errorMav.addObject("productRefs", productRefDao.getProductRefOpts());
            errorMav.addObject("mode", "Add");
            errorMav.addObject("product", product);
            errorMav.addObject("message", "Product with type already exists");

            return errorMav;
        }

        if (fileUpload != null && fileUpload[0].getSize() > 0) {
            // get 0 since we are only uploading 1 file
            CommonsMultipartFile file = fileUpload[0];

            product.setFilename(file.getOriginalFilename());
            product.setContent(file.getBytes());
            product.setUsername(username);
            product.setStatus(ProductStatus.NEW);

            Store store = storeDao.findByName(username);
            product.setStore(store);

            productItemDao.save(product);

            List<ProductItemView> productItems = productItemDao.findProductsByUsername(username);
            mav.addObject("products", productItems);
            mav.addObject("message", "Product saved.");
        } else {
            ModelAndView errorMav = new ModelAndView(PRODUCT_EDIT_PAGE);
            errorMav.addObject("productRefs", productRefDao.getProductRefOpts());
            errorMav.addObject("mode", "Add");
            errorMav.addObject("product", product);
            errorMav.addObject("message", "Please select an image");

            return errorMav;
        }

        return mav;
    }
}
