<%--
  Created by IntelliJ IDEA.
  User: mithril-mac
  Date: 2021/07/14
  Time: 5:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade modal-right" id="sidebarCart" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content sidebar-cart-content">
            <div class="modal-header border-0">
                <button class="close modal-close close-rotate" type="button" data-dismiss="modal" aria-label="Close">
                    <svg class="svg-icon w-3rem h-3rem svg-icon-light align-middle">
                        <use xlink:href="#close-1"> </use>
                    </svg>
                </button>
            </div>
            <div class="modal-body px-5 sidebar-cart-body">
                <!-- Empty cart snippet-->
                <!-- In case of empty cart - display this snippet + remove .d-none-->
                <div class="d-none text-center mb-5">
                    <svg class="svg-icon w-3rem h-3rem svg-icon-light mb-4 text-muted">
                        <use xlink:href="#retail-bag-1"> </use>
                    </svg>
                    <p>Your cart is empty </p>
                </div>
                <!-- Empty cart snippet end-->
                <div class="sidebar-cart-product-wrapper custom-scrollbar">
                    <!-- cart item-->
                    <div class="navbar-cart-product">
                        <div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-ian-dooley-347968-unsplash.jpg" alt="..."/></a>
                            <div class="w-100"><a class="close" href="#">
                                <svg class="svg-icon sidebar-cart-icon">
                                    <use xlink:href="#close-1"> </use>
                                </svg></a>
                                <div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Skull Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
                            </div>
                        </div>
                    </div>
                    <!-- cart item-->
                    <div class="navbar-cart-product">
                        <div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-kyle-loftus-596319-unsplash.jpg" alt="..."/></a>
                            <div class="w-100"><a class="close" href="#">
                                <svg class="svg-icon sidebar-cart-icon">
                                    <use xlink:href="#close-1"> </use>
                                </svg></a>
                                <div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Transparent Blouse</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
                            </div>
                        </div>
                    </div>
                    <!-- cart item-->
                    <div class="navbar-cart-product">
                        <div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-serrah-galos-494312-unsplash.jpg" alt="..."/></a>
                            <div class="w-100"><a class="close" href="#">
                                <svg class="svg-icon sidebar-cart-icon">
                                    <use xlink:href="#close-1"> </use>
                                </svg></a>
                                <div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">White Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
                            </div>
                        </div>
                    </div>
                    <!-- cart item-->
                    <div class="navbar-cart-product">
                        <div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-ian-dooley-347968-unsplash.jpg" alt="..."/></a>
                            <div class="w-100"><a class="close" href="#">
                                <svg class="svg-icon sidebar-cart-icon">
                                    <use xlink:href="#close-1"> </use>
                                </svg></a>
                                <div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Skull Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
                            </div>
                        </div>
                    </div>
                    <!-- cart item-->
                    <div class="navbar-cart-product">
                        <div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-kyle-loftus-596319-unsplash.jpg" alt="..."/></a>
                            <div class="w-100"><a class="close" href="#">
                                <svg class="svg-icon sidebar-cart-icon">
                                    <use xlink:href="#close-1"> </use>
                                </svg></a>
                                <div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Transparent Blouse</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
                            </div>
                        </div>
                    </div>
                    <!-- cart item-->
                    <div class="navbar-cart-product">
                        <div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-serrah-galos-494312-unsplash.jpg" alt="..."/></a>
                            <div class="w-100"><a class="close" href="#">
                                <svg class="svg-icon sidebar-cart-icon">
                                    <use xlink:href="#close-1"> </use>
                                </svg></a>
                                <div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">White Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer sidebar-cart-footer shadow">
                <div class="w-100">
                    <h5 class="mb-4">Subtotal: <span class="float-right">$465.32</span></h5><a class="btn btn-outline-dark btn-block mb-3" href="cart.html">View cart</a><a class="btn btn-dark btn-block" href="checkout.html">Checkout</a>
                </div>
            </div>
        </div>
    </div>
</div>
