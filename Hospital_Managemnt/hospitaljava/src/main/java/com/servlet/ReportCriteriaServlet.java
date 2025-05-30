package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to report_form.jsp with report type parameter
        String type = request.getParameter("type");
        if (type == null) type = "";
        request.setAttribute("type", type);
        request.getRequestDispatcher("report_form.jsp").forward(request, response);
    }
}
