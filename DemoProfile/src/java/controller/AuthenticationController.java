/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.websocket.Session;
import model.Account;
import model.DAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AuthenticationController", urlPatterns = {"/login"})
public class AuthenticationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DAO dao = new DAO();

        Account account = dao.authentication(username, password);

        if (account == null) {
            request.setAttribute("mess", "Username or password incorrect!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        request.getSession().setAttribute("account", account);
        response.sendRedirect("profile");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
