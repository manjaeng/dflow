<%@page import="java.util.*,java.text.*"%>
<%
	String date = new SimpleDateFormat("HH:mm:ss").format(new Date());
%>
<script src="/resources2/app/js/iscroll.js"></script>
<script src="/resources2/app/js/swiper.js"></script>
<script src="/resources2/app/js/ui.js?v=<%=date %>"></script>
