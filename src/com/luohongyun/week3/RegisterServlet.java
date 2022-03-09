package com.luohongyun.week3;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String gender = req.getParameter("gender");
        String date = req.getParameter("date");
        writer.println("<HTML>");
        writer.println("<HEAD><TITLE>UsingServlet</TITLE></HEAD>");
        writer.println("<BODY>");
        writer.println("<p>username :"+username+"</p>");
        writer.println("<p>password :"+password+"</p>");
        writer.println("<p>email :"+email+"</p>");
        writer.println("<p>gender :"+gender+"</p>");
        writer.println("<p>date :"+date+"</p>");
        writer.println("</BODY>");
        writer.println("</HTML>");
    }
}
