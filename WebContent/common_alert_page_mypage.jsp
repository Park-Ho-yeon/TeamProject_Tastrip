<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<form name="goPage">
	<input type="hidden" name="t_gubun" value="${t_gubun}">
	<input type="hidden" name="t_no" value="${t_no}" >
</form>
<script type="text/javascript">

	alert("${t_msg}");
	goPage.method="post";
	goPage.action="${t_url}";
	goPage.submit();
	
</script>
</body>
</html>