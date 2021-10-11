<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"
      href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="/resources/app/assets/css/material-dashboard.css" rel="stylesheet"/>

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
                            <div class="card-header card-header-warning">
                                <div class="nav-tabs-navigation">
                                    <div class="nav-tabs-wrapper">
                                        <span class="nav-tabs-title" style="font-weight: bold">상품등록</span>
                                        <ul class="nav nav-tabs" data-tabs="tabs">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h6>상품메인이미지 등록</h6>
                                        <div class="fileinput fileinput-new text-center"
                                             data-provides="fileinput">
                                            <div class="fileinput-new thumbnail img-raised">
                                                <img src="/resources/app/images/dflow/productPhoto.png"
                                                     rel="nofollow" alt="...">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                            <div>
                                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="image1"/>
                                                    </span>
                                                <a href="#pablo"
                                                   class="btn btn-danger btn-round fileinput-exists"
                                                   data-dismiss="fileinput"><i class="fa fa-times"></i>
                                                    Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="bmd-label-floating">상품명</label>
                                                    <input type="text" class="form-control" name="pname"
                                                           maxlength="100">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="bmd-label-floating">카테고리</label>
                                                    <input type="text" class="form-control" name="category">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="bmd-label-floating">한줄 상품명</label>
                                                    <input type="text" class="form-control" name="pcomment"
                                                           maxlength="200">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="bmd-label-floating">상품 정상가</label>
                                                    <input type="number" class="form-control" name="price">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="bmd-label-floating">상품 상품판매가</label>
                                                    <input type="number" class="form-control" name="dprice">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="bmd-label-floating">재고 수량</label>
                                                    <input type="number" class="form-control" name="pstock">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="exampleFormControlSelect2">제품에 사용 될 사이즈를 전부
                                                        선택하세요</label>
                                                    <select multiple class="form-control selectpicker"
                                                            data-style="btn btn-link" id="exampleFormControlSelect2"
                                                    name="psize"
                                                    >
                                                        <option>S</option>
                                                        <option>M</option>
                                                        <option>L</option>
                                                        <option>XL</option>
                                                        <option>XXL</option>
                                                        <option>XXXL</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                        <option>6</option>
                                                        <option>7</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="bmd-label-floating">색상</label>
                                                    <input type="text" class="form-control" name="pcolor"
                                                           maxlength="200">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <h6>Tags</h6>
                                                    <span class="border-bottom">
                                                    <input type="text" value="" class="form-control tagsinput"
                                                           data-role="tagsinput" data-color="info" name="ptag">
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group bmd-form-group">
                                            <label class="bmd-label-floating">5줄 상품 소개</label>
                                            <textarea class="form-control" rows="5" maxlength="2000" name="lcomment"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <h6>상품 이미지 등록</h6>
                                        <div class="fileinput fileinput-new text-center"
                                             data-provides="fileinput">
                                            <div class="fileinput-new thumbnail img-raised">
                                                <img src="/resources/app/images/dflow/productPhoto.png"
                                                     rel="nofollow" alt="...">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                            <div>
                                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="image2"/>
                                                    </span>
                                                <a href="#pablo"
                                                   class="btn btn-danger btn-round fileinput-exists"
                                                   data-dismiss="fileinput"><i class="fa fa-times"></i>
                                                    Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <h6>상품 이미지 등록</h6>
                                        <div class="fileinput fileinput-new text-center"
                                             data-provides="fileinput">
                                            <div class="fileinput-new thumbnail img-raised">
                                                <img src="/resources/app/images/dflow/productPhoto.png"
                                                     rel="nofollow" alt="...">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                            <div>
                                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="image3"/>
                                                    </span>
                                                <a href="#pablo"
                                                   class="btn btn-danger btn-round fileinput-exists"
                                                   data-dismiss="fileinput"><i class="fa fa-times"></i>
                                                    Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <h6>상품 이미지 등록</h6>
                                        <div class="fileinput fileinput-new text-center"
                                             data-provides="fileinput">
                                            <div class="fileinput-new thumbnail img-raised">
                                                <img src="/resources/app/images/dflow/productPhoto.png"
                                                     rel="nofollow" alt="...">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                            <div>
                                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="image4"/>
                                                    </span>
                                                <a href="#pablo"
                                                   class="btn btn-danger btn-round fileinput-exists"
                                                   data-dismiss="fileinput"><i class="fa fa-times"></i>
                                                    Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <h6>상품 이미지 등록</h6>
                                        <div class="fileinput fileinput-new text-center"
                                             data-provides="fileinput">
                                            <div class="fileinput-new thumbnail img-raised">
                                                <img src="/resources/app/images/dflow/productPhoto.png"
                                                     rel="nofollow" alt="...">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                            <div>
                                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="image5"/>
                                                    </span>
                                                <a href="#pablo"
                                                   class="btn btn-danger btn-round fileinput-exists"
                                                   data-dismiss="fileinput"><i class="fa fa-times"></i>
                                                    Remove</a>
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
                                                           class="btn btn-warning btn-block">상품등록</a>


                                                        <div class="clearfix"></div>
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
<script src="/resources/app/assets/js/material-dashboard.min6c54.js?v=2.2.2" type="text/javascript"></script>

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

            let locationPath = window.location.pathname;
            let navItems = $(".nav-item");
            navItems.each(function (i) {
                if ($(this).children('a').attr('href') == locationPath) {
                    $(this).addClass('active');
                }
            });

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
<script src="/resources/app/my/model_reg.js"></script>