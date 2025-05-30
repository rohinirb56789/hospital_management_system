package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private HospitalDAO dao;

    @Override
    public void init() {
        dao = new HospitalDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String type = request.getParameter("type");
        List<Patient> patients = null;

        if (type == null || type.trim().isEmpty()) {
            request.setAttribute("msg", "Report type is required");
            request.getRequestDispatcher("reports.jsp").forward(request, response);
            return;
        }

        try {
            switch (type) {
                case "dateRange":
                    String fromDate = request.getParameter("fromDate");
                    String toDate = request.getParameter("toDate");

                    if (fromDate == null || fromDate.trim().isEmpty() ||
                        toDate == null || toDate.trim().isEmpty()) {
                        request.setAttribute("msg", "From and To dates are required for date range report.");
                        request.getRequestDispatcher("reports.jsp").forward(request, response);
                        return;
                    }

                    patients = dao.getPatientsByDateRange(fromDate, toDate);
                    break;

                case "ailment":
                    String ailment = request.getParameter("ailment");
                    if (ailment == null || ailment.trim().isEmpty()) {
                        request.setAttribute("msg", "Ailment is required for ailment report.");
                        request.getRequestDispatcher("reports.jsp").forward(request, response);
                        return;
                    }
                    patients = dao.getPatientsByAilment(ailment);
                    break;

                case "doctor":
                    String doctor = request.getParameter("doctor");
                    if (doctor == null || doctor.trim().isEmpty()) {
                        request.setAttribute("msg", "Doctor name is required for doctor report.");
                        request.getRequestDispatcher("reports.jsp").forward(request, response);
                        return;
                    }
                    patients = dao.getPatientsByDoctor(doctor);
                    break;

                default:
                    request.setAttribute("msg", "Invalid report type");
                    request.getRequestDispatcher("reports.jsp").forward(request, response);
                    return;
            }

            // Forward results even if empty list (no patients found)
            request.setAttribute("patients", patients);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "An error occurred while generating report: " + e.getMessage());
            request.getRequestDispatcher("reports.jsp").forward(request, response);
        }
    }
}
