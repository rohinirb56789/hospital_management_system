<!DOCTYPE html>
<html>
<head>
    <title>Update Patient</title>
</head>
<body>
    <h2>Update Patient Information</h2>
    <form action="UpdatePatientServlet" method="post">
        Patient ID to update: <input type="number" name="patientID" required><br>
        New Name: <input type="text" name="patientName"><br>
        New Age: <input type="number" name="age"><br>
        New Gender: 
        <select name="gender">
            <option value="">--Select--</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select><br>
        New Admission Date: <input type="date" name="admissionDate"><br>
        New Ailment: <input type="text" name="ailment"><br>
        New Assigned Doctor: <input type="text" name="assignedDoctor"><br>
        <input type="submit" value="Update Patient">
    </form>

    <% String msg = request.getParameter("msg"); 
       if (msg != null) { %>
        <p><b><%= msg %></b></p>
    <% } %>

    <p><a href="index.jsp">Back to Home</a></p>
</body>
</html>
