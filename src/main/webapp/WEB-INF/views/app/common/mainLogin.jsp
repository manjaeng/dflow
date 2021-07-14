<%--
  Created by IntelliJ IDEA.
  User: mithril-mac
  Date: 2021/07/14
  Time: 5:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button class="close close-absolute" type="button" data-dismiss="modal" aria-label="Close">
                <svg class="svg-icon w-3rem h-3rem svg-icon-light align-middle">
                    <use xlink:href="#close-1"> </use>
                </svg>
            </button>
            <div class="modal-body p-5">
                <ul class="nav list-inline" role="tablist">
                    <li class="list-inline-item"><a class="nav-link nav-link-lg active" data-toggle="tab" href="#loginModalTabLogin" role="tab" id="loginModalLinkLogin" aria-controls="loginModalTabLogin" aria-selected="true">Login</a></li>
                    <li class="list-inline-item"><a class="nav-link nav-link-lg" data-toggle="tab" href="#loginModalTabRegister" role="tab" id="loginModalLinkRegister" aria-controls="loginModalTabRegister" aria-selected="false">Register</a></li>
                </ul>
                <hr class="mb-3">
                <div class="tab-content">
                    <div class="tab-pane active fade show px-3" id="loginModalTabLogin" role="tabpanel" aria-labelledby="loginModalLinkLogin">
                        <form action="https://demo.bootstrapious.com/DFlow/1-2-1/customer-orders.html" method="get">
                            <div class="form-group">
                                <label class="form-label" for="email">Email</label>
                                <input class="form-control" id="email" type="text">
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label class="form-label" for="loginPassword"> Password</label>
                                    </div>
                                    <div class="col-auto"><a class="form-text small" href="#">Forgot password?</a></div>
                                </div>
                                <input class="form-control" name="loginPassword" id="loginPassword" placeholder="Password" type="password" required data-msg="Please enter your password">
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" id="loginRemember" type="checkbox">
                                    <label class="custom-control-label text-muted" for="loginRemember"> <span class="text-sm">Remember me for 30 days</span></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-block btn-outline-dark" type="submit"><i class="fa fa-sign-in-alt mr-2"></i> Log in</button>
                            </div>
                        </form>
                        <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
                        <div class="text-center">
                            <button class="btn btn btn-outline-primary letter-spacing-0" data-toggle="tooltip" title="Connect with Facebook"><i class="fa-fw fa-facebook-f fab"></i><span class="sr-only">Connect with Facebook</span></button>
                            <button class="btn btn btn-outline-muted letter-spacing-0" data-toggle="tooltip" title="Connect with Google"><i class="fa-fw fa-google fab"></i><span class="sr-only">Connect with Google</span></button>
                        </div>
                    </div>
                    <div class="tab-pane fade px-3" id="loginModalTabRegister" role="tabpanel" aria-labelledby="loginModalLinkRegister">
                        <p class="text-muted text-sm">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pit.                                            </p>
                        <form action="https://demo.bootstrapious.com/DFlow/1-2-1/customer-orders.html" method="get">
                            <div class="form-group">
                                <label class="form-label" for="registerName">Name</label>
                                <input class="form-control" id="registerName" type="text">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="registerEmail">Email</label>
                                <input class="form-control" id="registerEmail" type="text">
                            </div>
                            <div class="form-group">
                                <label class="form-label" for="registerPassword">Password</label>
                                <input class="form-control" id="registerPassword" type="password">
                            </div>
                            <div class="form-group text-center">
                                <button class="btn btn-block btn-outline-dark" type="submit"><i class="far fa-user mr-2"></i>Register                       </button>
                            </div>
                        </form>
                        <hr class="my-3 hr-text letter-spacing-2" data-content="OR CONNECT WITH">
                        <div class="text-center">
                            <button class="btn btn btn-outline-primary letter-spacing-0" data-toggle="tooltip" title="Connect with Facebook"><i class="fa-fw fa-facebook-f fab"></i><span class="sr-only">Connect with Facebook</span></button>
                            <button class="btn btn btn-outline-muted letter-spacing-0" data-toggle="tooltip" title="Connect with Google"><i class="fa-fw fa-google fab"></i><span class="sr-only">Connect with Google                                      </span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
