<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../../resources/assets/css/font-awesome.min.css"/>

				<h2 class="ir">왼쪽메뉴</h2>
				<div class="lnb">
					<div class="magin_t45">
			<c:if test="${menuItem == 'detectionRegist'}">
						<h3>검출 관리</h3>
						<!-- left menu-->
						<ul class="menu_list">
							<li>
								<h4 class="ir">검출 관리</h4>
								<ul>
									<li class="detectionList">
										<a href="javascript:void(0)" class="on">검출 리스트</a>
									</li>
									<li class="approvalListB">
										<a href="<%=request.getContextPath()%>/approval/pi_search_list">결재 관리</a>
									</li>
									<li class="serverListB">
										<a href="<%=request.getContextPath()%>/detection/pi_server_list">서버리스트</a>
									</li>
								</ul>
			</c:if>
			<c:if test="${menuItem == 'approvalList'}">
						<h3>검출 관리</h3>
						<!-- left menu-->
						<ul class="menu_list">
							<li>
								<h4 class="ir">검출 관리</h4>
								<ul>
									<li>
										<a href="<%=request.getContextPath()%>/detection/pi_detection_regist"><i class="fas fa-file-invoice-dollar"></i>&nbsp; 검출 리스트</a>
									</li>
									<li>
										<a href="javascript:void(0)" class="on"><i class="fas fa-clipboard-list"></i>&nbsp; 결재 관리</a>
									</li>
									<li>
										<a href="<%=request.getContextPath()%>/detection/pi_server_list"><i class="fas fa-upload"></i>&nbsp; 서버리스트</a>
									</li>
								</ul>
			</c:if>
			<c:if test="${menuItem == 'serverList'}">
						<h3>검출 관리</h3>
						<!-- left menu-->
						<ul class="menu_list">
							<li>
								<h4 class="ir">검출 관리</h4>
								<ul>
									<li>
										<a href="<%=request.getContextPath()%>/detection/pi_detection_regist"><i class="fas fa-file-invoice-dollar"></i>&nbsp; 검출 리스트</a>
									</li>
									<li>
										<a href="<%=request.getContextPath()%>/approval/pi_search_list"><i class="fas fa-clipboard-list"></i>&nbsp; 결재 관리</a>
									</li>
									<li>
										<a href="javascript:void(0)" class="on"><i class="fas fa-upload"></i>&nbsp; 서버리스트</a>
									</li>
								</ul>
			</c:if>
							</li>
						</ul>
					</div>
				</div>