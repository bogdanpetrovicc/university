package com.bogdan.cs230project.servlet;


import com.bogdan.cs230project.dao.JobDao;
import com.bogdan.cs230project.dao.UserDao;
import com.bogdan.cs230project.entity.Job;
import com.bogdan.cs230project.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/subscribe"})
public class SubscribeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        System.out.println("userId: " + userId);
        String jobIdStr = req.getParameter("id-job");
        System.out.println("jobIdStr: " + jobIdStr);
        Integer jobId = Integer.parseInt(jobIdStr);
        User user = new UserDao().find(userId);
        System.out.println("user: " + user.getUserId());

        JobDao jobDao = new JobDao();
        Job job = jobDao.find(jobId);
        System.out.println("job: " + job.getJobId());

        job.getUsers().add(user);
        jobDao.update(job);

        req.getRequestDispatcher("job.jsp").forward(req, resp);
    }

}

