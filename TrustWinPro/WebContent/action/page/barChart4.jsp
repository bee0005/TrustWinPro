<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.Trustwin.Admin.Project.Device.*" %>
<%@ page import="com.Trustwin.Admin.Project.Event.*" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />


<link rel="stylesheet" type="text/css" href="/TrustWinPro/action/css/material-charts.css" />
<script type="text/javascript" src="/TrustWinPro/action/js/material-charts.js"></script>


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
			<div id="chart_div" >
					  <section>
					 	 <h1 style="margin:2rem;margin-left:10rem;">�����ο�ss</h1>
					    <ul class="style-2" id="barChartData">
					    </ul>
					  </section>
			</div>
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
	Device[] dev = DFunc.searchDevice(null,null,null,null,null);
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
			<div class="bottom" style="float:right">
				<a href="#" title="Enroll" onclick="statusBar()"class="button yellow" ><span style="margin-left: 0px;"><img src="/TrustWinPro/action/image/interface/soket_logo.png" style="height:20px; width:17.5px"></span>submit</a>
			</div>
		</div>
	</form>
</div>



<script type="text/javascript">

$( document ).ready(function() {
	document.getElementById("chart_div_S").style.display = "none";	
	var exampleBarChartData = {
		    "datasets": {
		        "values": [5, 10, 30, 50, 20],
		        "labels": [
		            "Apples", 
		            "Oranges", 
		            "Berries", 
		            "Peaches", 
		            "Bananas"
		        ], "color": "blue"
		    },
		    "title": "Example Bar Chart",
		    "height": "300px",
		    "width": "500px",
		    "background": "#FFFFFF",
		    "shadowDepth": "1"
		};

		MaterialCharts.bar("#bar-chart-example", exampleBarChartData)      
}); 

function drawBarchart()
{
     var data = null;
     var table_data = null;
     $.ajax({
         url:'/TrustWinPro/action/ajax/barChartProc.jsp',
         data: 'idx=',
         cache: false,
         success: function(res) {
        	table_data = eval("(" + res + ")");
        	
			for(var i = 1; i < table_data.length; i++)	
				$( "#barChartData" ).append( "<li><em>"+table_data[i][0]+"</em><span>"+table_data[i][1]+"</span></li>" );

			setBarWidth(".style-2 span", ".style-2 span", "padding-right", 50);
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
         cache: false,
         success: function(res) {
      	  /* alert("StatusBar : " +val); */
      	  location.reload();
        	  document.getElementById("barChart").submit();
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
function setBarWidth(dataElement, barElement, cssProperty, barPercent) {
	  var listData = [];
	  $(dataElement).each(function() {
	    listData.push($(this).html());
	  });
	  var listMax = Math.max.apply(Math, listData);
	  $(barElement).each(function(index) {
	    $(this).css(cssProperty, (listData[index] / listMax) * barPercent + "%");
	  });
	}


</script>