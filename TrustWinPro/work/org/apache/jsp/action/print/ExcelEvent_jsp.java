/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.52
 * Generated at: 2015-10-06 04:51:20 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.action.print;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.Trustwin.Admin.Project.Event.*;
import com.Trustwin.Admin.Project.Language.*;

public final class ExcelEvent_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");

	String SDate = (String)request.getParameter("SDate");
	String EDate = (String)request.getParameter("EDate");
	String STime = (String)request.getParameter("STime");
	String ETime = (String)request.getParameter("ETime");
	String Name = (String)request.getParameter("Name");
	String User = (String)request.getParameter("User");
	String Top = (String)request.getParameter("Num");
	System.out.println(Top);
	
	request.setCharacterEncoding("utf-8");
	response.setHeader("Content-Type", "application/vnd.ms-excel");
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Content-Disposition", "attachment; filename=\"userExcel.xls\"");

	String[] List= request.getParameter("array").split(",");
	int[] listNum = new int[List.length];
	for(int i=0;i<List.length;i++){
		listNum[i] = Integer.parseInt(List[i].split("/")[1]);
	}
	EventFunc Evtfunc = new EventFunc();
	LanguageFunc Lanfunc = new LanguageFunc();
	
	if(Name != null){
		Name = new String(Name.getBytes("8859_1"), "UTF-8");	
	}
	
	if(User != null){
		User = new String(User.getBytes("8859_1"), "UTF-8");	
	}
	
	Event[] events = Evtfunc.searchEvent(SDate, EDate, STime, ETime, Name, User, Top); 
	String lan = (String)session.getAttribute("nation");

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<style>\r\n");
      out.write("table.titleEx1{background:#596f84;background-size:cover;background-repeat:no-repeat;border:0; width:96%;margin:0 auto;padding:10px; margin:0;padding:0;color:#fff;-ms-filter: \"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/TrustWinPro/action/image/interface/titlebar.png',sizingMethod='scale')\";  }\r\n");
      out.write(".titleEx1 th{padding:.2em 0;vertical-align:middle;font-weight:normal;text-align:center;}\r\n");
      out.write("table.ex1 {width:96%;margin:0 auto;padding:10px;}\r\n");
      out.write("table.ex1 ,.ex1 td,.ex1 th{border:0;border-collapse:collapse;margin:0;padding:0;}\r\n");
      out.write(".ex1 td, .ex1 th{padding:.2em 0;vertical-align:top;font-weight:normal;text-align:center;}\r\n");
      out.write(".ex1 thead th{text-transform:uppercase;color:#fff;}\r\n");
      out.write(".ex1 tbody td{background:#e1e9ef;}\r\n");
      out.write(".ex1 tbody th{background:#e1e9ef;}\r\n");
      out.write(".ex1 tbody tr.odd td{background:#fff;}\r\n");
      out.write(".ex1 tbody tr.odd th{background:#fff;}\r\n");
      out.write(".ex1 caption{text-align:left;text-transform:uppercase;letter-spacing:-1px;}\r\n");
      out.write("table.ex1 th a:link{color:#030;}\r\n");
      out.write("table.ex1 th a:visited{color:#003;}\r\n");
      out.write("table.ex1 td a:link{color:#369;}\r\n");
      out.write("table.ex1 td a:visited{color:#000;}\r\n");
      out.write("table.ex1 a:hover{text-decoration:none;}\r\n");
      out.write("table.ex1 a:active{color:#000;}\r\n");
      out.write("</style>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"application/vnd.ms-excel; charset=euc-kr\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<table>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td></td>\r\n");
      out.write("\t\t\t<td colspan=\"");
      out.print(List.length-1);
      out.write("\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<table border=1 cellspacing=\"0\"  class=\"titleEx1\">\r\n");
      out.write("\t\t<colgroup>\r\n");

	for(int i=0;i<List.length;i++){

      out.write("\r\n");
      out.write("\t\t\t<col width=\"");
      out.print(100/List.length);
      out.write("%\">\r\n");

	}

      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tr>\r\n");

	for(int i=0;i<List.length;i++){

      out.write("\r\n");
      out.write("\t\t\t<td align=\"center\">");
      out.print(Lanfunc.language(lan, listNum[i]) );
      out.write("</td>\r\n");

	}

      out.write("\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<table border=1 cellspacing=\"0\"  class=\"ex1\">\r\n");
      out.write("\t\t<colgroup>\r\n");

	for(int i=0;i<List.length;i++){

      out.write("\r\n");
      out.write("\t\t\t<col width=\"");
      out.print(100/List.length);
      out.write("%\">\r\n");

	}

      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</colgroup>\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t\r\n");

	for(int i=0;i<events.length;i++){

      out.write("\t\r\n");
      out.write("\t\t<tr>\r\n");

		for(int j=0;j<List.length;j++){
			if(List[j].split("/")[1].equals("72")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventType() );
      out.write("</td>\r\n");

			}else if(List[j].split("/")[1].equals("73")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventDate() );
      out.write("</td>\r\n");
				
			}else if(List[j].split("/")[1].equals("74")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventTime() );
      out.write("</td>\r\n");
				
			}else if(List[j].split("/")[1].equals("75")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventPlace() );
      out.write("</td>\r\n");
				
			}else if(List[j].split("/")[1].equals("76")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventName() );
      out.write("</td>\r\n");
				
			}else if(List[j].split("/")[1].equals("77")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventUserid() );
      out.write("</td>\r\n");
				
			}else if(List[j].split("/")[1].equals("78")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventUserName() );
      out.write("</td>\r\n");
				
			}else if(List[j].split("/")[1].equals("79")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventDoorState() );
      out.write("</td>\r\n");
				
			}else if(List[j].split("/")[1].equals("80")){

      out.write("\r\n");
      out.write("\t\t\t<td>");
      out.print(events[i].getEventCompanyId() );
      out.write("</td>\r\n");
				
			}else{
				j--;
			}
		}

      out.write("\r\n");
      out.write("\t\t</tr>\r\n");

	}

      out.write("\r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
