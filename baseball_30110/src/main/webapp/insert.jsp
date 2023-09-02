<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style3.css">
<title>Insert title here</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<section>
		<h3>타자 성적 등록</h3>
		<form action="action.jsp" method="post">
			<table border="1">
				<tr>
					<td>타자 선택</td>
					<td>
						<select name="hitter" style="width: 175px;" style=text-align:left>
							<option value="">타자 선택</option>
							<option value="A001">[A001]김길동</option>
							<option value="A005">[A001]이길동</option>
							<option value="B002">[B002]홍길동</option>
							<option value="B006">[B006]조길동</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3">공격 포인트</td>
				</tr>
				<tr>
					<td>게임 수</td>
					<td><input type="text" value="" name="game">게임</td>
				</tr>
				<tr>
					<td>타석 수</td>
					<td><input type="text" value="" name="bat">타수</td>
				</tr>
				<tr>
					<td>안타 수</td>
					<td><input type="text" value="" name="hit">안타</td>
				</tr>
				<tr>
					<td>홈런 수</td>
					<td><input type="text" value="" name="homerun">홈런</td>
				</tr>
				<tr>
					<td colspan="3">수비 포인트</td>
				</tr>
				<tr>
					<td>아웃 카운트 수</td>
					<td><input type="text" value="" name="count">회</td>
				</tr>
				<tr>
					<td>더블 플레이 수</td>
					<td><input type="text" value="" name="dp">회</td>
				</tr>
				<tr>
					<td>에러</td>
					<td><input type="text" value="" name="error">회</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>