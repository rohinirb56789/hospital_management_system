package com.dao;

import com.model.Patient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HospitalDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hospitaldb";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "";  // <-- Change this

    // Get DB connection
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    // Add a new patient
 // Change addPatient to take only Patient p
    public boolean addPatient(Patient p) {
        String sql = "INSERT INTO Patients (PatientID, PatientName, Age, Gender, AdmissionDate, Ailment, AssignedDoctor) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, p.getPatientID());
            ps.setString(2, p.getPatientName());
            ps.setInt(3, p.getAge());
            ps.setString(4, p.getGender());

            // convert String admissionDate to java.sql.Date
            ps.setDate(5, java.sql.Date.valueOf(p.getAdmissionDate()));

            ps.setString(6, p.getAilment());
            ps.setString(7, p.getAssignedDoctor());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Delete patient by ID
    public boolean deletePatient(int patientID) {
        String sql = "DELETE FROM Patients WHERE PatientID = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, patientID);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all patients
    public List<Patient> getAllPatient() {
        List<Patient> patients = new ArrayList<>();
        String sql = "SELECT * FROM Patients";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Patient p = new Patient();
                p.setPatientID(rs.getInt("PatientID"));
                p.setPatientName(rs.getString("PatientName"));
                p.setAge(rs.getInt("Age"));
                p.setGender(rs.getString("Gender"));
                p.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                p.setAilment(rs.getString("Ailment"));
                p.setAssignedDoctor(rs.getString("AssignedDoctor"));
                patients.add(p);
            }
            System.out.println("getAllPatient: fetched " + patients.size() + " patients");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patients;
    }

    // Update patient info
    public boolean updatePatient(Patient p) {
        String sql = "UPDATE Patients SET PatientName = ?, Age = ?, Gender = ?, AdmissionDate = ?, Ailment = ?, AssignedDoctor = ? WHERE PatientID = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getPatientName());
            ps.setInt(2, p.getAge());
            ps.setString(3, p.getGender());
            ps.setDate(4, java.sql.Date.valueOf(p.getAdmissionDate()));
            ps.setString(5, p.getAilment());
            ps.setString(6, p.getAssignedDoctor());
            ps.setInt(7, p.getPatientID());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get patient by ID
    public Patient getPatientById(int patientID) {
        String sql = "SELECT * FROM Patients WHERE PatientID = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, patientID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Patient p = new Patient();
                    p.setPatientID(rs.getInt("PatientID"));
                    p.setPatientName(rs.getString("PatientName"));
                    p.setAge(rs.getInt("Age"));
                    p.setGender(rs.getString("Gender"));
                    p.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                    p.setAilment(rs.getString("Ailment"));
                    p.setAssignedDoctor(rs.getString("AssignedDoctor"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get patients by admission date range
    public List<Patient> getPatientsByDateRange(String fromDate, String toDate) {
        List<Patient> patients = new ArrayList<>();
        String sql = "SELECT * FROM Patients WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, java.sql.Date.valueOf(fromDate));
            ps.setDate(2, java.sql.Date.valueOf(toDate));

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Patient p = new Patient();
                    p.setPatientID(rs.getInt("PatientID"));
                    p.setPatientName(rs.getString("PatientName"));
                    p.setAge(rs.getInt("Age"));
                    p.setGender(rs.getString("Gender"));
                    p.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                    p.setAilment(rs.getString("Ailment"));
                    p.setAssignedDoctor(rs.getString("AssignedDoctor"));
                    patients.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patients;
    }

    // Get patients by ailment
    public List<Patient> getPatientsByAilment(String ailment) {
        List<Patient> patients = new ArrayList<>();
        String sql = "SELECT * FROM Patients WHERE Ailment = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, ailment);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Patient p = new Patient();
                    p.setPatientID(rs.getInt("PatientID"));
                    p.setPatientName(rs.getString("PatientName"));
                    p.setAge(rs.getInt("Age"));
                    p.setGender(rs.getString("Gender"));
                    p.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                    p.setAilment(rs.getString("Ailment"));
                    p.setAssignedDoctor(rs.getString("AssignedDoctor"));
                    patients.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patients;
    }

    // Get patients by assigned doctor
    public List<Patient> getPatientsByDoctor(String doctor) {
        List<Patient> patients = new ArrayList<>();
        String sql = "SELECT * FROM Patients WHERE AssignedDoctor = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, doctor);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Patient p = new Patient();
                    p.setPatientID(rs.getInt("PatientID"));
                    p.setPatientName(rs.getString("PatientName"));
                    p.setAge(rs.getInt("Age"));
                    p.setGender(rs.getString("Gender"));
                    p.setAdmissionDate(rs.getDate("AdmissionDate").toString());
                    p.setAilment(rs.getString("Ailment"));
                    p.setAssignedDoctor(rs.getString("AssignedDoctor"));
                    patients.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patients;
    }
}
