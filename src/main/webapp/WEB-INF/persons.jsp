<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Person List</title>
    <style type="text/css">
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
<h2>Person List</h2>
<c:if test="${not empty persons}">
    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>Cars</th>
        </tr>
        <c:forEach var="person" items="${persons}">
            <tr>
                <td>${person.personID}</td>
                <td>${person.firstName}</td>
                <td>${person.lastName}</td>
                <td>${person.email}</td>
                <td><c:if test="${not empty person.dateOfBirth}">${person.dateOfBirth}</c:if></td>
                <td>
                    <c:if test="${not empty person.cars}">
                        <ul>
                            <c:forEach var="car" items="${person.cars}">
                                <li>${car.make} ${car.model} (${car.year})</li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
