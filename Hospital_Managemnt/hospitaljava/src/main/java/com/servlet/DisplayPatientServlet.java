package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayPatientsServlet")
public class DisplayPatientServlet extends HttpServlet {

    private HospitalDAO dao;

    @Override
    public void init() {
        dao = new HospitalDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Patient> patients = dao.getAllPatient();
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("patientdisplay.jsp").forward(request, response);
    }
}
