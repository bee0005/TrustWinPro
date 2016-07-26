<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String idx = (String)request.getParameter("idx");
	if(request.getParameterValues("checkD") == null){

	}else{
		String[] timeName = request.getParameterValues("checkD");
		String timeZone = (String)request.getParameter("timeSelect");
		
		String sql = "";
		
		
		for(int i=0;i<timeName.length;i++){
			Connection conn = null;
			sql = "IF NOT EXISTS";
			sql += " (Select * From AccessDevice Where device='" +timeName[i]+"' and timezone='"+timeZone+"' and access='"+idx+"') ";
			sql += "BEGIN";
			sql += " insert AccessDevice (device, timezone,access ) values ('" + timeName[i] + "', '" + timeZone + "',"+idx+") ";
			sql += "END;";
			//sql = "insert into AccessDevice (device, timezone,access ) values ('" + timeName[i] + "', '" + timeZone + "',"+idx+");";
			try {
				Context init = new InitialContext();
				DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MssqlDB");
				conn = ds.getConnection();
				Statement pstmt = conn.createStatement();
				
				pstmt.executeUpdate(sql);
				
				conn.close();
			}catch(Exception e){
				out.println("DB error!!.");
				e.printStackTrace();
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script type="text/javascript">
			function replace(){
				document.getElementById("AccessGroup").submit();	
			}
		</script>
	</head>
	<body onload="replace();">
		<form action="/TrustWinPro/action/index.jsp" name="AccessGroup" id="AccessGroup" method="post">
			<input type="hidden" value="<%=idx %>" name="num" />
			<input type="hidden" value="Time" name="left" />
			<input type="hidden" value="AccessGroup" name="content" />
		</form>
	</body>
</html>
