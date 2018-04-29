package com.storefinder.store.dao;


import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;

import java.util.List;

public interface ProductItemDao {

    void saveProduct(ProductItem product);

    ProductItem getProduct(Long productId);

    void deleteProduct(Long productId);

    List<ProductItemView> findAllProducts();

    List<ProductItemView> findProductsByUsername(String username);
}
