<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"
      href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="/resources/app/assets/css/material-dashboard.css" rel="stylesheet"/>
<!--script src="/resources/app/js/bootstrap.js"></script-->
<div class="wrapper ">
    <%@ include file="/WEB-INF/views/app/common/sellerSidebar.jsp" %>
    <div class="main-panel">
        <!-- Navbar -->
        <%@ include file="/WEB-INF/views/app/common/sellerNav.jsp" %>
        <!-- End Navbar -->
        <div class="content">
            <div class="container-fluid">
                <form method="POST" enctype="multipart/form-data" id="fileUploadForm">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-primary">
                                    <h4 class="card-title" style="font-weight: bold">사용자 동의</h4>
                                    <p class="card-category">개인정보이용 및 사용약관에 동의해주세요.</p>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="accordion" role="tablist">
                                                <div class="card card-collapse">
                                                    <div class="card-header" role="tab" id="headingOne">
                                                        <h6 class="mb-0">
                                                            <a data-toggle="collapse" href="#collapseOne"
                                                               aria-expanded="false" aria-controls="collapseOne">
                                                                이용약관 동의(필수)
                                                                <i class="material-icons">keyboard_arrow_down</i>
                                                            </a>
                                                        </h6>
                                                    </div>

                                                    <div id="collapseOne" class="collapse" role="tabpanel"
                                                         aria-labelledby="headingOne" data-parent="#accordion">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="form-group bmd-form-group">
                                                                    <strong>이용약관 동의(필수)</strong>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group bmd-form-group">
                                                                    <div class="form-check">
                                                                        <label class="form-check-label">
                                                                            <input required="true" aria-required="true"
                                                                                   class="form-check-input"
                                                                                   type="checkbox"
                                                                                   value='Y' name="checkAgree1">
                                                                            <span class="form-check-sign">
																	    <span class="check"></span>
																    </span>
                                                                            동의함
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%@ include file="/WEB-INF/views/app/user/appr1.jsp" %>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card card-collapse">
                                                    <div class="card-header" role="tab" id="headingTwo">
                                                        <h6 class="mb-0">
                                                            <a class="collapsed" data-toggle="collapse"
                                                               href="#collapseTwo" aria-expanded="false"
                                                               aria-controls="collapseTwo">
                                                                개인정보 수집 동의(필수)
                                                                <i class="material-icons">keyboard_arrow_down</i>
                                                            </a>
                                                        </h6>
                                                    </div>
                                                    <div id="collapseTwo" class="collapse" role="tabpanel"
                                                         aria-labelledby="headingTwo" data-parent="#accordion">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-check">
                                                                        <label class="form-check-label">
                                                                            <input required="true" aria-required="true"
                                                                                   class="form-check-input"
                                                                                   type="checkbox"
                                                                                   value='Y' name="checkAgree2">
                                                                            동의함
                                                                            <span class="form-check-sign">
																	    <span class="check"></span>
																    </span>
                                                                        </label>
                                                                    </div>
                                                                    <%@ include
                                                                            file="/WEB-INF/views/app/user/appr2.jsp" %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card card-collapse">
                                                    <div class="card-header" role="tab" id="headingThree">
                                                        <h6 class="mb-0">
                                                            <a class="collapsed" data-toggle="collapse"
                                                               href="#collapseThree" aria-expanded="false"
                                                               aria-controls="collapseThree">
                                                                마케팅정보 수신 동의(선택)
                                                                <i class="material-icons">keyboard_arrow_down</i>
                                                            </a>
                                                        </h6>
                                                    </div>
                                                    <div id="collapseThree" class="collapse" role="tabpanel"
                                                         aria-labelledby="headingThree" data-parent="#accordion">
                                                        <div class="card-body">
                                                            <strong> 마케팅정보 수신 동의(선택)</strong> 마케팅정보 수신동의 내용
                                                            <div class="form-check">
                                                                <label class="form-check-label">
                                                                    <input required="true" aria-required="true"
                                                                           class="form-check-input" type="checkbox"
                                                                           value='Y' name="marketingAgree">
                                                                    <span class="form-check-sign">
																	    <span class="check"></span>
																    </span>
                                                                    동의함
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
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
                                                       class="form-control" name="userId"
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
                                                        <option disabled="" selected="">사용자유형</option>
                                                        <option value="01">일반회원</option>
                                                        <option value="02">셀러회원</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!--
                                            <div class="form-group">
                                                <div class="dropdown" id="sellerType">
                                                    <input required="true" aria-required="true" type="hidden" name="userType" value="02"
                                                           id="hiddenSellerType">
                                                    <a class="btn btn-secondary dropdown-toggle" href="" type="button"
                                                       id="addrDropdownSellerType" data-toggle="dropdown"
                                                       aria-haspopup="true" aria-expanded="false">
                                                        <i class="material-icons">supervisor_account</i>
                                                        사용자 유형을 선택하세요.
                                                    </a>
                                                    <div class="dropdown-menu" aria-labelledby="addrDropdownSellerType">
                                                        <a class="dropdown-item seller-type" heef="#none"
                                                           data_value="01">일반회원</a>
                                                        <a class="dropdown-item seller-type" heef="#none"
                                                           data_value="02">셀러회원</a>
                                                    </div>
                                                </div>
                                            </div>
                                            -->
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group bmd-form-group">
                                                <label for="examplePassword" class="bmd-label-floating">Password</label>
                                                <input required="true" aria-required="true" id="examplePassword"
                                                       type="password" class="form-control" name="password">
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
                                                       name="rePassword">
                                                <label id="examplePassword-error2" class="error"
                                                       for="examplePassword2"></label>
                                            </div>
                                        </div>
                                        ´
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Email</label>
                                                <input required="true" aria-required="true" type="email"
                                                       class="form-control" name="email">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">Name</label>
                                                <input required="true" aria-required="true" type="text"
                                                       class="form-control" name="userName">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">전화번호</label>
                                                <input required="true" aria-required="true" type="tel"
                                                       class="form-control" name="mobile">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">주소</label>
                                                <input required="true" aria-required="true" type="text"
                                                       class="form-control" name="fullAddr">
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
                                                       class="form-control" name="company">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">회사전화번호</label>
                                                <input required="true" aria-required="true" type="tel"
                                                       class="form-control" name="comPhone">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">거래은행</label>
                                                <input required="true" aria-required="true" type="text"
                                                       class="form-control" name="bankName">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="bmd-label-floating">은행계좌번호</label>
                                                <input required="true" aria-required="true" type="text"
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
                                                        <input required="true" aria-required="true" type="file"
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
        $().ready(function () {
            $sidebar = $('.sidebar');

            $sidebar_img_container = $sidebar.find('.sidebar-background');

            $full_page = $('.full-page');

            $sidebar_responsive = $('body > .navbar-collapse');

            window_width = $(window).width();

            fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

            if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
                if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
                    $('.fixed-plugin .dropdown').addClass('open');
                }

            }

            $('.fixed-plugin a').click(function (event) {
                // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
                if ($(this).hasClass('switch-trigger')) {
                    if (event.stopPropagation) {
                        event.stopPropagation();
                    } else if (window.event) {
                        window.event.cancelBubble = true;
                    }
                }
            });

            $('.fixed-plugin .active-color span').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-color', new_color);
                }

                if ($full_page.length != 0) {
                    $full_page.attr('filter-color', new_color);
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.attr('data-color', new_color);
                }
            });

            $('.fixed-plugin .background-color .badge').click(function () {
                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                var new_color = $(this).data('background-color');

                if ($sidebar.length != 0) {
                    $sidebar.attr('data-background-color', new_color);
                }
            });

            $('.fixed-plugin .img-holder').click(function () {
                $full_page_background = $('.full-page-background');

                $(this).parent('li').siblings().removeClass('active');
                $(this).parent('li').addClass('active');


                var new_image = $(this).find("img").attr('src');

                if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    $sidebar_img_container.fadeOut('fast', function () {
                        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                        $sidebar_img_container.fadeIn('fast');
                    });
                }

                if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $full_page_background.fadeOut('fast', function () {
                        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                        $full_page_background.fadeIn('fast');
                    });
                }

                if ($('.switch-sidebar-image input:checked').length == 0) {
                    var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                    var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

                    $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
                    $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
                }

                if ($sidebar_responsive.length != 0) {
                    $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
                }
            });

            $('.switch-sidebar-image input').change(function () {
                $full_page_background = $('.full-page-background');

                $input = $(this);

                if ($input.is(':checked')) {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar_img_container.fadeIn('fast');
                        $sidebar.attr('data-image', '#');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page_background.fadeIn('fast');
                        $full_page.attr('data-image', '#');
                    }

                    background_image = true;
                } else {
                    if ($sidebar_img_container.length != 0) {
                        $sidebar.removeAttr('data-image');
                        $sidebar_img_container.fadeOut('fast');
                    }

                    if ($full_page_background.length != 0) {
                        $full_page.removeAttr('data-image', '#');
                        $full_page_background.fadeOut('fast');
                    }

                    background_image = false;
                }
            });

            $('.switch-sidebar-mini input').change(function () {
                $body = $('body');

                $input = $(this);

                if (md.misc.sidebar_mini_active == true) {
                    $('body').removeClass('sidebar-mini');
                    md.misc.sidebar_mini_active = false;

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

                } else {

                    $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

                    setTimeout(function () {
                        $('body').addClass('sidebar-mini');

                        md.misc.sidebar_mini_active = true;
                    }, 300);
                }

                // we simulate the window Resize so the charts will get updated in realtime.
                var simulateWindowResize = setInterval(function () {
                    window.dispatchEvent(new Event('resize'));
                }, 180);

                // we stop the simulation of Window Resize after the animations are completed
                setTimeout(function () {
                    clearInterval(simulateWindowResize);
                }, 1000);

            });
        });
    });
</script>
<script type="text/javascript" src="/resources/app/js/jquery.form.min.js"></script>
<script src="/resources/app/user/join_id.js"></script>
</div>