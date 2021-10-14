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
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="#none" id="agreeButton"
                                               class="btn btn-primary btn-block">회원정보입력</a>


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
<script>

    $(function () {
        $('#agreeButton').click(function (event) {
            if(!($("input[name=checkAgree1]").is(":checked"))){
                alert("이용약관에 동의 해 주세요");
                return;
            }
            if(!($("input[name=checkAgree2]").is(":checked")) ){
                alert("개인정보 수집에 동의해 주세요");
                return;
            }

            location.href="/app/user/join_id2.do";
        });

    })

</script>