<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reports Selection</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { margin-bottom: 20px; }
        .report-link {
            display: block;
            margin: 10px 0;
            font-size: 18px;
            color: #007bff;
            text-decoration: none;
        }
        .report-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Select Report Type</h2>
    
    <a href="report_criteria.jsp?type=dateRange" class="report-link">Report by Admission Date Range</a>
    <a href="report_criteria.jsp?type=ailment" class="report-link">Report by Ailment</a>
    <a href="report_criteria.jsp?type=doctor" class="report-link">Report by Assigned Doctor</a>
    
</body>
</html>
