package com.luohongyun.dao;

import com.luohongyun.model.Product;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
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
    public Product findById(Integer productId, Connection con) throws SQLException {
        String queryString = "select * from product where productId=?";
        PreparedStatement preparedStatement = con.prepareStatement(queryString);
        preparedStatement.setInt(1,productId);
        ResultSet resultSet = preparedStatement.executeQuery();
        Product product = new Product();
        while(resultSet.next()){
            product.setProductId(resultSet.getInt("ProductId"));
            product.setProductName(resultSet.getString("ProductName"));
            product.setProductDescription(resultSet.getString("ProductDescription"));
            product.setPrice(resultSet.getDouble("Price"));
            product.setCategoryId(resultSet.getInt("CategoryId"));
        }
        return product;
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
        List<Product> list = new ArrayList<>();
        String queryString = "select * from product";
        PreparedStatement preparedStatement = con.prepareStatement(queryString);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            Product product = new Product();
            product.setProductId(resultSet.getInt("ProductId"));
            product.setProductName(resultSet.getString("ProductName"));
            product.setProductDescription(resultSet.getString("ProductDescription"));
            product.setPrice(resultSet.getDouble("Price"));
            product.setCategoryId(resultSet.getInt("CategoryId"));
            list.add(product);
        }
        System.out.printf("successful");
        return list;
    }

    @Override
    public List<Product> findByProductName(String productName, Connection con) throws SQLException {
        return null;
    }

    @Override
    public List<Product> getPicture(Integer productId, Connection con) throws SQLException {
        return null;
    }

    @Override
    public byte[] getPictureById(Integer productId, Connection con) throws SQLException {
        byte[] imgByte = null;
        String sql = "select picture from product where productId=?";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setInt(1,productId);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Blob picture = resultSet.getBlob("picture");
            imgByte = picture.getBytes(1L, (int) picture.length());
        }
        return imgByte;
    }
}
