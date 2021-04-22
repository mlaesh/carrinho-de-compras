<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<spring:url var="css" value="/static/css/bootstrap.css"/>
    	<link type="text/css" rel="stylesheet" href="${css }"/>
		<title>Muitos Livros!</title>
	</head>
	<body>
	<div class="container">
		<h1>Bora Ler</h1>
		<form:form action="${spring:mvcUrl('PC#gravar').build() }" method="post" commandName="produto" enctype="multipart/form-data">
		<div class="form-group">
			<label>Título</label>
			<form:input path="titulo" class="form-control" />
			<form:errors path="titulo" />
		</div>
		<div class="form-group">
	        <label>Descrição</label>
			<form:textarea rows="10" cols="20" path="descricao" class="form-control"/>
	        <form:errors path="descricao" />
		</div>
		<div class="form-group">
			<label>Páginas</label>
			<form:input path="paginas" class="form-control"/>
	        <form:errors path="paginas" />
		</div>
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			<div class="form-group">
				<label>${tipoPreco}</label>
				<form:input path="precos[${status.index}].valor" class="form-control"/>
				<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
			</div>
		</c:forEach>
		<div class="form-group">
		    <label>Sumário</label>
		    <input name="sumario" type="file" class="form-control" />
		</div>
		<button type="submit">Cadastrar</button>
	</form:form>
	</div>
	</body>
</html>