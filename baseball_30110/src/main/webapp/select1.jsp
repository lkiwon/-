<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style3.css">
<title>개별 타자 성적 조회</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
		<h3>개별 타자 성적 조회</h3>
		<table border="1">

			<tr>
				<td>선수 등록 코드를 입력 하시오.</td>
				<td><input type="text" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="선수조회"> <input
					type="button" value="홈으로"></td>
			</tr>

		</table>
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>
