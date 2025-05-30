<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String type = request.getParameter("type");
    if (type == null) type = "";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Report Criteria</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        label { display: inline-block; width: 120px; margin-bottom: 10px; }
        input[type="text"], input[type="date"] { width: 200px; padding: 5px; }
        .error { color: red; font-weight: bold; }
        .btn { margin-top: 15px; padding: 7px 15px; }
    </style>
</head>
<body>
    <h2>Report Criteria</h2>
    
    <form action="ReportServlet" method="get">
        <input type="hidden" name="type" value="<%= type %>"/>
        
        <%
            if ("dateRange".equals(type)) {
        %>
            <label for="fromDate">From Date:</label>
            <input type="date" id="fromDate" name="fromDate" required><br>

            <label for="toDate">To Date:</label>
            <input type="date" id="toDate" name="toDate" required><br>
        <%
            } else if ("ailment".equals(type)) {
        %>
            <label for="ailment">Ailment:</label>
            <input type="text" id="ailment" name="ailment" required placeholder="Enter ailment"><br>
        <%
            } else if ("doctor".equals(type)) {
        %>
            <label for="doctor">Doctor Name:</label>
            <input type="text" id="doctor" name="doctor" required placeholder="Enter doctor's name"><br>
        <%
            } else {
        %>
            <p class="error">Invalid report type selected.</p>
        <%
            }
        %>
        
        <input type="submit" value="Generate Report" class="btn" 
               <%= ("".equals(type) || (!"dateRange".equals(type) && !"ailment".equals(type) && !"doctor".equals(type))) ? "disabled" : "" %> >
    </form>
    
    <p><a href="reports.jsp">Back to Reports</a></p>
</body>
</html>
