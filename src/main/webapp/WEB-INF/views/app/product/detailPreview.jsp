<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/app/intro/includeSvg.jsp" %>

<!-- Custom font-->
<link rel="stylesheet" href="/resources/app/css/main/fonts/stylesheet.css">
<!-- Swiper-->
<link rel="stylesheet" href="/resources/app/css/main/swiper/css/swiper.min.css">
<!-- AOS - AnimationOnScroll-->
<link rel="stylesheet" href="/resources/app/css/main/aos/aos.css">
<!-- Custom Scrollbar-->
<link rel="stylesheet" href="/resources/app/css/main/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
<!-- Theme stylesheet-->
<link rel="stylesheet" href="/resources/app/css/main/style.default.bc0dbdbe.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/app/css/main/custom.0a822280.css">
<!-- Favicon-->
<link rel="shortcut icon" href="/resources/app/css/main/img/favicon.png">
<!-- FontAwesome-->
<link rel="stylesheet" href="/resources/app/css/main/all.css">
<!-- Tweaks for older IEs--><!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<!-- navbar-->
<header class="header">
	<!-- Top Bar-->
	<%@ include file="/WEB-INF/views/app/common/mainTop.jsp" %>
	<!-- Top Bar End-->
	<%@ include file="/WEB-INF/views/app/common/mainNavbar.jsp" %>
</header>
<section>
	<div class="container-fluid px-xl-7 pt-5 pb-3 pb-lg-6">
		<div class="d-block" id="addToCartAlert">
			<div class="mb-4 mb-lg-5 alert alert-success" role="alert">
				<div class="d-flex align-items-center pr-3">
					<svg class="svg-icon d-none d-sm-block w-3rem h-3rem svg-icon-light flex-shrink-0 mr-3">
						<use xlink:href="#checked-circle-1"> </use>
					</svg>
					<p class="mb-0">상품카트에 추가된 상품이 있습니다<br class="d-inline-block d-lg-none"><a href="cart.html" class="text-reset text-decoration-underline ml-lg-3">View Cart</a></p>
				</div>
				<button class="close close-absolute close-centered opacity-10 text-inherit" type="button" data-dismiss="alert" aria-label="Close">
					<svg class="svg-icon w-2rem h-2rem">
						<use xlink:href="#close-1"> </use>
					</svg>
				</button>
			</div>
		</div>
		<ul class="breadcrumb undefined">
			<li class="breadcrumb-item"><a href="index.html">Home</a></li>
			<li class="breadcrumb-item"><a href="category-full.html">clothes</a></li>
			<li class="breadcrumb-item active"><c:out value="${product.category}"></c:out></li>
		</ul>
		<div class="row">
			<div class="col-lg-6 col-xl-7 pt-4 order-2 order-lg-1 photoswipe-gallery"><a class="d-block mb-4" href="/resources/app/images/dflow/product01.jpeg" data-caption="Push-up Jeans 1 - Caption text" data-toggle="photoswipe" data-width="1200" data-height="1200">
				<div data-toggle="zoom" data-image="/resources/app/images/dflow/product01.jpeg"><img class="img-fluid" src="<c:out value="${product.image1}"></c:out>" alt="Push-up Jeans 1"></div></a><a class="d-block mb-4" href="img/product/detail-1-gray.jpg" data-caption="Push-up Jeans 2 - Caption text" data-toggle="photoswipe" data-width="1200" data-height="1200">
				<div data-toggle="zoom" data-image="/resources/app/images/dflow/product01.jpeg"><img class="img-fluid" src="<c:out value="${product.image2}"></c:out>" alt="Push-up Jeans 3"></div></a><a class="d-block mb-4" href="img/product/detail-4-gray.jpg" data-caption="Push-up Jeans 4 - Caption text" data-toggle="photoswipe" data-width="1200" data-height="1200">
				<div data-toggle="zoom" data-image="/resources/app/images/dflow/product01.jpeg"><img class="img-fluid" src="<c:out value="${product.image3}"></c:out>" alt="Push-up Jeans 4"></div></a><a class="d-block mb-4" href="img/product/detail-5-gray.jpg" data-caption="Push-up Jeans 5 - Caption text" data-toggle="photoswipe" data-width="1200" data-height="1200">
				<div data-toggle="zoom" data-image="/resources/app/images/dflow/product01.jpeg"><img class="img-fluid" src="<c:out value="${product.image4}"></c:out>" alt="Push-up Jeans 5"></div></a><a class="d-block mb-4" href="img/product/detail-6.jpg" data-caption="Push-up Jeans 6 - Caption text" data-toggle="photoswipe" data-width="1200" data-height="1200">
				<div data-toggle="zoom" data-image="/resources/app/images/dflow/product01.jpeg"><img class="img-fluid" src="<c:out value="${product.image5}"></c:out>" alt="Push-up Jeans 6"></div></a>
			</div>
			<div class="col-lg-6 col-xl-4 pt-4 order-1 order-lg-2 ml-lg-auto">
				<div class="sticky-top" style="top: 100px;">
					<h1 class="mb-4"><c:out value="${product.pname}"></c:out></h1>

					<div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between mb-4">
						<ul class="list-inline mb-2 mb-sm-0">
							<li class="list-inline-item h4 font-weight-light mb-0"><c:out value="${product.dprice}"></c:out></li>
							<li class="list-inline-item text-muted font-weight-light">
								<del><c:out value="${product.price}"></c:out></del>
							</li>
						</ul>

					</div>
					<p class="mb-4 text-muted">상품 한줄 평일 입력하면 여기에 상품설명이 입력됩니다.</p>
					<form id="buyForm" action="#">
						<div class="row">
							<div class="col-sm-6 col-lg-12 detail-option mb-4">
								<h6 class="detail-option-heading">Size <span>(required)</span></h6>
								<select class="selectpicker" name="size" data-style="btn-selectpicker">
									<c:set var="sizeOptions" value="${fn:split(product.psize,',')}" />
									<c:forEach var="sizeOption" items="${sizeOptions}" varStatus="g">
										<option value="${sizeOption}">${sizeOption}</option>
										<c:if test="${g.count == 2}"></c:if>
										<c:if test="${g.last}"></c:if>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-6 col-lg-12 detail-option mb-5">
								<h6 class="detail-option-heading">Type <span>(required)</span></h6>
								<c:set var="tagOptions" value="${fn:split(product.ptag,',')}" />
								<c:forEach var="tagOption" items="${tagOptions}" varStatus="g">
									<label class="btn btn-sm btn-outline-primary detail-option-btn-label" for="material_${g}"> ${tagOption}
										<input class="input-invisible" type="radio" name="material" value="value_0" id="material_${g}" required>
									</label>
									<c:if test="${g.count == 2}"></c:if>
									<c:if test="${g.last}"></c:if>
								</c:forEach>
							</div>
						</div>
						<div class="input-group w-100 mb-4">
							<input class="form-control form-control-lg detail-quantity" name="items" type="number" value="1">
							<div class="input-group-append flex-grow-1">
								<button class="btn btn-dark btn-block" type="submit"> <i class="fa fa-shopping-cart mr-2"></i>Add to Cart</button>
							</div>
						</div>
						<div class="row mb-4">
							<div class="col-6"><a href="#"> <i class="far fa-heart mr-2"></i>Add to wishlist </a></div>
							<div class="col-6 text-right">
								<ul class="list-inline mb-0">
									<li class="list-inline-item mr-2"><a class="text-dark text-hover-primary" href="#"><i class="fab fa-facebook-f"> </i></a></li>
									<li class="list-inline-item"><a class="text-dark text-hover-primary" href="#"><i class="fab fa-twitter"> </i></a></li>
								</ul>
							</div>
						</div>
						<ul class="list-unstyled">
							<li><strong>Category:</strong> <a class="text-muted" href="#"><c:out value="${product.category}"></c:out></a></li>
							<li><strong>Tags:</strong>
								<c:set var="tagOptions2" value="${fn:split(product.ptag,',')}" />
								<c:forEach var="tagOption2" items="${tagOptions2}" varStatus="g">
									 ${tagOption2}
									<c:if test="${g.count == 2}"></c:if>
									<c:if test="${g.last}"></c:if>
								</c:forEach>

							</a></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="mt-5">
	<div class="container">
		<ul class="nav nav-tabs flex-column flex-sm-row" role="tablist">
			<li class="nav-item"><a class="nav-link detail-nav-link active" data-toggle="tab" href="#description" role="tab">Description</a></li>
			<li class="nav-item"><a class="nav-link detail-nav-link" data-toggle="tab" href="#additional-information" role="tab">Additional Information</a></li>
		</ul>
		<div class="tab-content py-4">
			<div class="tab-pane fade show active px-3" id="description" role="tabpanel">
				<div class="row">
					<div class="col-md-7">
						<h5>About</h5>
						<c:out value="${product.pcomment}"></c:out>
						<c:out value="${product.lcomment}"></c:out>
					</div>
					<div class="col-md-5"><img class="img-fluid" src="../../../d19m59y37dris4.cloudfront.net/varkala/1-2-1/img/product/detail-3.jpg" alt=""></div>
				</div>
			</div>
			<div class="fade tab-pane" id="additional-information" role="tabpanel">
				<div class="row">
					<div class="col-lg-6">
						<table class="table text-sm">
							<tbody>
							<tr>
								<th class="font-weight-normal border-0">Product #</th>
								<td class="text-muted border-0">Lorem ipsum dolor sit amet</td>
							</tr>
							<tr>
								<th class="font-weight-normal ">Available packaging</th>
								<td class="text-muted ">LOLDuis aute irure dolor in reprehenderit</td>
							</tr>
							<tr>
								<th class="font-weight-normal ">Weight</th>
								<td class="text-muted ">dolor sit amet</td>
							</tr>
							<tr>
								<th class="font-weight-normal ">Sunt in culpa qui</th>
								<td class="text-muted ">Lorem ipsum dolor sit amet</td>
							</tr>
							</tbody>
						</table>
					</div>
					<div class="col-lg-6">
						<table class="table text-sm">
							<tbody>
							<tr>
								<th class="font-weight-normal border-0">Weight</th>
								<td class="text-muted border-0">dolor sit amet                           </td>
							</tr>
							<tr>
								<th class="font-weight-normal ">Sunt in culpa qui</th>
								<td class="text-muted ">Lorem ipsum dolor sit amet                           </td>
							</tr>
							<tr>
								<th class="font-weight-normal ">Product #</th>
								<td class="text-muted ">Lorem ipsum dolor sit amet                           </td>
							</tr>
							<tr>
								<th class="font-weight-normal ">Available packaging</th>
								<td class="text-muted ">LOLDuis aute irure dolor in reprehenderit                           </td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="py-5">
	<div class="container">
		<h5 class="mb-4">추천하는 다른 상품입니다</h5>
		<div class="position-relative">
			<!-- Similar Items Slider-->
			<div class="swiper-container similar-slider">
				<div class="swiper-wrapper pb-5">
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3">
									<div class="product-badge badge badge-secondary">Fresh</div><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/dflow/product01.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/dflow/product03.jpeg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">White Tee</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3"><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/dflow/product03.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/dflow/product01.jpeg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Black blouse</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3">
									<div class="product-badge badge badge-primary">Sale</div><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/dflow/product04.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/dflow/product05.jpeg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">College jacket</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3"><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/dflow/product05.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/dflow/product03.jpeg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Carrot-fit jeans</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3"><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/dflow/product01.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/dflow/product01.jpeg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Striped T-Shirt</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3"><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/dflow/product04.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/dflow/product01.jpeg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Short top</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3">
									<div class="product-badge badge badge-dark">Sold out</div><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="../../../d19m59y37dris4.cloudfront.net/varkala/1-2-1/img/product/0364326148_1_1_1.jpg" alt="product"/><img class="img-fluid" src="../../../d19m59y37dris4.cloudfront.net/varkala/1-2-1/img/product/0364326148_2_1_1.jpg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Ethnic Sweater</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3"><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="../../../d19m59y37dris4.cloudfront.net/varkala/1-2-1/img/product/0931168712_1_1_1.jpg" alt="product"/><img class="img-fluid" src="../../../d19m59y37dris4.cloudfront.net/varkala/1-2-1/img/product/0931168712_2_1_1.jpg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Beige</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
					<!-- similar item slide-->
					<div class="swiper-slide">
						<!-- product-->
						<div>
							<div class="product">
								<div class="product-image mb-md-3"><a href="detail-1.html">
									<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/dflow/product01.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/dflow/product01.jpeg" alt="product"/></div></a>
									<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
										<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
											<use xlink:href="#retail-bag-1"> </use>
										</svg><span class="d-none d-sm-inline">Add to cart</span></a>
										<div><a class="text-dark text-hover-primary mr-2" href="#">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#heart-1"> </use>
											</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
											<svg class="svg-icon svg-icon-heavy">
												<use xlink:href="#expand-1"> </use>
											</svg></a></div>
									</div>
								</div>
								<div class="position-relative">
									<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Skull Tee</a></h3><span class="text-gray-500 text-sm">$40.00</span>
									<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
								</div>
							</div>
						</div>
						<!-- /product   -->
					</div>
				</div>
				<div class="swiper-pagination">   </div>
			</div>
			<div class="swiper-outside-nav align-with-products">
				<div class="swiper-button-prev" id="similarPrev"></div>
				<div class="swiper-button-next" id="similarNext"></div>
			</div>
		</div>
	</div>
</section>
<!-- Sidebar Cart Modal-->
<%@ include file="/WEB-INF/views/app/common/mainCart.jsp" %>
<!-- Sidebar Modal Right-->
<%@ include file="/WEB-INF/views/app/common/mainSidebar.jsp" %>
<!-- Login Modal    -->
<%@ include file="/WEB-INF/views/app/common/mainLogin.jsp" %>
<!-- Footer-->
<%@ include file="/WEB-INF/views/app/common/mainFooter.jsp" %>
<!-- /Footer end-->
<!-- JavaScript files-->

<!-- /Footer end-->
<!-- JavaScript files-->
<!-- jQuery-->
<script src="/resources/app/css/main/jquery/jquery.min.js"></script>
<!-- Bootstrap Bundle -->
<script src="/resources/app/css/main/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Swiper Carousel                       -->
<script src="/resources/app/css/main/swiper/js/swiper.min.js"></script>
<!-- Bootstrap Select-->
<script src="/resources/app/css/main/bootstrap-select/js/bootstrap-select.min.js"></script>
<!-- AOS - AnimationOnScroll-->
<script src="/resources/app/css/main/aos/aos.js"></script>
<!-- Custom Scrollbar-->
<script src="/resources/app/css/main/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/resources/app/css/main/custom-scrollbar-init.f148089f.js"></script>
<!-- Smooth scroll-->
<script src="/resources/app/css/main/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script src="/resources/app/css/main/object-fit-images/ofi.min.js"></script>
<!-- JavaScript Countdown-->
<script src="/resources/app/css/main/countdown.782bfd78.js"></script>
<script>
	var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
	var countdown = new Countdown('countdown', deadline);

</script>
<!-- Some theme config-->
<script>
	var options = {
		navbarExpandPx: 992
	}

</script>
<!-- Main Theme files-->
<script src="/resources/app/css/main/sliders-init.1db6fb07.js"></script>
<script src="/resources/app/css/main/theme.fe2c17cd.js"></script>
</body>