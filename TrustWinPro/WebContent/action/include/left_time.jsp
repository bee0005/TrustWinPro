<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="com.Trustwin.Admin.Project.Timezone.*" %>
<%@ page import="com.Trustwin.Admin.Project.Language.*" %>
<%@ page import="com.Trustwin.Admin.Project.Access.*" %>
<%
	LanguageFunc Lanfunc = new LanguageFunc();
	TimeZoneFunc Timefunc = new TimeZoneFunc();
	AccessFunc Accfunc = new AccessFunc();
	
	TimeZone[] times = Timefunc.TimeMenu();	
	String Num = "";
	int value = 0;
	AccessGroup[] access = Accfunc.AccessGroupMenu();
	

	if(request.getParameter("num") == null || request.getParameter("num").equals("")){
		if(access.length != 0){
			Num = Integer.toString(access[0].getIdx());
		}else{
			value = 1;
		}
	}else{
		Num = (String)request.getParameter("num");
	}
	
	
	String lan = (String)session.getAttribute("nation");
%>
<script type="text/javascript">
function AccessGroupTop(){
	document.getElementById("TimeZoneTopID").className = "timezonetop";
	document.getElementById("TimeZoneTopID").style.color = "black";
	document.getElementById("AccessGroupTopID").className = "accessgrouptop userspan";
	document.getElementById("AccessGroupTopID").style.color = "#ffffff";
}
function TimeZoneTop(){
	document.getElementById("AccessGroupTopID").className = "accessgrouptop";
	document.getElementById("AccessGroupTopID").style.color = "black";
	document.getElementById("TimeZoneTopID").className = "timezonetop userspan";
	document.getElementById("TimeZoneTopID").style.color = "#ffffff";
}
function InsertTime(){
	$.ajax({      
	    type:"post",  
	    url:"/TrustWinPro/action/ajax/InsertTimeZone.jsp",   
	    success:function(args){
	    	location.href = "/TrustWinPro/action/index.jsp?left=Time&content=Time";
	    },   
	    error:function(e){  
	    	alertify.alert(e.responseText);  
	    }  
	}); 
}

function InsertAccess(){
	$.ajax({      
	    type:"post",  
	    url:"/TrustWinPro/action/ajax/InsertAccessGroup.jsp",   
	    success:function(args){
	    	location.href = "/TrustWinPro/action/index.jsp?left=Time&content=AccessGroup";
	    },   
	    error:function(e){  
	    	alertify.alert(e.responseText);  
	    }  
	}); 
}

function Timesubmit(v){
	var form = document.getElementById("Time");
	form.num.value = v;
	form.submit();
}

function Holidaysubmit(){
	var form = document.getElementById("Holiday");
	form.num.value = 1;
	form.submit();
}

function Accesssubmit(v){
	var form = document.getElementById("AccessGroup");
	form.num.value = v;
	form.submit();
}

function TimeAdd(){
	if(document.getElementById("TimeAcess").value == 1){
		$.ajax({      
		    type:"post",  
		    url:"/TrustWinPro/action/ajax/InsertTimeZone.jsp",   
		    success:function(args){
		    	location.href = "/TrustWinPro/action/index.jsp?left=Time&content=Time";
		    },   
		    error:function(e){  
		    	alertify.alert(e.responseText);  
		    }  
		}); 
	}else if(document.getElementById("TimeAcess").value == 2){
		$.ajax({      
		    type:"post",  
		    url:"/TrustWinPro/action/ajax/InsertAccessGroup.jsp",   
		    success:function(args){
		    	location.href = "/TrustWinPro/action/index.jsp?left=Time&content=AccessGroup";
		    },   
		    error:function(e){  
		    	alertify.alert(e.responseText);  
		    }  
		}); 
	}else{
		alertify.alert("<%=Lanfunc.language(lan, 181) %>");
	}
}

function TimeDelete(v){
	if(document.getElementById("TimeAcess").value == 1){
		$.ajax({      
		    type:"post",  
		    url:"/TrustWinPro/action/ajax/DelTimeZone.jsp",   
		    data: "num="+v,
		    success:function(args){
		    	location.href = "/TrustWinPro/action/index.jsp?left=Time&content=Time";
		    },   
		    error:function(e){  
		    	alertify.alert(e.responseText);  
		    }  
		}); 
	}else if(document.getElementById("TimeAcess").value == 2){
		$.ajax({      
		    type:"post",  
		    url:"/TrustWinPro/action/ajax/DelAccessGroup.jsp",   
		    data: "num="+v,
		    success:function(args){
		    	location.href = "/TrustWinPro/action/index.jsp?left=Time&content=AccessGroup";
		    },   
		    error:function(e){  
		    	alertify.alert(e.responseText);  
		    }  
		}); 
	}
}

</script>
<div class="Time">
	<ul>
		<li><a id="AccessGroupTopID" href="#content" onclick="AccessGroupTop();"><img src="/TrustWinPro/action/image/interface/accessgroup.png" style="width:15px;" alt=""> <%=Lanfunc.language(lan, 133) %></a> <a class = "bottom bt_access" href="#a" onclick="InsertAccess();" >+</a>
			<ul>
<%
		for(int i = 0;access.length>i;i++){	
%>
				<li class = "accessgrouplist" id="access<%=access[i].getIdx()%>"><img src="/TrustWinPro/action/image/interface/nieun Icon.png"><img src="/TrustWinPro/action/image/interface/TimeZone-2.png" style="width:13px;"><a href="#content" onclick="Accesssubmit('<%=access[i].getIdx() %>');" onkeypress="Accesssubmit('<%=access[i].getIdx() %>');" id="access<%=access[i].getIdx()%>a" ><%=access[i].getName() %></a></li>
<%
		}
%>
			</ul>
		</li>
		<li><a id="TimeZoneTopID" href="#content" onclick="TimeZoneTop();"><img src="/TrustWinPro/action/image/interface/TimeZone.png" style="width:13px;" alt=""> <%=Lanfunc.language(lan, 111) %></a> <a class = "bottom bt_access" href="#a" onclick="InsertTime();" >+</a>
			<ul>
<%
		for(int i = 0;times.length>i;i++){
%>
				<li class = "timezonelist" id="time<%=times[i].getTimeZoneNo()%>"><img src="/TrustWinPro/action/image/interface/nieun Icon.png"><img src="/TrustWinPro/action/image/interface/TimeZone-2.png" style="width:13px;"><a href="#content" onclick="Timesubmit('<%=times[i].getTimeZoneNo() %>');" onkeypress="Timesubmit('<%=times[i].getTimeZoneNo() %>');" id="time<%=times[i].getTimeZoneNo()%>a" ><%=times[i].getTimeZoneName() %></a></li>

<%
		}
%>
			</ul>
		</li>
		<li id="holiday"><img src="/TrustWinPro/action/image/interface/Holiday.png" alt="" style="width:13px;"> <a href="#" onclick="Holidaysubmit();" onkeypress="Holidaysubmit();">Holiday</a></li>
	</ul>
</div>
<div class="UserButtom" style="display:none">
	<a href="#in" onclick="TimeAdd();"><img src="/TrustWinPro/action/image/interface/add.jpg" /></a>
	<a href="#in" onclick="TimeDelete(<%=Num%>);"><img src="/TrustWinPro/action/image/interface/del.png" /></a>
</div>
<form action="/TrustWinPro/action/index.jsp" name="Time" id="Time" method="post">
	<input type="hidden" value="" name="num" />
	<input type="hidden" value="Time" name="left" />
	<input type="hidden" value="Time" name="content" />
	<input type="hidden" value="" name="division" id="division" />
	<input type="hidden" value="" name="numValue" id="numValue" />
	<input type="hidden" value="" name="TimeAcess" id="TimeAcess" />
</form>
<form action="/TrustWinPro/action/index.jsp" name="Holiday" id="Holiday" method="post">
	<input type="hidden" value="" name="num" />
	<input type="hidden" value="Time" name="left" />
	<input type="hidden" value="Holiday" name="content" />
	<input type="hidden" value="Holiday" name="content" />
</form>
<form action="/TrustWinPro/action/index.jsp" name="AccessGroup" id="AccessGroup" method="post">
	<input type="hidden" value="" name="num" />
	<input type="hidden" value="Time" name="left" />
	<input type="hidden" value="AccessGroup" name="content" />
</form>
<form action="/TrustWinPro/action/index.jsp" name="forrightclick" id="forrightclick" method="post">
	<input type="hidden" id="valueOfselectID" value="<%=Num%>" name="num" />
</form>




<script type="text/javascript">
function SpanTimeClass(idx){
	document.getElementById("time"+idx).className = "timezonelist userspan";
	document.getElementById("time"+idx+"a").style.color = "#ffffff";
	document.getElementById("numValue").value = idx;
	document.getElementById("TimeAcess").value = "1";
}

function SpanAccessClass(idx){
	document.getElementById("access"+idx).className = "accessgrouplist userspan";
	document.getElementById("access"+idx+"a").style.color = "#ffffff";
	document.getElementById("numValue").value = idx;
	document.getElementById("TimeAcess").value = "2";
}

function SpanHoliClass(idx){
	document.getElementById("holiday").className = "userspan";
	document.getElementById("holiday").style.color = "#ffffff";
}

if(<%=value%> == 0 ){
	if('<%=request.getParameter("content")%>'=='Time'){
		SpanTimeClass(<%=Num%>);
	}else if('<%=request.getParameter("content")%>'=='Holiday'){
		SpanHoliClass(<%=Num%>);
	}else{
		SpanAccessClass(<%=Num%>);	
	}
}

</script>

