package com.ssm.dao;

import com.ssm.pojo.Product;

import java.util.List;

public interface ProductDao {


    List<Product> getAllProduct();

    List<Product> getAllProductBycid(int caid);

    Product getProductBypid(int id);

    List<Product> getMyProductByUid(String user_id);

    void pubMyproduct(Product product);

    Product getProductUserBypid(int id);

    List<Product> getAllProducts();

    Product getAllProductBypid(int id);

    void updateProduct(Product product);

    List<Product> likeProduct(String name);

    void deleteProduct(int id);

    List<Product> getAllMyProductByUid(String user_id);

    List<Product> getProductLike(String name);
}
