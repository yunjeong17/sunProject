<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name=(String)request.getParameter("name");
	String job=(String)request.getParameter("job");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#logo{display:block-inline;}
</style>
</head>
<body>
	<header>
	<a id='logo' href='/'><img src="resources/images/logo/sunLogo1.png" width="240px" height="120px"></a>
	<a id='logout' href=''><%=name %>[<%=job %>]��</a>
	<a id='logout' href=''>�α׾ƿ�</a>
	</header>
	<section class='main-contents'>
		<h1>��������������������</h1>
	</section>
</body>
</html>