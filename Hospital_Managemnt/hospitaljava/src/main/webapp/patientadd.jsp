<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            padding: 40px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
        }

        form {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 500px;
            margin: auto;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .message {
            max-width: 500px;
            margin: 20px auto;
            text-align: center;
            font-weight: bold;
            color: green;
        }

        .error {
            color: red;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>Add New Patient</h2>

<form action="AddPatientServlet" method="post">
    <label for="patientID">Patient ID:</label>
    <input type="number" name="patientID" id="patientID" required />

    <label for="patientName">Name:</label>
    <input type="text" name="patientName" id="patientName" required />

    <label for="age">Age:</label>
    <input type="number" name="age" id="age" required />

    <label for="gender">Gender:</label>
    <select name="gender" id="gender" required>
        <option value="">--Select--</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
    </select>

    <label for="admissionDate">Admission Date:</label>
    <input type="date" name="admissionDate" id="admissionDate" required />

    <label for="ailment">Ailment:</label>
    <input type="text" name="ailment" id="ailment" required />

    <label for="assignedDoctor">Assigned Doctor:</label>
    <input type="text" name="assignedDoctor" id="assignedDoctor" required />

    <input type="submit" value="Add Patient" />
</form>

<%
    String msg = request.getParameter("msg");
    if (msg != null) {
        boolean isError = msg.toLowerCase().contains("fail") || msg.toLowerCase().contains("error");
%>
    <div class="message <%= isError ? "error" : "" %>">
        <%= msg %>
    </div>
<%
    }
%>

<div class="back-link">
    <p><a href="index.jsp">← Back to Home</a></p>
</div>

</body>
</html>
