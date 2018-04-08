package com.storefinder.store.dao;


import com.storefinder.store.dto.ProductItemView;
import com.storefinder.store.model.ProductItem;

import java.util.List;

public interface ProductItemDao {

    ProductItem saveProduct(ProductItem product);

    List<ProductItemView> findProductsByUsername(String username);
}
