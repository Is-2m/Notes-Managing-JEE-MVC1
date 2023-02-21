package estm.dsic.controllers;

import estm.dsic.DAL.UserDAL;
import estm.dsic.business.UserBusiness;
import estm.dsic.business.Validation;
import estm.dsic.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("op");
        int userId = request.getParameter("userId") == null ? -1 :
                Integer.parseInt(request.getParameter("userId"));
        UserBusiness userB = new UserBusiness();

        if (!request.getParameterNames().hasMoreElements()) {
            request.getSession().setAttribute("users", userB.getAllUsers());
            response.sendRedirect(request.getContextPath() + "/Admin/listAllUsers.jsp");
        } else if (op.equals("viewNotes") && userId != -1) {
            request.getSession().setAttribute("inspectedUser", userB.getUser(userId));
            response.sendRedirect(request.getContextPath() + "/Admin/notesByUser.jsp");
        } else if (op.equals("edit") && userId != -1) {
            request.getSession().setAttribute("userToEdit", userB.getUser(userId));
            response.sendRedirect(request.getContextPath() + "/Admin/createUser.jsp");
        } else if (op.equals("delete") && userId != -1) {
            userB.deleteUser(userId);
            request.getSession().setAttribute("users", userB.getAllUsers());
            response.sendRedirect(request.getHeader("referer"));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passConf = request.getParameter("passConf");

        String referer = request.getHeader("referer").split("\\?")[0];

        UserBusiness userB = new UserBusiness();

        boolean registering = request.getHeader("referer").contains("register.jsp");

        int userId = request.getParameter("userId") == null ? -1 :
                Integer.parseInt(request.getParameter("userId"));

//        if (email == null || email.isEmpty() || name == null || name.isEmpty() || password == null || password.isEmpty()) {
//response.sendRedirect(referer+"?error=All fields are required and can't be empty");
//        }

        if (request.getHeader("referer").contains(".jsp")) {


            String errorMessage = null;
            if ((userId == -1 || email != null) && !Validation.isValidEmail(email)) {
                errorMessage = "Invalid email address.";
                response.sendRedirect(referer + "?error=" + errorMessage);

            } else if (!Validation.isValidPassword(password)) {
                errorMessage = "Password must be at least 8 characters long.";
                response.sendRedirect(referer + "?error=" + errorMessage);

            } else if (!password.equals(passConf)) {
                errorMessage = "Password and its confirmation doesn't match.";
                System.out.println("Pass:" + password);
                System.out.println("Pass:" + passConf);
                response.sendRedirect(referer + "?error=" + errorMessage);

            } else if (userB.isExist(email)) {
                errorMessage = "A user with the same email already exists.";
                response.sendRedirect(referer + "?error=" + errorMessage);
            } else {
                System.out.println("i'm in else");
                User user = new User();
                user.setPassword(password);
                user.setEmail(email);
                user.setName(name);
                if (userId == -1) {
                    System.out.println("i'm in -1   -- "+userId);
                    if (userB.addUser(user)) {
                        if (registering) {
                            response.sendRedirect(request.getContextPath() + "/Auth/auth.jsp");
                        } else {
                            request.getSession().setAttribute("users", userB.getAllUsers());
                            response.sendRedirect(request.getContextPath() + "/Admin/listAllUsers.jsp");
                        }
                    } else {
                        System.out.println("Error UserServlet doPost: creating user");
                    }
                } else {
                    System.out.println("i'm in not -1  -- "+userId);
                    user.setId(userId);
                    if (userB.updateUser(user)) {
                        request.getSession().setAttribute("userToEdit", null);
                        response.sendRedirect(request.getContextPath() + "/UserServlet");
                    } else {
                        System.out.println("Error UserServlet doPost: creating user");
                        System.out.println("Edited user: " + (user == null));
                        System.out.println("Edited userID: " + user.getId() + " | " + userId);
                    }

                }
            }
        }
    }
}
