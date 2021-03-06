<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="com.Trustwin.Admin.Project.Access.*" %>
<%@ page import="com.Trustwin.Admin.Project.Language.*" %>
<%@ page import="com.Trustwin.Admin.Project.Device.*" %>
<%@ page import="com.Trustwin.Admin.Project.User.*" %>
<%
	AccessFunc Accfunc = new AccessFunc();
	LanguageFunc Lanfunc = new LanguageFunc();
	DeviceFunc Devfunc = new DeviceFunc();
	UserFunc Userfunc = new UserFunc();
	
	String idxs = "";
	int value = 0;
	int idx = 0;
	if(request.getParameter("num") == null || request.getParameter("num").equals("")){
		AccessGroup[] group =  Accfunc.AccessGroupMenu();
		if(group.length != 0){
			idx = group[0].getIdx();
		}else{
			value = 1;
		}
	}else{
		idx = Integer.parseInt(request.getParameter("num"));
	}
	
	if(value == 0){
		AccessGroup access = Accfunc.SelAccessGroup(idx);
		AccessDevice[] ad = Accfunc.SelAccessDevice(idx);
		AccessUser[] au = Accfunc.SelAccessUser(idx);
		String lan = (String)session.getAttribute("nation");
%>
<script type="text/javascript">
$( ".tab3>li>a" ).click(function() {
    $(this).parent().addClass("on").siblings().removeClass("on");
    return false;
});

	function displayInfo(z){
		for(var i=1;i<3;i++){
			if(i==z){
				document.getElementById("tab0"+i).parentNode.className = "on";
				document.getElementById("tab"+i).style.display = "block";		
			}else{
				document.getElementById("tab0"+i).parentNode.className = "";
				document.getElementById("tab"+i).style.display = "none";
			}
		}
	}
	function DeviceAdd(){
		document.getElementById("postitDevice").style.display = "block";
		document.getElementById("postitDevice").style.top = "200px";
	}
	
	function DeviceDel(){
		document.getElementById("deviceInfo").submit();
	}
	
	function UserAdd(){
		document.getElementById("postitUser").style.display = "block";
		document.getElementById("postitUser").style.top = "200px";
	}
	
	function UserDel(){
		document.getElementById("userInfo").submit();
	}
	
	function GroupUpdate(){
		document.getElementById("groupInfo").submit();
	}
	
	function GroupDel(){
		document.getElementById("groupInfo").action = "/TrustWinPro/action/page/AccessGroupDel.jsp";
		document.getElementById("groupInfo").submit();
	}
	
	function allDeviceInfoCheck(){
		var check = document.deviceInfo.check;
		if(change == 0){
			for(var i = 0 ; i < check.length;i++ ){
				check[i].checked = true;	
			}
				
			change = 1;
		}else{
			for(var i = 0 ; i < check.length;i++ ){
				check[i].checked = false;
			}
			
			change = 0;
		}
		
	}
	
	function allUserInfoCheck(){
		var check = document.userInfo.check;
		if(change == 0){
			for(var i = 0 ; i < check.length;i++ ){
				check[i].checked = true;	
			}
				
			change = 1;
		}else{
			for(var i = 0 ; i < check.length;i++ ){
				check[i].checked = false;
			}
			
			change = 0;
		}
		
	}
	

</script>

<div>
	<section class = "sectionji">
			<ul class = "ulji">
				</ul>

<div id="Access">
	<div class="basic">
		<form action="/TrustWinPro/action/page/AccessGroupUpdate.jsp" name="groupInfo" id="groupInfo" method="post">
			<input type="hidden" name="idx" value="<%=idx%>" >
			<div class="block">
				<div class="header"><%=Lanfunc.language(lan, 81)%></div>
				<div class="main">
					<input type="text" name="name" value="<%=access.getName() %>" >
				</div>
				<div class="header">
				<%=Lanfunc.language(lan, 82)%>
				</div>
				<div class="main">
					<input type="text" name="info" value="<%=access.getInfo() %>" >
				</div>
			</div>
		</form>
	</div>
</div>
</section>
</div>


<div id = "Access">
			<ul class="tab3" style="margin-bottom:0px">
				<li class="on">
					<a href="#content" onclick="displayInfo(1)" id="tab01"><%=Lanfunc.language(lan, 107)%></a>
				</li>
				<li>
					<a href="#content" onclick="displayInfo(2)" id="tab02"><%=Lanfunc.language(lan, 108)%></a>
				</li>
			</ul>
	<div class="info">
		<div class="device" id="tab1">
			<div class="InfoBox">
				<form action="/TrustWinPro/action/page/AccessDeviceDel.jsp" name="deviceInfo" id="deviceInfo" method="post">
				<input type="hidden" name="idx" value="<%=access.getIdx() %>" >

				<div class = "tablebor">
					<table cellspacing="0" class="titleEx1">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tr>
							<th><%=Lanfunc.language(lan, 85)%><input type="checkbox" name="allcheck" onclick="allDeviceInfoCheck();"></th>
						<%-- 	<th><%=Lanfunc.language(lan, 35)%></th> --%>
							<th><%=Lanfunc.language(lan, 66) %></th>
							<th><%=Lanfunc.language(lan, 2) %></th>
							<th><%=Lanfunc.language(lan, 3) %></th>
						<%-- 	<th><%=Lanfunc.language(lan, 109)%></th> --%>
						</tr>
					</table>
					<table cellspacing="0"  class="ex1">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tbody>
<%
	for(int i=0;i<ad.length;i++){
		Device device = Devfunc.selDevice(Integer.parseInt(ad[i].getDevice()));
%>
							<tr>
								<td class='date1'><input type="checkbox" name="check" value="<%=ad[i].getIdx()%>"></td>
								<td class='date1'><%=device.getControllerName() %></td>
								<td class='date1'><%=device.getID() %></td>
								<td class='date1'><%=device.getAddress() %></td>
							<%-- 	<td class='date1'><%=ad[i].getTimezone().equals("0") ? "" : ad[i].getTimezone() %></td> --%>
							</tr>
<%
	}
%>
						</tbody>
					</table>
				</div>
				</form>
	
			
			<div class="buttom bt_access">
				<div class="image">
					<div class="dropdown" style="margin-left: 1%; font-size: 13px">
						<button onclick="myFunction()" class="dropbtn">•••</button>
						<div id="myDropdown" class="dropdown-content">
							<a href="#" onclick="DeviceAdd();">Add</a> 
							<a href="#"	onclick="DeviceDel();">Delete</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="user" id="tab2" style="display:none;">
			<div class="InfoBox">
				<form action="/TrustWinPro/action/page/AccessUserDel.jsp" name="userInfo" id="userInfo" method="post">
				<input type="hidden" name="idx" value="<%=access.getIdx() %>" >
				<div class = "tablebor" >
					<table cellspacing="0" class="titleEx1">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tr>
							<th><%=Lanfunc.language(lan, 85)%><input type="checkbox" name="allcheck" onclick="allUserInfoCheck();"></th>
							<th><%=Lanfunc.language(lan, 29) %></th>
							<th><%=Lanfunc.language(lan, 81) %></th>
							<%-- <th><%=Lanfunc.language(lan, 108)%></th> --%>
							<th><%=Lanfunc.language(lan, 39)%></th>
						</tr>
					</table>
					<table cellspacing="0"  class="ex1">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tbody>
<%
	for(int i=0;i<au.length;i++){
		String name = Userfunc.SelUserName(au[i].getUserId());
%>
							<tr>
								<td class='date1'><input type="checkbox" name="check" value="<%=au[i].getIdx()%>"></td>
								<td class='date1'><%=au[i].getUserId() %></td>
								<td class='date1'><%=name %></td>
								<td class='date1'><%=au[i].getDeviceGroup() %></td>
							</tr>
<%
	}
%>
						</tbody>
					</table>
				</form>
			</div>
			<div class="buttom bt_access">
				<div class="image">
					<div class="dropdown" style="margin-left: 1%; font-size: 13px">
						<button onclick="myFunction()" class="dropbtn">•••</button>
						<div id="myDropdown" class="dropdown-content">
							<a href="#" onclick="UserAdd();">Add</a> 
							<a href="#"	onclick="UserDel();">Delete</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<div class="mainButtom bt_access">
		<div class="image">
			<a href="#DeviceInfo" onclick="GroupUpdate();"class="button gray" ><span class="icon-check"></span>Save</a>
			<a href="#DeviceInfo" onclick="GroupDel();"class="button gray" ><span class="icon-delete"></span>Remove</a>
		</div>
	</div>

<div class="postitDevice" id="postitDevice">
	<jsp:include page="AccessDevice.jsp" flush="false"></jsp:include>
</div>
<div class="postitUser" id="postitUser">
	<jsp:include page="AccessUser.jsp" flush="false"></jsp:include>
</div>
<form action="/TrustWinPro/action/page/TimeZoneDel.jsp" name="TimeZoneDel" id="TimeZoneDel" method="post">
	<input value="<%=idx%>" name="num" id="num" type="hidden"/>
</form>
<%
	}else{
		
	}
%>