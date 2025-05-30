package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {

    private HospitalDAO dao;

    @Override
    public void init() {
        dao = new HospitalDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int patientID = Integer.parseInt(request.getParameter("patientID"));
            String name = request.getParameter("patientName");
            int age = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            String admissionDateStr = request.getParameter("admissionDate"); // yyyy-MM-dd format
            String ailment = request.getParameter("ailment");
            String assignedDoctor = request.getParameter("assignedDoctor");

            // Create patient object
            Patient patient = new Patient();
            patient.setPatientID(patientID);
            patient.setPatientName(name);
            patient.setAge(age);
            patient.setGender(gender);
            patient.setAdmissionDate(admissionDateStr); // store as String (yyyy-MM-dd)
            patient.setAilment(ailment);
            patient.setAssignedDoctor(assignedDoctor);

            // Call DAO method correctly
            boolean added = dao.addPatient(patient);  // only one param now

            if (added) {
                response.sendRedirect("patientadd.jsp?msg=Patient added successfully");
            } else {
                response.sendRedirect("patientadd.jsp?msg=Failed to add patient");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("patientadd.jsp?msg=Error: " + e.getMessage());
        }
    }
}
