<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<div id="top">
	<div class="Logo">
		<a href="/TrustWinPro/action/index.jsp"><img src="/TrustWinPro/action/image/interface/Logo.png" alt="Logo" ></a>
	</div>
	<div class="main_top">
		<div class="top_right">
		<!-- onclick="location.href='/TrustWinPro/action/index.jsp?left=Device&content=AllDevice'" -->
			<!-- <a href="#a" onclick="location.href='/TrustWinPro/action/index.jsp?content=Setting'">Setting</a>  -->
			<a href="#a" onclick="submit('Setting')">Setting</a> | <a href="#a" onclick="submit('Language')">Language</a> | <a href="Logout.jsp">Logout</a>
		</div>
	</div>
</div>
<form action="/TrustWinPro/action/index.jsp" name="Setting" id="Setting" method="post">
	<input type="hidden" value="Setting" name="left" />
	<input type="hidden" value="Setting" name="content" />
</form>
<form action="/TrustWinPro/action/index.jsp" name="Language" id="Language" method="post">
	<input type="hidden" value="" name="left" />
	<input type="hidden" value="Language" name="content" />
</form>
<form action="/TrustWinPro/action/index.jsp" name="Update" id="Update" method="post">
	<input type="hidden" value="" name="left" />
	<input type="hidden" value="Update" name="content" />
</form>