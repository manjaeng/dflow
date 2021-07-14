<%--
  Created by IntelliJ IDEA.
  User: mithril-mac
  Date: 2021/07/14
  Time: 5:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade modal-right" id="sidebarRight" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button class="close close-rotate" type="button" data-dismiss="modal" aria-label="Close">
                    <svg class="svg-icon w-3rem h-3rem svg-icon-light align-middle">
                        <use xlink:href="#close-1"> </use>
                    </svg>
                </button>
            </div>
            <div class="modal-body px-5 pb-5">
                <div>
                    <h5 class="mb-5" data-aos="zoom-in" data-aos-delay="50">DFlow</h5>
                    <ul class="nav flex-column mb-5">
                        <li class="nav-item active"><a class="nav-link pl-0" href="#">Home </a></li>
                        <li class="nav-item"><a class="nav-link pl-0" href="#">Link</a></li>
                        <li class="nav-item"><a class="nav-link pl-0 disabled" href="#">Disabled</a></li>
                        <li class="nav-item dropdown"><a class="nav-link pl-0 dropdown-toggle" id="navbarDropdownMenuLink" href="#" data-target="#sidebarSubmenu" data-toggle="collapse" aria-haspopup="true" aria-expanded="false">Dropdown link</a>
                            <div class="collapse" id="sidebarSubmenu">
                                <ul class="nav flex-column ml-3">
                                    <li class="nav-item"><a class="nav-link pl-0" href="#">Action</a></li>
                                    <li class="nav-item"><a class="nav-link pl-0" href="#">Another action</a></li>
                                    <li class="nav-item"><a class="nav-link pl-0" href="#">Something else here                </a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <ul class="list-inline mb-4">
                        <li class="list-inline-item mr-2"><i class="fab fa-facebook-f"> </i></li>
                        <li class="list-inline-item mr-2"><i class="fab fa-twitter"> </i></li>
                        <li class="list-inline-item mr-2">
                            <svg class="svg-icon mr-2">
                                <use xlink:href="#calls-1"> </use>
                            </svg>010-8493-8492
                        </li>
                    </ul>
                    <p class="text-sm text-muted mb-0">Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p>
                </div>
            </div>
        </div>
    </div>
</div>