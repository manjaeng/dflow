<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title></title>
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#000000">
<link href="/resources2/app/images/common/favicon.ico" rel="shrtcut icon">
<link href="/resources2/app/images/common/favicon.png" rel="apple-touch-icon-precomposed">

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
<!-- <link href="/resources2/app/css/style.min.css" rel="stylesheet"> -->

<!-- CSS Import -->
<link href="/resources2/app/css/jquery-ui.css?v=<%=version%>" rel="stylesheet">
<link href="/resources2/app/css/swiper.css?v=<%=version%>" rel="stylesheet">
<link href="/resources2/app/css/base.css?v=<%=version%>" rel="stylesheet">
<link href="/resources2/app/css/common.css?v=<%=version%>" rel="stylesheet">
<link href="/resources2/app/css/member.css?v=<%=version%>" rel="stylesheet">
<link href="/resources2/app/css/look.css?v=<%=version%>" rel="stylesheet">
<link href="/resources2/app/css/home.css?v=<%=version%>" rel="stylesheet">
<!-- Jqurey Core -->
<script src="/resources2/app/js/jquery-3.4.1.js"></script>
<script src="/resources2/app/js/jquery-ui.js"></script>
<script src="/resources2/app/js/jquery.ui.touch-punch.js"></script>


