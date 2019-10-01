<%@page language="java"%>
<%@page contentType="text/html;charset=EUC-KR"%>
<%@page import="com.initech.cryptox.util.Base64Util"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.initech.eom.nLs.Ticket"%>
<%@page import="com.initech.eom.nLs.CookieManager"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="com.initech.eom.nLs.NLSHelper"%>
<%@ include file="cutCarriageReturn.jsp" %>


<%
		/*
		#noCacheNonce : ���Ͻÿ����� ������ �����ϱ� ���� Cookie�� RequestParameter�� �̵���
		1) LoginFormPage�� resession.jsp���� �����ϰ�, �� ���� �������� RequestParameter�� �Ѱ��ش�.
			-> NLS���� Page�̵��� �׻� �ѱ�� �޵��� �Ѵ�. 
		2) LoginFormPage�� resession.jsp���� �� �̸��� Cookie�� �������ֵ��� �Ѵ�.
		*/
		
		// -- resession.nonce 
		SecureRandom random = new SecureRandom();
		byte[] nonce = new byte[8];
		random.nextBytes(nonce);
	
		String nonceStr = cutCarriageReturn(new String(Base64Util.encode(nonce)));
		session.setAttribute("nexess.nls.resession.nonce", nonceStr);
%>

<!-- [if IE], [endif] ���� �±׿� �پ��ִ� '!--'�� �ּ��� �ƴϴ� �������� �� ��. -->
<!-- ��Ƽ������ �߰� �ڵ� by minho -->

<!-- IE �� ���� �� �ڵ� ���� -->
<!--[if IE]>
		<OBJECT IO="NEXESS_API" CLASSID="CLSID:D4F52B57-88A3-4A8O-94F6-777A015D8512" width=0 height=0></OBJECT>
<![endif]-->

<!-- IE�� �ƴ϶� Firefox, Chrome��� �� ���� �� �ڵ� ����
<![if IE]>
		<embed id="NEXESS_API" type="application/initech/npNexessClient, version=2,6,1,1" whdth=0 height=0 ><br>
<![endif]-->

<![if !IE]>
<script language="javascript">
	if(navigator.userAgent.indexOf('MSIE 10') == -1 && navigator.userAgent.indexOf("Trident") == -1) {
	//alert("������� IE�� IE10,11 �� �ƴ�");
	document.write("<embed id=\"NEXESS_API\" type=\"application/initech/npNexessClient,version=2,6,1,1\" width=0 height=0 ><br>");
	}else{
	//alert("������� IE�� 10 OR 11��");
	document.write("<OBJECT ID=\"NEXESS_API\" CLASSID=\"CLSID:D4F62B67-8BA3-4A8D-94F6-777A015DB612\" width=0 height=0 ></OBJECT>");
	}
</script>
<![endif]>

<script language=javascript>
	
		alert("Vni ck");
		console.log("Eni ck");
		
		var ticket = NEXESS_API.GetTicket("<%=nonceStr%>")
		var ssoid = NEXESS_API.GetLoginID();
		alert(ssoid);
		
		if (ticket.length == 1 || ticket == ""){
			alert("�α��� �Ǿ����� ���� �α��� �������� �̵��ʿ�")
			// self.location.replace("${pageContext.request.contextPath}")
			
		} else {
			while(ticket.indexOf("+") != -1 ){
				ticket = ticket.replace("+", "%2b");
			}
			// alert(ticket);
			self.location.replace("./NCLoginTestEncVerifyTicket.jsp?ticket=" + escape(ticket));
		}

</script>