<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%
    String hitter = request.getParameter("hitter");
    String game = request.getParameter("game");
    String bat = request.getParameter("bat");
    String hit = request.getParameter("hit");
    String homerun = request.getParameter("homerun");
    String count = request.getParameter("count");
    String dp = request.getParameter("dp");
    String error = request.getParameter("error");
    
    Connection con = null;
    Statement stmt = null;
    	
        con = Util.getConnection();
        stmt = con.createStatement();
        String sql = "insert into TBL_HITTER_INFO values (?,?,?,?,?,?,?,?)";
    
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, hitter);
        pstmt.setString(2, game);
        pstmt.setString(3, bat);
        pstmt.setString(4, hit);
        pstmt.setString(5, homerun);
        pstmt.setString(6, count);
        pstmt.setString(7, dp);
        pstmt.setString(8, error);
        
        pstmt.executeUpdate();
        
        response.sendRedirect("index.jsp");
    %>
    
