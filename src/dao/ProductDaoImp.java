package dao;

import bean.Product;
import com.mysql.jdbc.StringUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JDBCUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImp implements ProductDao {
    @Override
    public int queryProductCount(String keyword,String category,String sort) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "SELECT COUNT(*) FROM product WHERE pstate = 1 ";
        List<Object> params = new ArrayList();

        if(keyword!=null&&keyword!=""){
            sql += "and ( pname like ? or pdesc like ? )";
            params.add("%"+keyword+"%");
            params.add("%"+keyword+"%");
        }
        if(category!=null&&category!=""){
            sql += "and category = ? ";
            params.add(category);
        }
        if(sort!=null&&sort!=""){
            if("1".equals(sort)){
                sql += "order by price asc";
            }
            if("2".equals(sort)){
                sql += "order by price desc";
            }
        }
        int intValue  = 0;

        intValue = ((Long)qr.query(sql, new ScalarHandler(),params.toArray())).intValue();


        return intValue;
    }

    @Override
    public List<Product> queryList(int index, int size,String keyword,String category,String sort) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select * from product where pstate = 1 ";
        List<Object> params = new ArrayList();
        if(keyword!=null&&keyword!=""){
            sql += " and ( pname like ? or pdesc like ? ) ";
            params.add("%"+keyword+"%");
            params.add("%"+keyword+"%");
        }
        if(category!=null&&category!=""){
            sql += " and category = ? ";
            params.add(category);
        }
        if(sort!=null&&sort!=""){
            if("1".equals(sort)){
                sql += " order by price asc ";
            }
            if("2".equals(sort)){
                sql += " order by price desc ";
            }
        }
        sql += " limit ?,? ";
        params.add(index);
        params.add(size);
        List<Product> list = qr.query(sql, new BeanListHandler<Product>(Product.class),params.toArray());
        return list;
    }

    @Override
    public int querySearchCount(String keyword) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select count(*) from product where pstate = 1 and pname like ? or pdesc like ?";
        String key = "%"+keyword+"%";
        int intValue = ((Long)qr.query(sql, new ScalarHandler(),key,key)).intValue();
        return intValue;
    }

    @Override
    public List<Product> querySearchList(String keyword, int index, int size) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select * from product where pstate = 1 and pname like ? or pdesc like ? limit ?,?";
        String key = "%"+keyword+"%";
        List<Product> list = qr.query(sql, new BeanListHandler<Product>(Product.class),key,key,index,size);
        return list;
    }

    @Override
    public Product queryProduct(String pid) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select * from product where pstate = 1 and pid = ?";
        Product pro = qr.query(sql, new BeanHandler<Product>(Product.class),pid);
        return pro;
    }
}
