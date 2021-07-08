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
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-warning">
                                <div class="nav-tabs-navigation">
                                    <div class="nav-tabs-wrapper">
                                        <span class="nav-tabs-title">상품정보</span>
                                        <ul class="nav nav-tabs" data-tabs="tabs">
                                            <li class="nav-item">
                                                <div class="dropdown" id="sellerType">
                                                    <input type="hidden" name="userType" value="02"
                                                           id="hiddenSellerType">
                                                    <a class="btn btn-secondary dropdown-toggle" href="#none"
                                                       id="addrDropdownSellerType" data-toggle="dropdown">
                                                        <i class="material-icons">account_tree</i>
                                                        상품카테고리
                                                    </a>
                                                    <ul class="dropdown-menu" aria-labelledby="addrDropdownSellerType">
                                                        <li><a class="dropdown-item seller-type" data_value="01">의류</a>
                                                        </li>
                                                        <li><a class="dropdown-item seller-type" data_value="02">뷰티</a>
                                                        </li>
                                                        <li><a class="dropdown-item seller-type"
                                                               data_value="02">악세사리</a></li>
                                                        <li><a class="dropdown-item seller-type" data_value="02">신발</a>
                                                        </li>
                                                        <li><a class="dropdown-item seller-type" data_value="02">가방</a>
                                                        </li>
                                                        <li><a class="dropdown-item seller-type" data_value="02">기타</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="nav-item">
                                                <div class="dropdown" id="producctStatus">
                                                    <input type="hidden" name="userType" value="02"
                                                           id="hiddenProductStatus">
                                                    <a class="btn btn-secondary dropdown-toggle" href="#none"
                                                       id="addrDropdownProductStatus" data-toggle="dropdown">
                                                        <i class="material-icons">sell</i>
                                                        상품상태
                                                    </a>
                                                    <ul class="dropdown-menu"
                                                        aria-labelledby="addrDropdownProductStatus">
                                                        <li><a class="dropdown-item seller-type" data_value="01">판매중</a>
                                                        </li>
                                                        <li><a class="dropdown-item seller-type"
                                                               data_value="02">판매중지</a></li>
                                                        <li><a class="dropdown-item seller-type" data_value="02">종료</a>
                                                        </li>
                                                        <li><a class="dropdown-item seller-type"
                                                               data_value="02">재고없음</a></li>
                                                    </ul>
                                                </div>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <div class="input-group mb-3">
                                                <label class="bmd-label-floating">상품명검색</label>
                                                <input type="text" class="form-control" name="password">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <a class="btn btn-info btn-block" href="#none" onclick="duplCheck('top','left')">
                                            검색<div class="ripple-container"></div></a>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class=" text-primary">
                                        <th>
                                            ID
                                        </th>
                                        <th>
                                            상품명
                                        </th>
                                        <th>
                                            Category
                                        </th>
                                        <th>
                                            상품가격
                                        </th>
                                        <th>
                                            상품상태
                                        </th>
                                        <th>
                                            상품관리
                                        </th>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                1
                                            </td>
                                            <td>
                                                Dakota Rice
                                            </td>
                                            <td>
                                                Niger
                                            </td>
                                            <td class="text-primary">
                                                $36,738
                                            </td>
                                            <td>
                                                판매중
                                            </td>
                                            <td class="td-actions text-right">
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-warning btn-link btn-sm"
                                                        data-original-title="상품정보를 재홀용하여 신규 상품을 만듭니다">
                                                    <i class="material-icons">recycling</i>
                                                </button>
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-primary btn-link btn-sm"
                                                        data-original-title="기존 상품을 수정합니다">
                                                    <i class="material-icons">edit</i>
                                                </button>

                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-info btn-link btn-sm"
                                                        data-original-title="상품상세화면을 미리볼수 있습니다">
                                                    <i class="material-icons">preview</i>
                                                </button>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                2
                                            </td>
                                            <td>
                                                Minerva Hooper
                                            </td>
                                            <td>
                                                Curaçao
                                            </td>
                                            <td class="text-primary">
                                                $36,738
                                            </td>
                                            <td>
                                                판매중
                                            </td>
                                            <td class="td-actions text-right">
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-warning btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">recycling</i>
                                                </button>
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-primary btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">edit</i>
                                                </button>

                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-info btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">preview</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                3
                                            </td>
                                            <td>
                                                Sage Rodriguez
                                            </td>
                                            <td>
                                                Netherlands
                                            </td>
                                            <td class="text-primary">
                                                $36,738
                                            </td>
                                            <td>
                                                판매중
                                            </td>
                                            <td class="td-actions text-right">
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-warning btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">recycling</i>
                                                </button>
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-primary btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">edit</i>
                                                </button>

                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-info btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">preview</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                4
                                            </td>
                                            <td>
                                                Philip Chaney
                                            </td>
                                            <td>
                                                Korea, South
                                            </td>
                                            <td class="text-primary">
                                                $36,738
                                            </td>
                                            <td>
                                                판매중
                                            </td>
                                            <td class="td-actions text-right">
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-warning btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">recycling</i>
                                                </button>
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-primary btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">edit</i>
                                                </button>

                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-info btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">preview</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                5
                                            </td>
                                            <td>
                                                Doris Greene
                                            </td>
                                            <td>
                                                Malawi
                                            </td>
                                            <td class="text-primary">
                                                $36,738
                                            </td>
                                            <td>
                                                판매중
                                            </td>
                                            <td class="td-actions text-right">
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-warning btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">recycling</i>
                                                </button>
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-primary btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">edit</i>

                                                </button>
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-info btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">preview</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                6
                                            </td>
                                            <td>
                                                Mason Porter
                                            </td>
                                            <td>
                                                Chile
                                            </td>
                                            <td class="text-primary">
                                                $36,738
                                            </td>
                                            <td>
                                                판매중
                                            </td>
                                            <td class="td-actions text-right">
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-warning btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">recycling</i>
                                                </button>
                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-primary btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">edit</i>
                                                </button>

                                                <button type="button" rel="tooltip" title=""
                                                        class="btn btn-info btn-link btn-sm"
                                                        data-original-title="Edit Task">
                                                    <i class="material-icons">preview</i>
                                                </button>
                                            </td>

                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <nav aria-label="...">
                                        <ul class="pagination">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item active" aria-current="page">
                                                <a class="page-link" href="#">2</a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">Next</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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