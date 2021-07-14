<%--
  Created by IntelliJ IDEA.
  User: mithril-mac
  Date: 2021/07/14
  Time: 5:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top-bar text-sm bg-transparent">
    <div class="container-fluid px-lg-5 py-3">
        <div class="row align-items-center">
            <div class="col-md-4 d-none d-md-block">
                <ul class="list-inline mb-0">
                    <li class="list-inline-item mr-2"><a class="text-reset text-hover-primary" href="#"><i class="fab fa-facebook-f"> </i></a></li>
                    <li class="list-inline-item mr-4"><a class="text-reset text-hover-primary" href="#"><i class="fab fa-twitter"> </i></a></li>
                    <li class="list-inline-item mr-2">
                        <svg class="svg-icon mr-2">
                            <use xlink:href="#calls-1"> </use>
                        </svg>010-8493-8492
                    </li>
                </ul>
            </div>
            <div class="col-sm-6 col-md-4 text-left text-md-center">
                <p class="mb-0">DFlow in-store delivery</p>
            </div>
            <div class="col-sm-6 col-md-4 d-none d-sm-flex justify-content-end">
                <!-- Language Dropdown-->
                <div class="dropdown border-right px-3"><a class="dropdown-toggle topbar-link" id="langsDropdown" href="#" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">Korean</a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="langsDropdown"><a class="dropdown-item" href="#">English</a><a class="dropdown-item" href="#">Japan</a></div>
                </div>
                <!-- Currency Dropdown-->
                <div class="dropdown pl-3 ml-0"><a class="dropdown-toggle topbar-link" id="currencyDropdown" href="#" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">₩</a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="currencyDropdown"><a class="dropdown-item" href="#">USD</a><a class="dropdown-item" href="#">¥</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
