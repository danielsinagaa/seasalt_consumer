<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title> TAMBAH KONSUMEN BARU </title>
</head>
<body>
<a href="/" style="text-decoration: none;color: black;" >
    <img src="${pageContext.request.contextPath}/resource/images/home.png" width="35px" class="rounded mx-auto" >
</a>
<div style="width: 65vw; margin: 35px auto;">

    <h4>Data Konsumen Baru </h4>
    <form:form method="post" modelAttribute="customer">
        <div class="form-group">
            <label for="namaInp">NAMA: </label>
            <form:input path="nama" type="text" class="form-control" id="namaInp" placeholder="Masukkan Nama Anda"/>
        </div>
        <div class="form-group">
            <label for="alamatInp">ALAMAT: </label>
            <form:input path="alamat" type="text" class="form-control" id="alamatInp" placeholder="Masukkan Alamat Anda"/>
        </div>
        <div class="form-group">
            <label for="kotaInp">KOTA: </label>
            <form:input path="kota" type="text" class="form-control" id="kotaInp" placeholder="Masukkan Kota"/>
        </div>
        <div class="form-group">
            <label for="provInp">Pilih Provinsi: </label>
            <form:select path="provinsi" items="${provinsiList}" class="form-control" id="provInp">
                <c:forEach items="${provinsiList}" var="provinsi" varStatus="loop">
                    <option value="${provinsiList}">
                            ${provinsi}
                    </option>
                </c:forEach>
            </form:select>
        </div>
        <div class="form-group">
            <label for="tglRegisId">TANGGAL REGISTRASI: </label>
            <form:input path="tglRegistrasi" type="date" class="form-control" id="tglRegisId" />
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">STATUS: </legend>
                <form:radiobutton path="status" value="true"/>aktif
                <form:radiobutton path="status" value="false"/>tidak aktif
            </div>
        </fieldset>
        <form:button type="submit" class="btn btn-dark">Submit</form:button>
    </form:form>
</div>

</body>
</html>