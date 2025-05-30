<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Redirect to servlet if 'patients' attribute is missing (i.e., accessed JSP directly)
    if (request.getAttribute("patients") == null) {
        response.sendRedirect("DisplayPatientsServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient List</title>
    <style>
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #f4f4f4;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        .no-data {
            text-align: center;
            margin-top: 30px;
            font-size: 1.2em;
            color: #555;
        }
    </style>
</head>
<body>
<h2>Patient List</h2>

<%
    // Retrieve the patients list from request attribute
    java.util.List<com.model.Patient> patients = (java.util.List<com.model.Patient>) request.getAttribute("patients");

    if (patients == null || patients.isEmpty()) {
%>
    <div class="no-data">No patients found.</div>
<%
    } else {
%>
    <table>
        <thead>
        <tr>
            <th>Patient ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Admission Date</th>
            <th>Ailment</th>
            <th>Assigned Doctor</th>
        </tr>
        </thead>
        <tbody>
        <% for (com.model.Patient p : patients) { %>
            <tr>
                <td><%= p.getPatientID() %></td>
                <td><%= p.getPatientName() %></td>
                <td><%= p.getAge() %></td>
                <td><%= p.getGender() %></td>
                <td><%= p.getAdmissionDate() %></td>
                <td><%= p.getAilment() %></td>
                <td><%= p.getAssignedDoctor() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
<%
    }
%>
</body>
</html>
