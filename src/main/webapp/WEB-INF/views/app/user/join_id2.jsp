<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"
      href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="/resources/app/assets/css/material-dashboard.css" rel="stylesheet"/>
<!--script src="/resources/app/js/bootstrap.js"></script-->
<div class="wrapper ">
        <!-- Navbar -->
        <!-- End Navbar -->
        <div class="content">
            <div class="container-fluid">
                <form method="POST" enctype="multipart/form-data" id="fileUploadForm">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="card">
                                <div class="card-header card-header-primary">
                                    <h4 class="card-title" style="font-weight: bold">회원정보 등록</h4>
                                    <p class="card-category">회원정보를 등록해 주세요</p>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">

                                            <div class="form-group" id="userIdGroup">
                                                <label class="bmd-label-floating">로그인ID</label>
                                                <input required="true" aria-required="true" type="text"
                                                       class="form-control" name="userId" id="userId"
                                                       onkeypress="userIdKeyUp()"
                                                >
                                                <span class="form-control-feedback">
                                                    <i class="material-icons">done</i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a class="btn btn-info btn-sm" href="#none"
                                               onclick="duplCheck('top','left')">
                                                중복획인
                                                <div class="ripple-container"></div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group bmd-form-group">
                                                <div class="dropdown bootstrap-select">
                                                    <select class="selectpicker" data-size="7"
                                                            data-style="btn btn-primary"
                                                            title="Single Select" tabindex="-98">
                                                        <option disabled="" >사용자유형</option>
                                                        <option value="01">일반회원</option>
                                                        <option value="02" selected="">셀러회원</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group bmd-form-group">
                                                <label for="examplePassword" class="bmd-label-floating">Password</label>
                                                <input required="true" aria-required="true" id="examplePassword"
                                                       type="password" class="form-control" name="password"
                                                       onblur="check_pw()"
                                                >
                                                <label id="examplePassword-error" class="error"
                                                       for="examplePassword"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group bmd-form-group">
                                                <label for="examplePassword2" class="bmd-label-floating">Confirm
                                                    Password</label>
                                                <input required="true" aria-required="true" id="examplePassword2"
                                                       equalto="#examplePassword" type="Password" class="form-control"
                                                       name="rePassword"
                                                       onblur="check_pw()"
                                                >
                                                <label id="examplePassword-error2" class="error"
                                                       for="examplePassword2"></label>
                                            </div><span id="check"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Email</label>
                                                <input required="true" aria-required="true" type="email"
                                                       class="form-control" name="email" id="email"
                                                onblur="check_email()"
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Name</label>
                                                <input required="true" aria-required="true" type="text"
                                                       class="form-control" name="userName" id="userName">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">휴대전화번호</label>
                                                <input required="true" aria-required="true" type="tel"
                                                       id = "mobile"
                                                       class="form-control" name="mobile">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header card-header-primary card-header-text">
                                    <div class="card-icon">
                                        <i class="material-icons">shop</i>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h6>업체정보 등록</h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">회사명</label>
                                                <input required="true" aria-required="true" type="text"
                                                       id = 'company'
                                                       class="form-control" name="company">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">회사전화번호</label>
                                                <input required="true" aria-required="true" type="tel"
                                                       id = 'comPhone'
                                                       class="form-control" name="comPhone">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">거래은행</label>
                                                <input required="true" aria-required="true" type="text"
                                                       id = 'bankName'
                                                       class="form-control" name="bankName">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">은행계좌번호</label>
                                                <input required="true" aria-required="true" type="text"
                                                       id="bankCount"
                                                       class="form-control" name="bankCount">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="dropdown bootstrap-select">
                                                    <select class="selectpicker" data-size="7"
                                                            data-style="btn btn-primary" title="Single Select"
                                                            tabindex="-98" id="mallListSel" onChange="changeMall()">
                                                        <option disabled="" selected=""> 매장위치</option>
                                                        <c:forEach var="item" items="${mallList}">
                                                            <option value="<c:out value="${item.code_no}"/>" data-post="<c:out value="${item.code_data}"/>" data_addr="<c:out value="${item.code_data_desc}"/>">
                                                                <c:out value="${item.code_nm}"/>
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">우편번호</label>
                                                <input required="true" aria-required="true" type="text"
                                                       class="form-control" name="postCode" id="postInput">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">기본 주소</label>
                                                <input required="true" aria-required="true" type="text"
                                                       class="form-control" name="firstAddr" id="addrInput">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">기타 주소</label>
                                                <input required="true" aria-required="true" type="text"
                                                       id="exAddr"
                                                       class="form-control" name="secondAddr">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>취급품목</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <c:forEach var="item" items="${productType}">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <div class="form-check">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                   name="productType"
                                                                   value='<c:out value="${item.code_no}"/>'>
                                                            <span class="form-check-sign">
                                                            <span class="check"></span>
                                                         </span>
                                                            <c:out value="${item.code_nm}"/>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>제품스타일</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <c:forEach var="item" items="${styleList}">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <div class="form-check">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox"
                                                                   name="styleList"
                                                                   value='<c:out value="${item.code_no}"/>'>
                                                            <span class="form-check-sign">
                                                            <span class="check"></span>
                                                        </span><c:out value="${item.code_nm}"/>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-header-primary card-header-text">
                                    <div class="card-icon">
                                        <i class="material-icons">work_outline</i>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">사업자등록번호</label>
                                                <input required="true" aria-required="true" type="text"
                                                       id="bizNo"
                                                       class="form-control" name="bizNo">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h6>사업자등록증 등록</h6>
                                            <div class="fileinput fileinput-new text-center"
                                                 data-provides="fileinput">
                                                <div class="fileinput-new thumbnail img-raised">
                                                    <img src="/resources/app/images/dflow/business_license.jpeg"
                                                         rel="nofollow" alt="...">
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                                <div>
                                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input required="true" aria-required="true" type="file" id="fileUpload"
                                                               name="file"/>
                                                    </span>
                                                    <a href="#pablo"
                                                       class="btn btn-danger btn-round fileinput-exists"
                                                       data-dismiss="fileinput">
                                                        <i class="fa fa-times"></i> Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="#none" id="joinButton"
                                               class="btn btn-primary btn-block">회원가입</a>


                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav class="float-left">
                    <ul>
                        <li>
                            <a href="">
                                Dflow Tim
                            </a>
                        </li>
                        <li>
                            <a href="">
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="">
                                Contect Us
                            </a>
                        </li>

                    </ul>
                </nav>
                <div class="copyright float-right">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    , made with <i class="material-icons">favorite</i> by
                    <a href="" target="_blank">Dflow</a>
                </div>
            </div>
        </footer>
</div>

<!-- Core JS Files -->
<script src="/resources/app/assets/js/core/jquery.min.js"></script>
<script src="/resources/app/assets/js/core/popper.min.js"></script>
<script src="/resources/app/assets/js/core/bootstrap-material-design.min.js"></script>
<script src="/resources/app/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Plugin for the momentJs -->
<script src="/resources/app/assets/js/plugins/moment.min.js"></script>
<!-- Plugin for Sweet Alert -->
<script src="/resources/app/assets/js/plugins/sweetalert2.js"></script>
<!-- Forms Validations Plugin -->
<script src="/resources/app/assets/js/plugins/jquery.validate.min.js"></script>
<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="/resources/app/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
<!-- Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="/resources/app/assets/js/plugins/bootstrap-selectpicker.js"></script>
<!-- Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="/resources/app/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
<!-- DataTables.net Plugin, full documentation here: https://datatables.net/ -->
<script src="/resources/app/assets/js/plugins/jquery.dataTables.min.js"></script>
<!-- Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs -->
<script src="/resources/app/assets/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="/resources/app/assets/js/plugins/jasny-bootstrap.min.js"></script>
<!-- Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar -->
<script src="/resources/app/assets/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="/resources/app/assets/js/plugins/jquery-jvectormap.js"></script>
<!-- Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="/resources/app/assets/js/plugins/nouislider.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="/resources/app/assets/js/plugins/arrive.min.js"></script>

<!-- Chartist JS -->
<script src="/resources/app/assets/js/plugins/chartist.min.js"></script>
<!-- Notifications Plugin -->
<script src="/resources/app/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/resources/app/assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>

<script>
    $(document).ready(function () {

    });
</script>
<script type="text/javascript" src="/resources/app/js/jquery.form.min.js"></script>
<script src="/resources/app/user/join_id.js"></script>
</div>