<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Patient" %>

<%
    List<Patient> patients = (List<Patient>) request.getAttribute("patients");
    String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .no-data {
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Report Results</h2>

    <% if (msg != null) { %>
        <p style="color:red;"><%= msg %></p>
    <% } %>

    <% if (patients != null && !patients.isEmpty()) { %>
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
                <% for (Patient p : patients) { %>
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
    <% } else { %>
        <p class="no-data">No patients found for the selected criteria.</p>
    <% } %>

    <p><a href="reports.jsp">Back to Reports</a></p>
</body>
</html>
