package servlet;

import bean.Cart;
import bean.CartItem;
import bean.Product;
import service.ProductService;
import service.ProductServiceImp;
import utils.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet(name = "CompanyServlet", urlPatterns = "/company")
public class CompanyServlet extends BaseServlet {
    public String toCompanyInfo(HttpServletRequest request, HttpServletResponse response) {
        return "/company_info.jsp";
    }
}
