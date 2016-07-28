<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.Trustwin.Admin.Project.Device.*" %>
<%@ page import="com.Trustwin.Admin.Project.Event.*" %>
<meta http-equiv="x-ua-compatible" content="IE=9" >
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

  $( document ).ready(function() {
		document.getElementById("chart_div_S").style.display = "none";	
		google.charts.load('current', {packages: ['corechart', 'bar']});
		google.charts.setOnLoadCallback(drawBarchart);
	});
	//google.charts.load('current', {packages: ['corechart', 'bar']});
	//google.charts.setOnLoadCallback(drawInit);
  
  function drawVisualization(dataFromAjax) {
  	 var data2 = google.visualization.arrayToDataTable(dataFromAjax);
       var options = {
               title: '���� �ο�',
               vAxis: {title: 'device',  titleTextStyle: {color: 'black'}}
             };
       var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
       chart.draw(data2, options);
  }
  
  function drawBarchart()
  {
       var data = null;
       var table_data = null;
       $.ajax({
           url:'/TrustWinPro/action/ajax/barChartProc.jsp',
           data: 'idx=',
           success: function(res) {
          	table_data = eval("(" + res + ")");
          	drawVisualization(table_data);
           }
      });
  }
  
  function statusBar()
  {
  	var array = document.barChart.check;
  	var val = "";
  	for(var i=0;i<array.length;i++){
  		if(array[i].checked == true){
  			val = val + array[i].value + ",";
  			
  		}
  	}
       $.ajax({
           url:'/TrustWinPro/action/ajax/barStatusProc.jsp',
           data: 'val='+val,
           success: function(res) {
        	  //alert("StatusBar : " +val);
        	   location.reload();
          	 //document.getElementById("barChart").submit();
           }
      });
  }
  

  function statusWindowBar(){
  	if(document.getElementById("chart_div").style.display == "none"){
  		document.getElementById("chart_div").style.display = "block";	
  		document.getElementById("chart_div_S").style.display = "none";	
  	}else{
  		document.getElementById("chart_div").style.display = "none";
  		document.getElementById("chart_div_S").style.display = "block";	
  	}
  }
 
</script>
<div  style="width:100%; height:6px; font-size:0;  padding:2;" >
	
	<a href="#" onclick="statusWindowBar()"><input type="image" src="/TrustWinPro/action/image/setting.png" style="width:20px; height:20px; float:right"/></a>
</div>
<br>
<div>
	<section style = "overflow: hidden;border: 2px solid #46bebe; border-radius: 6px;-webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.15);
		box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.15);background: #fff; width: 100%; ">
	
		<ul style = "height: 45px;
		border-bottom: 1px solid #f2f2f2;
		position: relative;
		height: 44px;
		background: #72c8cd;
		list-style: none;
		margin: 0;
		padding: 0;
		color: #5a5a5a;
		font: normal 12px/0.9 Roboto, 'Nanum Gothic', '����', Dotum, '����', Gulim, sans-serif;
		letter-spacing: 0.03em;">
		</ul>

		<div id="chart_div" ></div>
	</section>
</div>

<div class="chart_div_S" id="chart_div_S" style = "position: relative;
    width: 100%;
    height: 200px;
    padding: 0 0 20px 0;
    margin: 0 0 20px 0;
    border: 1px solid #b4b4b4;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.15);
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.15);
    background: #fff;">
	<form action="/TrustWinPro/action/index.jsp" name="barChart" id="barChart" method="post">
		<div class="chart_table">
			<table cellspacing="0"  class="titleEx1">
				<colgroup>
					<col width="50%">
					<col width="50%">
				</colgroup>
				<tr>
					<th>DeviceName</th>
					<th>Select</th>
				</tr>
			</table>
			<table cellspacing="0"  class="ex1">
				<colgroup>
					<col width="50%">
					<col width="50%">
				</colgroup>
				<tbody>
<%
	DeviceFunc DFunc = new DeviceFunc();
	Device[] dev = DFunc.searchDevice(null,null,null,null);
	EventFunc EFunc = new EventFunc();
	String barchart = EFunc.barChartVal();
	String[] barcharts = barchart.split(",");
	for(int i=0;i<dev.length;i++){
		String status = "";
		for(int j=0;j<barcharts.length;j++){
			if(dev[i].getID().equals(barcharts[j])){
				status = "checked";
				break;
			}
		}
%>
					<tr>
						<td><%=dev[i].getControllerName()%></td>
						<td><input type="checkbox" id="check" name="check" value="<%=dev[i].getID() %>" <%=status %>></td>
					</tr>
<%
	}
%>
				</tbody>
			</table>
			<div class="bottom" id="web-buttons-idrmij3">
				<a href="#" title="Enroll" onclick="statusBar()">submit</a>
			</div>
		</div>
	</form>
</div>
