package dao;

import bean.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    int queryProductCount(String keyword,String category,String sort) throws SQLException;
    List<Product> queryList(int index,int size,String keyword,String category,String sort) throws SQLException;
    int querySearchCount(String keyword) throws SQLException;
    List<Product> querySearchList(String keyword,int index,int size) throws SQLException;
    Product queryProduct(String pid)throws SQLException;
}
