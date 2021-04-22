<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="contextPath" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="icon" href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979" type="image/ico" />
<link href="https://plus.googlecom/108540024862647200608" rel="publisher" />

<title>Compre Livros</title>

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
						<li>
							<a href="/carrinho" rel="nofollow">
								Carrinho (${carrinhoCompras.quantidade })
							</a>
						</li>
						<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">Sobre Nós</a></li>
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
			<li class="category"><a href="/collections/livros-de-java"> Ciência </a></li>
			<li class="category"><a href="/collections/livros-de-mobile"> Infantil </a></li>
			<li class="category"><a href="/collections/livros-desenvolvimento-web"> Ficção </a></li>
			<li class="category"><a href="/produtos/lista"> Todos </a></li>
		</ul>
	</nav>

	<article id="livro-css-eficiente">
		<header id="product-highlight" class="clearfix">
			<div id="product-overview" class="container">
				<img width="280px" height="395px" src="https://st2.depositphotos.com/3665639/6984/v/600/depositphotos_69845361-stock-illustration-pictograph-of-book-icon.jpg"
					class="product-featured-image" />
				<h1 class="product-title">${produto.titulo }</h1>
				<p class="product-author">
					<span class="product-author-link"> </span>
				</p>
				<p class="book-description">${produto.descricao }</p>
			</div>
		</header>

		<section class="buy-options clearfix">
			<form action='<c:url value="/carrinho/add" />' method="post" class="container">
				<input type="hidden" value="${produto.id }" name="produtoId" >
				<ul id="variants" class="clearfix">
					<c:forEach items="${produto.precos }" var="preco">
						<li class="buy-option">
							<input type="radio" name="tipoPreco" class="variant-radio" id="tipoPreco" value="${preco.tipo }" checked="checked" /> 
							<label class="variant-label" >${preco.tipo }</label> 
							<small class="compare-at-price">R$ 99,90</small>
							<p class="variant-price">${preco.valor }</p>
						</li>
					</c:forEach>
				</ul>
				<button type="submit" class="submit-image icon-basket-alt" title="Compre Agora ${produto.titulo }"></button>
			</form>
		</section>

		<div class="container">
			<section class="summary">
				<ul>
					<li>
						<h3>E muito mais... <a href='/pages/sumario-java8'>veja o sumário</a>.</h3>
					</li>
				</ul>
			</section>

			<section class="data product-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>
					Número de páginas: <span>${produto.paginas}</span>
				</p>
				<p>
					Encontrou um erro? <a href='/submissao-errata' target='_blank'>Submeta uma errata</a>
				</p>
			</section>
		</div>
	</article>

	<footer id="layout-footer">
		<div class="clearfix container">

			<div id="collections-footer">
				<!-- cdc-footer -->
				<p class="footer-title">Exclusivos para você</p>
				<ul class="footer-text-links">
					<li><a href="/collections/livros-de-java">Lançamentos</a></li>
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
					<li><a href="/pages/sobre-a-casa-do-codigo">Sobre Nós</a></li>
					<li><a href="/pages/perguntas-frequentes">Perguntas Frequentes</a></li>
					<li><a href="https://www.caelum.com.br">SAC</a></li>
					<li><a href="http://www.codecrushing.com/" rel="nofollow">Ouvidoria</a></li>
					<li><a href="http://www.casadocodigo.com.br/pages/politica-de-privacidade" rel="nofollow">Política de Privacidade</a></li>
				</ul>
			</div>
			<div id="newsletter-footer">
				<!-- social-footer -->
				<p class="footer-title">Receba as Novidades e Lançamentos</p>
				<div id="form-newsletter">
					<form action="" method="POST" id="ss-form" class="form-newsletter">
						<ul>
							<li><input type="hidden" name="pageNumber" value="0" /><input type="hidden" name="backupCache" value="" /><input type="email"
								name="entry.0.single" value="" class="ss-q-short" id="entry_0" placeholder="seu@email.com" /></li>
							<li><input type="submit" name="submit" value="Quero Receber!" id="submit-newsletter" /></li>
						</ul>
					</form>
					<ul>
						<li class="ie8"><a href="" rel="nofollow">Receba as Novidades e Lançamentos</a></li>
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