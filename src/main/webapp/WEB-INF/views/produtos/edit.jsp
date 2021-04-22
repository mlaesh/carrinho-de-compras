<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<spring:url var="css" value="/static/css/bootstrap.css"/>
    	<link type="text/css" rel="stylesheet" href="${css }"/>
		<title>Edição</title>
	</head>
	<body>

		<div class="container">
			<h1>Lista de Produtos</h1>
			<div>${sucesso }</div>
			<div>${falha }</div>
				
				<div class="row">
					<div class="col-12">
						<table class="table table-image  table condensed">
							<thead>
								<tr>
									<th scope="col">Título</th>
									<th scope="col"></th>
									<th scope="col">Descrição</th>
									<th scope="col">Páginas</th>
									<th scope="col">Ação</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${produtos }" var="produto">
								<tr>
									<th scope="row"><a href="${spring:mvcUrl('PC#detalhe').arg(0, produto.id).build() }">${produto.titulo }</a> </th>
									<td class="w-25">
										<img width="50" height="50" alt="prod" src="https://st2.depositphotos.com/3665639/6984/v/600/depositphotos_69845361-stock-illustration-pictograph-of-book-icon.jpg" class="img fluid img-thumbnail">
									<td>${produto.descricao }</td>
									<td>${produto.paginas }</td>
									<td><spring:url value="/produtos/edit/${produto.id }" var="delete"/>
                        				<a class="btn btn-danger" href="${delete }" >Excluir</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<spring:url value="/produtos/form" var="form"/>
        				<a class="btn btn-primary" href="${form }">Cadastrar Novo</a>
				</div>
			</div>
		</div>
	</body>
</html>