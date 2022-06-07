package com.bogdan.cs230project.servlet;

import com.bogdan.cs230project.dao.CompanyDao;
import com.bogdan.cs230project.dao.JobDao;
import com.bogdan.cs230project.entity.Company;
import com.bogdan.cs230project.entity.Job;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/add-job"})
public class AddJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String companyName = req.getParameter("company");
        Company company = new CompanyDao().findByName(companyName);

        Job job = new Job();
        job.setName(name);
        job.setDescription(description);
        job.setCompany(company);

        JobDao jobDao = new JobDao();
        jobDao.create(job);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
