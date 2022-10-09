package service;

import bean.Product;
import com.sun.org.apache.xpath.internal.compiler.Keywords;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {
    int getProductCount(String keyword,String category,String sort) throws SQLException;
    List<Product> getList(int index,int size,String keyword,String category,String sort) throws SQLException;
    int getSerachCount(String keyword) throws SQLException;
    List<Product> getSearchList(String keyword,int index,int size) throws SQLException;
    Product getProduct(String pid)throws SQLException;

}
