<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Hospital Management System</title>
    <style>
        /* Reset some default styles */
        * {
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 60px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            margin-bottom: 30px;
            color: #004d99;
            font-weight: 700;
            letter-spacing: 1.5px;
        }
        ul.menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        ul.menu li {
            margin: 15px 0;
        }
        ul.menu li a {
            display: inline-block;
            text-decoration: none;
            font-size: 20px;
            color: #004d99;
            background: #e6f0ff;
            padding: 14px 25px;
            border-radius: 8px;
            width: 100%;
            max-width: 300px;
            transition: background-color 0.3s ease, color 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,77,153,0.1);
            font-weight: 600;
        }
        ul.menu li a:hover {
            background: #004d99;
            color: white;
            box-shadow: 0 6px 12px rgba(0,77,153,0.4);
        }
        ul.menu li a::before {
            margin-right: 10px;
            font-size: 22px;
            vertical-align: middle;
        }
        /* Icons via Unicode characters */
        ul.menu li:nth-child(1) a::before { content: "➕"; }
        ul.menu li:nth-child(2) a::before { content: "✏️"; }
        ul.menu li:nth-child(3) a::before { content: "🗑️"; }
        ul.menu li:nth-child(4) a::before { content: "👁️"; }
        ul.menu li:nth-child(5) a::before { content: "📊"; }
        
        @media (max-width: 400px) {
            .container {
                padding: 20px 15px;
            }
            ul.menu li a {
                font-size: 18px;
                max-width: 100%;
                padding: 12px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hospital Management System</h1>
        <ul class="menu">
            <li><a href="patientadd.jsp">Add Patient</a></li>
            <li><a href="patientupdate.jsp">Update Patient</a></li>
            <li><a href="patientdelete.jsp">Delete Patient</a></li>
            <li><a href="patientdisplay.jsp">View Patients</a></li>
            <li><a href="reports.jsp">Reports</a></li>
        </ul>
    </div>
</body>
</html>
