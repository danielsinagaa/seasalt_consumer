<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title> CARI DATA KONSUMEN </title>
</head>
<body>
<a href="/" style="text-decoration: none;color: black;" >
    <img src="${pageContext.request.contextPath}/resource/images/home.png" width="35px" class="rounded mx-auto" >
</a>
<div style="width: 65vw; margin: 35px auto;">

    <h4>Filter Pencarian </h4>
    <form:form method="post" modelAttribute="customer">
        <div class="form-group row">
            <label for="namaInp" class="col-sm-2 col-form-label" >NAMA: </label>
        <div class="col-sm-10">
            <form:input path="nama" type="text" class="form-control" id="namaInp" placeholder="Masukkan Nama Anda"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="alamatInp" class="col-sm-2 col-form-label" >ALAMAT: </label>
        <div class="col-sm-10">
            <form:input path="alamat" type="text" class="form-control" id="alamatInp" placeholder="Masukkan Alamat Anda"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="kotaInp" class="col-sm-2 col-form-label" >KOTA: </label>
        <div class="col-sm-10">
            <form:input path="kota" type="text" class="form-control" id="kotaInp" placeholder="Masukkan Kota"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="provInp" class="col-sm-2 col-form-label" >Pilih Provinsi: </label>
            <div class="col-sm-10">
                <form:select path="provinsi" items="${provinsiList}" class="form-control" id="provInp">
                    <c:forEach items="${provinsiList}" var="provinsi" varStatus="loop">
                        <option value="${provinsiList}">
                                ${provinsi}
                        </option>
                    </c:forEach>
                </form:select>
            </div>
        </div>
        <div class="form-group row">
            <label for="tglRegisId" class="col-sm-2 col-form-label" >TANGGAL REGISTRASI: </label>
        <div class="col-sm-10">
            <form:input path="tglRegistrasi" type="date" class="form-control" id="tglRegisId" />
        </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">STATUS: </legend>
                <form:radiobutton path="status" value="true"/>aktif
                <form:radiobutton path="status" value="false"/>tidak aktif
            </div>
        </fieldset>
        <form:button type="submit" class="btn btn-dark">CARI</form:button>
    </form:form>
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
                    <a >
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