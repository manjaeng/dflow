<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title></title>
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link href="../../images/common/favicon.ico" rel="shrtcut icon">
<link href="../../images/common/favicon.png" rel="apple-touch-icon-precomposed">

<!-- 개발에서 아래코드 삭제 -->
<%@ page import="java.util.*" %>
<%
Date now = new Date();
String yy = Integer.toString( now.getYear()+1900 ) ;
String mm = Integer.toString( now.getMonth()+1 ) ;
String dd = Integer.toString( now.getDate() ) ;
String hh = Integer.toString( now.getHours() ) ;
String nn = Integer.toString( now.getMinutes() ) ;
String ss = Integer.toString( now.getSeconds() ) ;
String version =  yy  +"."+ mm +"."+ dd +"."+ hh +"."+ nn +"."+ ss ;
%>

<!-- CSS Import -->
<link href="../../css/jquery-ui.css?v=<%=version%>" rel="stylesheet">
<link href="../../css/swiper.css?v=<%=version%>" rel="stylesheet">
<link href="../../css/base.css?v=<%=version%>" rel="stylesheet">
<link href="../../css/common.css?v=<%=version%>" rel="stylesheet">
<link href="../../css/member.css?v=<%=version%>" rel="stylesheet">
<link href="../../css/look.css?v=<%=version%>" rel="stylesheet">
<link href="../../css/home.css?v=<%=version%>" rel="stylesheet">
<!-- <link href="../../css/style.min.css?v=<%=version%>" rel="stylesheet"> -->


<!-- Jqurey Core -->
<script src="../../js/jquery-3.4.1.js"></script>
<script src="../../js/jquery-ui.js"></script>
<script src="../../js/jquery.ui.touch-punch.js"></script>


