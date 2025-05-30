<!DOCTYPE html>
<html>
<head>
    <title>Delete Patient</title>
</head>
<body>
    <h2>Delete Patient</h2>
    <form action="DeletePatientServlet" method="post">
        Patient ID to delete: <input type="number" name="patientID" required><br>
        <input type="submit" value="Delete Patient">
    </form>

    <% String msg = request.getParameter("msg"); 
       if (msg != null) { %>
        <p><b><%= msg %></b></p>
    <% } %>

    <p><a href="index.jsp">Back to Home</a></p>
</body>
</html>
