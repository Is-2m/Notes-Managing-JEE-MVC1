package estm.dsic.controllers;

import estm.dsic.DAL.UserDAL;
import estm.dsic.business.UserBusiness;
import estm.dsic.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "authServlet", urlPatterns = "/authServlet")
public class AuthServlet extends HttpServlet {
    public AuthServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("op");
        if (operation.equals("logout")) {
            req.getSession().invalidate();
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBusiness userBusiness = new UserBusiness();
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = userBusiness.getUser(email, password);

        HttpSession session = req.getSession();

        if (user != null) {
            session.setAttribute("currentUser", user);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Wrong email or password, please double check it or sign up!");
            req.getRequestDispatcher("Auth/auth.jsp").forward(req, resp);
        }
    }
}
