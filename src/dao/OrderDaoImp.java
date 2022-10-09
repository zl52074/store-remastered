package dao;

import bean.Order;
import bean.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImp implements OrderDao {

    @Override
    public void insertOrder(Connection conn, Order order) throws SQLException {
        QueryRunner qr = new QueryRunner();
        String sql = "insert into orders values(?,?,?,?)";
        qr.update(conn,sql , order.getOid(),order.getOrdertime(),order.getTotal(),order.getUid());
    }

    @Override
    public void insertOrderitem(Connection conn,OrderItem orderitem) throws SQLException {
        QueryRunner qr = new QueryRunner();
        String sql = "insert into orderitem values(?,?,?,?,?)";
        qr.update(conn, sql,orderitem.getItemid(),orderitem.getCount(),orderitem.getSubtotal(),orderitem.getPid(),orderitem.getOid());
    }

    @Override
    public List<Order> queryOrder(String uid,String keyword) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select distinct o.* from orders o join orderitem oi on o.oid = oi.oid join product p on oi.pid = p.pid where o.uid = ? ";
        List<Object> params = new ArrayList();
        params.add(uid);
        if(keyword!=null&&keyword!=""){
            sql += "and ( pname like ? or pdesc like ? )";
            params.add("%"+keyword+"%");
            params.add("%"+keyword+"%");
        }
        List<Order> orders = qr.query(sql, new BeanListHandler<Order>(Order.class),params.toArray());
        return orders;
    }

    @Override
    public List<OrderItem> queryOrderitem(String oid) throws SQLException {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select * from orderitem where oid = ?";
        List<OrderItem> orderitems = qr.query(sql, new BeanListHandler<OrderItem>(OrderItem.class),oid);
        return orderitems;
    }

    @Override
    public void deleteOrder(Connection conn,String oid) throws SQLException {
        QueryRunner qr = new QueryRunner();
        String sql_order="delete from orders where oid = ?";
        String sql_orderitem="delete from orderitem where oid = ?";
        qr.update(conn, sql_orderitem,oid);
        qr.update(conn, sql_order,oid);
    }
}
