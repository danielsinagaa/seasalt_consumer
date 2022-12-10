<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title> BERANDA </title>
</head>
<body>

<a href="/" style="text-decoration: none;color: black;" >
    <img src="${pageContext.request.contextPath}/resource/images/home.png" width="35px" class="rounded mx-auto" >
</a>
<div style="width: 90vw; margin: 10px auto;">

    <h4>Data Konsumen </h4>
    <a href="/add" style="text-decoration: none;color: black">
        <img src="${pageContext.request.contextPath}/resource/images/add.png" width="35px" class="rounded mx-auto" >
        ADD
    </a>
    <a href="/search" style="text-decoration: none;color: black;" >
        <img src="${pageContext.request.contextPath}/resource/images/filter.png" width="35px" class="rounded mx-auto" >
        SEARCH
    </a>
</div>
<div style="width: 90vw; margin-left: auto;margin-right: auto">

    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th scope="col">NAMA</th>
            <th scope="col">ALAMAT</th>
            <th scope="col">KOTA</th>
            <th scope="col">PROVINSI</th>
            <th scope="col">TGL REGISTRASI</th>
            <th scope="col">STATUS</th>
            <th colspan="2" class="text-center">ACTION</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${consumerList}" var="consumer" varStatus="loop">
            <tr>
                <td>${consumer.nama}</td>
                <td>${consumer.alamat}</td>
                <td>${consumer.kota}</td>
                <td>${consumer.provinsi}</td>
                <td>${consumer.tglRegistrasi}</td>
                <td>${consumer.status}</td>
                <td class="text-center">
                    <a href="/edit/${consumer.id}" >
                        <img src="${pageContext.request.contextPath}/resource/images/edit.png" width="24" class="rounded mx-auto" >
                    </a>
                </td>
                <td class="text-center">
                    <a href="/home/delete/${consumer.id}" >
                        <img src="${pageContext.request.contextPath}/resource/images/delete.png" width="24" class="rounded mx-auto" >
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>