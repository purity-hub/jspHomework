package com.luohongyun.week5.demo;

import com.luohongyun.dao.UserDao;
import com.luohongyun.model.User;
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

    public Connection connection = null;//week5

    @Override
    public void init() throws ServletException {
        /**week5
         *String driver = this.getServletContext().getInitParameter("driver");
         *String url = this.getServletContext().getInitParameter("url");
         *String username = this.getServletContext().getInitParameter("username");
         *String password = this.getServletContext().getInitParameter("password");
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
         */
        connection= (Connection) this.getServletContext().getAttribute("con");
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
        req.getRequestDispatcher("WEB-INF/views/login.jsp").forward(req,resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDao userDao = new UserDao();
        try {
            User user = userDao.findByUsernamePassword(connection, username, password);
            if(user != null){
                req.setAttribute("user",user);//get user info in jsp page
                req.getRequestDispatcher("WEB-INF/views/userInfo.jsp").forward(req,resp);
            }else{
                req.setAttribute("message","Username or Password Error!!!");
                req.getRequestDispatcher("WEB-INF/views/login.jsp").forward(req,resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        /**
        String sql = "select * from usertable where username = '" + username + "' and password = '" + password + "'";
        //System.out.println(username+password);
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
                //week5
                //writer.println("Login Success!!!");
                //writer.println("Welcome"+username);
                req.setAttribute("id",resultSet.getInt("id"));
                req.setAttribute("username",resultSet.getString("username"));
                req.setAttribute("password",resultSet.getString("password"));
                req.setAttribute("email",resultSet.getString("email"));
                req.setAttribute("gender",resultSet.getInt("gender"));
                req.setAttribute("birthday",resultSet.getDate("birthday"));
                req.getRequestDispatcher("userInfo.jsp").forward(req,resp);
            }else{
                //week5
                //writer.println("Username or Password Error!!!");
                req.setAttribute("message","Username or Password Error!");
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
         */
    }
}
