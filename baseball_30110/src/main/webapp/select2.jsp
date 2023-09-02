<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
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
		<h3>전체 타자 성적 조회</h3>
		<table border=1 id="t1">
			<tr>
				<td>선수 등록 코드</td>
				<td>선수명</td>
				<td>생년월일</td>
				<td>키</td>
				<td>몸무게</td>
				<td>소속</td>
				<td>선수 등급</td>
				<td>순위</td>
			</tr>
			<%
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				con = Util.getConnection();
				// SQL 쿼리 작성 (테이블 이름과 필드명은 실제 데이터베이스에 맞게 수정)
				String sql = " select a.registration_code as code, a.name, "
				+ " substr(a.birth_day,1,4)||'년'||substr(a.birth_day,5,2)||'월'||substr(a.birth_day,7,2)||'일' as birth_day, a.height, a.weight, "
				+ " decode(substr(a.registration_code,1,1),'A','1군','B','2군') aaa, "
				+ " CASE WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 90 THEN 'A' "
				+ " WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 80 THEN 'B' "
				+ " WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 80 THEN 'B' "
				+ " WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 70 THEN 'C' "
				+ " WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 60 THEN 'D' "
				+ " ELSE 'F' END AS bbb, "
				+ " rank() over(order by round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.APPEARANCE)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) desc) rank "
				+ " from tbl_player_info a, tbl_hitter_info b " + " where a.registration_code = b.registration_code ";
				stmt = con.createStatement();
				// SQL 실행 (데이터베이스에서 값 가져오기)
				rs = stmt.executeQuery(sql);
			%>
			<%
			while (rs.next()) {
				// 결과 집합에서 필드 값을 가져옴
				String registration_code = rs.getString("code");
				String name = rs.getString("name");
				String birth_day = rs.getString("birth_day");
				String height = rs.getString("height");
				String weight = rs.getString("weight");
				String aaa = rs.getString("aaa");
				String bbb = rs.getString("bbb");
				String rank = rs.getString("rank");
			%>
			<tr>
				<td><%=registration_code%></td>
				<td><%=name%></td>
				<td><%=birth_day%></td>
				<td><%=height%></td>
				<td style=text-align:right><%=weight%></td>
				<td style=text-align:right><%=aaa%></td>
				<td><%=bbb%></td>
				<td><%=rank%></td>
				<!-- 필드명에 따라 테이블 셀 추가 -->
			</tr>
			<%
			}
			%>
			<%
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			%>
		</table>
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>