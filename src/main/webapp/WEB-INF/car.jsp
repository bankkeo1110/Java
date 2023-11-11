<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Car List</title>
</head>
<body>

<h2>Cars hello  jojo</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Make</th>
        <th>Model</th>
        <th>VIN</th>
        <th>Year</th>
    </tr>
    <c:forEach var="car" items="${cars}">
        <tr>
            <td>${car.carId}</td>
            <td>${car.make}</td>
            <td>${car.model}</td>
            <td>${car.vin}</td>
            <td>${car.year}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
