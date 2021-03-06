<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>

<c:url value="/" var="contextPath" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<title>Boa Escolha!</title>

<link rel="icon" href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979" type="image/ico" />
<link href="https://plus.googlecom/108540024862647200608" rel="publisher" />
<link href="${contextPath}resources/css/cssbase-min.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' />
<link href="${contextPath}resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello-ie7.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello-embedded.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/fontello.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/layout-colors.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/responsive-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/guia-do-programador-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${contextPath}resources/css/produtos.css" rel="stylesheet" type="text/css" media="all" />
<link rel="canonical" href="http://www.casadocodigo.com.br/" />
</head>
<body>

	<header id="layout-header">
		<div class="clearfix container">
			<a href="/" id="logo"> </a>
			<div id="header-content">
				<nav id="main-nav">
					<ul class="clearfix">
						<li><a href="${spring:mvcUrl('CC#itens').build() }" rel="nofollow">Carrinho (${carrinhoCompras.quantidade })</a></li>
						<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre N??s</a></li>
						<li><a href="/pages/perguntas-frequentes" rel="nofollow">Perguntas Frequentes</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	
	<nav class="categories-nav">
		<ul class="container">
			<li class="category"><a href="http://www.casadocodigo.com.br">Home</a></li>
			<li class="category"><a href="/collections/livros-de-agile"> Romance </a></li>
			<li class="category"><a href="/collections/livros-de-front-end"> Religioso </a></li>
			<li class="category"><a href="/collections/livros-de-games"> Tecnologia </a></li>
			<li class="category"><a href="/collections/livros-de-java"> Ci??ncia </a></li>
			<li class="category"><a href="/collections/livros-de-mobile"> Infantil </a></li>
			<li class="category"><a href="/collections/livros-desenvolvimento-web"> Fic????o </a></li>
			<li class="category"><a href="/produtos/lista"> Todos </a></li>
		</ul>
	</nav>

	<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras</h2>
		<table id="cart-table">
			<colgroup>
				<col class="item-col" />
				<col class="item-price-col" />
				<col class="item-quantity-col" />
				<col class="line-price-col" />
				<col class="delete-col" />
			</colgroup>
			<thead>
				<tr>
					<th class="cart-img-col"></th>
					<th width="65%">Item</th>
					<th width="10%">Pre??o</th>
					<th width="10%">Quantidade</th>
					<th width="10%">Total</th>
					<th width="5%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${carrinhoCompras.itens }" var="item">
					<tr>
						<td class="cart-img-col"><img src="https://st2.depositphotos.com/3665639/6984/v/600/depositphotos_69845361-stock-illustration-pictograph-of-book-icon.jpg"
							width="71px" height="100px" />
						</td>
						<td class="item-title">${item.produto.titulo }</td>
						<td class="numeric-cell">${item.preco }</td>
						<td class="quantity-input-cell">
								<input type="number" min="0" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item) }" />
						</td>
						<td class="numeric-cell">${carrinhoCompras.getTotal(item) }</td>
						<td class="remove-item">
							<form action="${spring:mvcUrl('CC#remover').arg(0, item.produto.id).arg(1,item.tipoPreco).build() }" method="POST">
								<input type="image" src="${contextPath }/resources/imagens/excluir.png" 
									alt="Excluir" title="Excluir" />
							</form>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<form action="${spring:mvcUrl('PC#finalizar').build() }" method="post"></form>
							<input type="submit" class="checkout" name="checkout" value="Finalizar compra" /></td>						
					<td class="numeric-cell">${carrinhoCompras.total }</td>
					<td></td>
				</tr>
			</tfoot>
		</table>
	</section>

				<!-- cdc-footer -->

	<footer id="layout-footer">
		<div class="clearfix container">

			<div id="collections-footer">
				<!-- cdc-footer -->
				<p class="footer-title">Exclusivos para voc??</p>
				<ul class="footer-text-links">
					<li><a href="/collections/livros-de-java">Lan??amentos</a></li>
					<li><a href="/collections/livros-desenvolvimento-web">Best-seller</a></li>
					<li><a href="/collections/livros-de-mobile">Top 10 The New York Times</a></li>
					<li><a href="/collections/games">Top 10 do Brasil</a></li>
					<li><a href="/collections/livros-de-front-end">Livros Escolares</a></li>
				</ul>
			</div>
			<div id="social-footer">
				<!-- books-footer -->
				<p class="footer-title">Links</p>
				<ul class="footer-text-links">
					<li><a href="http://livros.casadocodigo.com.br" rel="nofollow">Meus E-books</a></li>
					<li><a href="/pages/sobre-a-casa-do-codigo">Sobre N??s</a></li>
					<li><a href="/pages/perguntas-frequentes">Perguntas Frequentes</a></li>
					<li><a href="https://www.caelum.com.br">SAC</a></li>
					<li><a href="http://www.codecrushing.com/" rel="nofollow">Ouvidoria</a></li>
					<li><a href="http://www.casadocodigo.com.br/pages/politica-de-privacidade" rel="nofollow">Pol??tica de Privacidade</a></li>
				</ul>
			</div>
			<div id="newsletter-footer">
				<!-- social-footer -->
				<p class="footer-title">Receba as Novidades e Lan??amentos</p>
				<div id="form-newsletter">
					<form action="" method="POST" id="ss-form" class="form-newsletter">
						<ul>
							<li><input type="hidden" name="pageNumber" value="0" /><input type="hidden" name="backupCache" value="" /><input type="email"
								name="entry.0.single" value="" class="ss-q-short" id="entry_0" placeholder="seu@email.com" /></li>
							<li><input type="submit" name="submit" value="Quero Receber!" id="submit-newsletter" /></li>
						</ul>
					</form>
					<ul>
						<li class="ie8"><a href="" rel="nofollow">Receba as Novidades e Lan??amentos</a></li>
					</ul>
				</div>
				<ul class="footer-payments">
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>