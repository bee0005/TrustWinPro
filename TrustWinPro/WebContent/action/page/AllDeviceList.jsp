<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Trustwin.Admin.Project.Category.*"%>
<%@ page import="com.Trustwin.Admin.Project.Device.*"%>
<%@ page import="com.Trustwin.Admin.Project.Language.*"%>
<script type="text/javascript">

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


function deviceSort(){
	document.getElementById("postitDevice").style.display = "block";
	document.getElementById("postitDevice").style.top = "200px";
}

var change = 0;
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


function checkedF(num,v){
	var count = 0;
	var array = new Array();
	var check = document.deviceInfo.check;
	for(var i = 0; i< check.length; i++){
		if(check[i].checked){
			array[count] = check[i].value;
			count++;
		}
	}
	
	if(v==1){ // 전송
		if(num==count){
			Enroll('S,D,E,0,E');
		}else{
			var value = 'S,D,E,1,';
			for(var i=0;i<count;i++){
				value = value + array[i] + ',';
			}
			value = value + 'E';
			Enroll(value);
		}
	}else{	// 삭제
		if(num==count){
			Delete('S,D,D,0,E');
		}else{
			var value = 'S,D,D,1,';
			for(var i=0;i<count;i++){
				value = value + array[i] + ',';
			}
			value = value + 'E';
			Delete(value);
		}
	}
	
	
}
</script>
<div id="userdata">
	<%

		CategoryFunc Catefunc = new CategoryFunc();
		LanguageFunc Lanfunc = new LanguageFunc();
		DeviceFunc Devfunc = new DeviceFunc();
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		String ControllerName = (String) request.getParameter("searchControllerName");
		if (ControllerName != null) {
			ControllerName = new String(ControllerName.getBytes("8859_1"), "UTF-8");
		}
		String Address = (String) request.getParameter("searchAddress");
		if (Address != null) {
			Address = new String(Address.getBytes("8859_1"), "UTF-8");
		}

		String ID = (String) request.getParameter("searchID");
		if (ID != null) {
			ID = new String(ID.getBytes("8859_1"), "UTF-8");
		}

		String UniqueID = (String) request.getParameter("searchUniqueID");
		if ((String) request.getParameter("searchUniqueID") != null) {
			UniqueID = new String(UniqueID.getBytes("8859_1"), "UTF-8");
		}

	
		
		String GroupID = (String) request.getParameter("deviceGroupID");
		List <Integer> ChildDepartmentArr = new ArrayList<Integer>();
		if ((String) request.getParameter("deviceGroupID") != null) 
			Devfunc.departmentChildarr(Integer.parseInt(GroupID), ChildDepartmentArr);
		
		
		Device[] devices = Devfunc.searchDevice(ControllerName, Address, ID, UniqueID, ChildDepartmentArr);
		String lan = (String) session.getAttribute("nation");
	%>

	<div>
		<section class="sectionji">
			<ul class="ulji">
			</ul>

			<div>
				<form action="/TrustWinPro/action/index.jsp" name="allDevice"
					id="allDevice" method="post">
					<input type="hidden" value="Device" name="left" /> <input
						type="hidden" value="AllDevice" name="content" />
					<p>
					<div class="headerji">
						<%=Lanfunc.language(lan, 1)%>
						:
					</div>
					<input type="text" name="searchControllerName" class="inputt"
						value="<%=LangUtil.Empty(ControllerName)%>" />
					</p>

					<p>
					<div class="headerji">
						<%=Lanfunc.language(lan, 3)%>
						:
					</div>
					<input type="text" name="searchAddress" class="inputt"
						value="<%=LangUtil.Empty(Address)%>" />
					</p>

					<p>
					<div class="headerji">
						<%=Lanfunc.language(lan, 2)%>
						:
					</div>
					<input type="text" name="searchID" class="inputt"
						value="<%=LangUtil.Empty(ID)%>" />
					</p>

					<p>
					<div class="headerji">
						<%=Lanfunc.language(lan, 6)%>
						:
					</div>
					<input type="text" name="searchUniqueID" class="inputt"
						value="<%=LangUtil.Empty(UniqueID)%>" /> <input type="submit"
						name="submit" value="<%=Lanfunc.language(lan, 182)%>"
						class="ct-btn white" style="margin-left: 3rem" />

					<div style="float: right; margin-right: 20px"">
						<a href="#a" onclick="DevicePrint();"><img
							src="/TrustWinPro/action/image/interface/printImage.jpg" alt=""></a>
					</div>
				</form>
			</div>

		</section>
	</div>
	<!--<div class="searchForm">
	</div> !-->
	<div class="dropdown" style="float:left; margin-left:1%; font-size:13px">
  <button onclick="myFunction()" class="dropbtn">•••</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#" onclick="deviceSort();">Print</a>
    <a href="#" onclick="deviceSort();">Excel</a>
    <a href="#" onclick="deviceSort();">Sort</a>
  </div>
</div>
	<form action="" name="deviceInfo" id="deviceInfo" method="post">

		<div class="tablebor">
			<table cellspacing="0" class="titleEx1">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="14%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				<tr>
					<th><%=Lanfunc.language(lan, 85)%><input type="checkbox"
						name="allcheck" onclick="allDeviceInfoCheck();" value=""></th>
					<th><%=Lanfunc.language(lan, 1)%></th>
					<th><%=Lanfunc.language(lan, 2)%></th>
					<th><%=Lanfunc.language(lan, 3)%></th>
					<th><%=Lanfunc.language(lan, 4)%></th>
					<th><%=Lanfunc.language(lan, 5)%></th>
					<th><%=Lanfunc.language(lan, 6)%></th>
					<th><%=Lanfunc.language(lan, 7)%></th>
				</tr>
			</table>
			<table cellspacing="0" class="ex1">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="14%">
					<col width="12%">
					<col width="12%">
				</colgroup>
				<tbody>
					<%
						for (int i = 0; i < devices.length; i++) {
					%>
					<tr>
						<td><input type="checkbox" name="check"
							value="<%=devices[i].getID()%>"></td>
						<td class='date1'><a href="#a"
							onclick="submitDevice('Device','<%=devices[i].getID()%>')"><%=devices[i].getControllerName()%></a></td>
						<td class='date1'><%=devices[i].getID()%></td>
						<td class='date1'><%=devices[i].getAddress()%></td>
						<td class='date1'><%=devices[i].getPort()%></td>
						<td class='date1'><%=devices[i].getPassword()%></td>
						<td class='date1'><%=devices[i].getUniqueID()%></td>
						<td class='date1'><%=devices[i].getServerPort()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>

		</div>

		<div class="bottom">
			<a href="#" title="Send"
				onclick="checkedF(<%=devices.length%>,1);" class="button yellow"><span style="margin-left: 0px;"><img src="/TrustWinPro/action/image/interface/soket_logo.png" style="height:20px; width:17.5px"></span><%-- <%=Lanfunc.language(lan, 183)%> --%>Send</a>
			<a href="#" title="Delete"
				onclick="checkedF(<%=devices.length%>,2);" class="button yellow"><span style="margin-left: 0px;"><img src="/TrustWinPro/action/image/interface/soket_logo.png" style="height:20px; width:17.5px"></span><%=Lanfunc.language(lan, 88)%></a>
		</div>
		
		<div class="postitDevice" id="postitDevice">
		<jsp:include page="DeviceSort.jsp" flush="false"></jsp:include>
		</div>
		
		
	</form>
</div>
<form action="/TrustWinPro/action/index.jsp" name="Device" id="Device"
	method="post">
	<input type="hidden" value="Device" name="left" /> <input
		type="hidden" value="" name="deviceID" /> <input type="hidden"
		value="DeviceInfo" name="content" />
</form>



