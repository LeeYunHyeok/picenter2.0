<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">
<title> NH농협은행 서버 내 개인정보 검색 시스템</title>
<!-- <title> NH농협중앙회 서버 내 개인정보 검색 시스템</title> -->

<link href="${pageContext.request.contextPath}/resources/assets/css/ui.fancytree.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<!-- Publish JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.3.1.js"></script>
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui.js" type="text/javascript"></script>

<!--[if lte IE 8]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/ie-8.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/ie-8.css" />
<![endif]-->

<!--[if lte IE 9]>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/ie-9.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/ie-9.css" />
<![endif]-->

<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/assets/tree/jquery.fancytree.ui-deps.js"></script>
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/assets/tree/jquery.fancytree.js"></script>

<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/assets/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/assets/jqgrid/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/wickedpicker.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/assets/css/wickedpicker.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/assets/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/assets/css/ui.jqgrid.css" />

<!-- Application Common Functions  -->
<script type="text/ecmascript" src="${pageContext.request.contextPath}/resources/assets/js/common.js"></script>

<!-- Publish CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/design.css" />

</head>

<script type="text/javascript">

$(document).ready(function () {
	
	var list = $(".gnb_menu li a");
	list.each(function(i, element) {
		$(element).removeClass("on")
	});

	if ("#${menuKey}".length != 1) {
		$("#${menuKey}").addClass('on');
		$("#${menuKey}").removeAttr("href")
	};	
	
	$("#btnLogout").on("click", function(e) {
		
		var postData = {};
		$.ajax({
			type: "POST",
			url: "/logout",
			async : false,
			data : postData,
		    success: function (resultMap) {
		    	window.location = "${pageContext.request.contextPath}/";
		    },
		    error: function (request, status, error) {
				alert("ERROR : " + error);
		        console.log("ERROR : ", error);
		    }
		});
	});

});

</script>

<body>
<!-- wrap -->
<div class="wrap">

	<!-- header -->
	<header id="header">
		<!-- container -->
		<div class="container_header">
			<!-- logo -->
			<div class="img_logo">
				<a href="<%=request.getContextPath()%>/detection/pi_detection_regist" title="detection"><h1>NH농협은행 서버 내 개인정보 검색 시스템</h1></a>
				<!-- <a href="<%=request.getContextPath()%>/piboard" title="detection"><h1> NH농협중앙회 서버 내 개인정보 검색 시스템</h1></a> -->
			</div>
			<!-- logo -->

			<!-- nav -->
			<nav id="nav">
				<!-- gnb -->
				<h2 class="ir">업무메뉴</h2>
				<ul class="gnb_menu clear">
					<!-- <li><a
						href="<%=request.getContextPath()%>/detection/pi_detection_regist" id="detectionMenu" title="검출 리스트">검출 리스트</a></li>
			<li><a href="<%=request.getContextPath()%>/detection/pi_search_list" id="targetMenu" title="결재 관리">결재 관리</a></li>
			    <li><a href="<%=request.getContextPath()%>/detection/pi_server_list" id="exceptionMenu" title="서버리스트">서버리스트</a></li>
			    <li><a href="<%=request.getContextPath()%>/user/pi_user_main" id="userMenu" title="사용자 관리">사용자 관리</a></li> -->
				</ul>
			</nav>
			<!-- nav -->
			
			<div class="user">
				${memberInfo.TEAM_NAME} <em>${memberInfo.USER_NAME} </em>${memberInfo.JIKGUK} 
				<img class="logOutImg" src="../../resources/assets/images/lock.png">
			</div>
		</div>

		<!-- container -->
	</header>
	<!-- header -->