package com.luohongyun.week5.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    public Connection connection = null;

    @Override
    public void init() throws ServletException {
        String driver = this.getServletContext().getInitParameter("driver");
        String url = this.getServletContext().getInitParameter("url");
        String username = this.getServletContext().getInitParameter("username");
        String password = this.getServletContext().getInitParameter("password");
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection= DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
        doPost(req,resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String sql = "select * from usertable where username = '" + username + "' and password = '" + password + "'";
        System.out.println(username+password);
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement=connection.prepareStatement(sql);
            //preparedStatement.setString(1,username);
            //preparedStatement.setString(2,password);
            resultSet=preparedStatement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(resultSet.next()){
                writer.println("Login Success!!!");
                writer.println("Welcome"+username);
            }else{
                writer.println("Username or Password Error!!!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
