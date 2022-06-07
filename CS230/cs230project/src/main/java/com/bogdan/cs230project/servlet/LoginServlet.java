package com.bogdan.cs230project.servlet;

import com.bogdan.cs230project.config.Config;
import com.bogdan.cs230project.dao.UserDao;
import com.bogdan.cs230project.entity.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;

@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new UserDao().findByUsername(username);

        if (user != null && user.getPassword().equals(password) && user.getUsername().equals(username)) {
            Properties props = Config.getProperties();
            int validity = Integer.parseInt(props.getProperty("session-validity"));

            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("id", user.getUserId());
            session.setAttribute("roles", user.getRoleFk());
            session.setMaxInactiveInterval(validity);

            response.setStatus(302);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            response.setStatus(401);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "PASSWORD OR USERNAME DOESN'T MATCH");
        }
    }
}

