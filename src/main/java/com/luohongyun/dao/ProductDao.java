package com.luohongyun.dao;

import com.luohongyun.model.Product;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ProductDao implements  IProductDao{
    @Override
    public int save(Product product,InputStream picture, Connection con) throws SQLException {
        int n = 0;
        String sql = "insert into product(ProductName,ProductDescription,Picture,price,CategoryID) values(?,?,?,?,?)";
        PreparedStatement pt = con.prepareStatement(sql);
        pt.setString(1, product.getProductName());
        pt.setString(2, product.getProductDescription());
        if(picture!=null) {
            //for sql server
            pt.setBlob(3, picture);
            //   for mysql
            //   pt.setBlob(3, product.getPicture());
        }
        pt.setDouble(4, product.getPrice());
        pt.setInt(5, (int) product.getCategoryId());
        n = pt.executeUpdate();
        if (n > 0) {
            return n;
        }
        return 0;
    }//end save

    @Override
    public int delete(Integer productId, Connection con) {
        return 0;
    }

    @Override
    public int update(Product instance, Connection con) {
        return 0;
    }

    @Override
    public Product findById(Integer productId, Connection con) {
        return null;
    }

    @Override
    public List<Product> findByCategoryId(int categoryId, Connection con) {
        return null;
    }

    @Override
    public List<Product> findByPrice(double minPrice, double maxPrice, Connection con) throws SQLException {
        return null;
    }

    @Override
    public List<Product> findAll(Connection con) throws SQLException {

        return null;
    }

    @Override
    public List<Product> findByProductName(String productName, Connection con) throws SQLException {
        return null;
    }

    @Override
    public List<Product> getPicture(Integer productId, Connection con) throws SQLException {
        return null;
    }
}
