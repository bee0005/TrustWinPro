/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2015-10-06 04:55:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.action.ajax;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.Trustwin.Admin.Project.Language.*;

public final class AddUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String depart = (String)request.getParameter("depart");
	int value = 0;
	String lan = (String)session.getAttribute("nation");
	LanguageFunc Lanfunc = new LanguageFunc();
	
	if(!depart.equals("")){
		Connection conn = null;
		String sql = "select UserID from member";
		int maxID = 0;
		try {
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MssqlDB");
	conn = ds.getConnection();
	Statement pstmt = conn.createStatement();
	ResultSet rs = pstmt.executeQuery(sql);
	
	while(rs.next()){
		if(maxID < Integer.parseInt(rs.getString(1))){
	maxID = Integer.parseInt(rs.getString(1));
		}
	}
		
	rs.close();
	conn.close();
		}catch(Exception e){
	out.println("DB error!!.");
	e.printStackTrace();
		}
		
		maxID++;
		
		String SMaxId = Integer.toString(maxID);
		int idlen = SMaxId.length();
		
		for(int i = idlen; i<8;i++){
	SMaxId = "0" + SMaxId;
		}
	
		
		sql = "select * from depart where UpNumber = " + depart;
		
		try {
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MssqlDB");
	conn = ds.getConnection();
	Statement pstmt = conn.createStatement();
	
	ResultSet rs = pstmt.executeQuery(sql);
	
	while(rs.next()){
		value++;
	}
		
	rs.close();
	
	conn.close();
		}catch(Exception e){
	out.println("DB error!!.");
	e.printStackTrace();
		}
		
		
		if(value == 0){
	sql = "insert into member(UserID, FirstName, MiddleName, LastName, ID, Password, CardID,FacilityCode, department,CardID2,CompanyID,Position,TelOffice,EngagedDay,LatestPromoted,RetiredDay,License1,License2,License3,EMail,TelHome,MobilePhone,CarName,Photo,ZipCode,Address)"; 
	sql += " values('"+SMaxId+"','username','','',"+SMaxId+","+SMaxId+",'00"+SMaxId+"','00000','"+depart+"','1','"+SMaxId+"','None','None','2015-01-01','2015-01-01','2015-01-01','None','None','None','None','None','None','None','None','None','None')";
	
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
		}else{
			out.println(Lanfunc.language(lan, 128));
		}
	}

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
