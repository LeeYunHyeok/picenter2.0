<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/header.jsp"%>

<!-- section -->
<section>
	<!-- container -->
	<div class="container">
	<%@ include file="../../include/menu.jsp"%>
		<!-- content -->
		<div class="content magin_t45">
			<div class="location_area">
				<p class="location">����Ʈ���� > ��ü���� ����Ʈ</p>
			</div>
			<!-- <div class="left_area2">
				<h3>���� ����Ʈ</h3>
				<div class="left_box2"
					style="overflow: hidden; max-height: 732px; height: 732px;">
					<div class="search_area bold">
						<input type="text" id="txt_host" value="" style="width: 300px"
							placeholder="ȣ��Ʈ �̸��� �Է��ϼ���.">
						<button type="button" id="btn_search" style="right: 5px;">�˻�</button>
					</div>
					<table id="targetGrid"></table>
					<div id="targetGridPager"></div>
				</div>
			</div>
 -->
			<div class="grid_top">
				<h3>����Ʈ ����ȭ�� - �����ͺ� �׸�� ������ ���̺��� �÷� �����ؾ���</h3>

				<div class="list_sch">
					<div class="sch_area">
						<button type="button" name="button" class="btn_new" id="btnDownloadExel">�ٿ�ε�</button>
					</div>
				</div>
			</div>
			<div class="left_box2" style="overflow: hidden; max-height: 732px; height: 732px;">
				<table id="targetGrid"></table>
				<div id="targetGridPager"></div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../../include/footer.jsp"%>

<script type="text/javascript">
// var postData = {target_id : $("#hostSelect").val()};
// var gridWidth = $("#targetGrid").parent().width();

$("#targetGrid").jqGrid({
	url: "<%=request.getContextPath()%>/report/reportdata",
	datatype: "json",
   	mtype : "POST",
   	contentType:"application/x-www-form-urlencoded; charset=utf-8",
   	ajaxGridOptions : {
		type    : "POST",
		async   : true
	},
	colNames:['ȣ��Ʈ �̸�', '������', '�ֹι�ȣ','�ܱ��ι�ȣ','���ǹ�ȣ','������ȣ','�հ�'],
	colModel: [		
		{ index: 'name',		name: 'name',		width: 200, align: 'center'},
		{ index: 'regdate',		name: 'regdate',		width: 200, align: 'center'},
		{ index: 'data_type',		name: 'data_type', 		width: 70, align: 'right', formatter:'integer', formatoptions:{thousandsSeparator: ",", defaultValue: '0'}},
		{ index: 'data_type',		name: 'data_type', 		width: 70, align: 'right', formatter:'integer', formatoptions:{thousandsSeparator: ",", defaultValue: '0'}},
		{ index: 'data_type',		name: 'data_type', 		width: 70, align: 'right', formatter:'integer', formatoptions:{thousandsSeparator: ",", defaultValue: '0'}},
		{ index: 'data_type',		name: 'data_type', 		width: 70, align: 'right', formatter:'integer', formatoptions:{thousandsSeparator: ",", defaultValue: '0'}},
		{ index: 'data_type',		name: 'data_type', 		width: 100, align: 'right', formatter:'integer', formatoptions:{thousandsSeparator: ",", defaultValue: '0'}},
	],
	loadonce :true,
	viewrecords: false, // show the current page, data rang and total records on the toolbar
	width: 600,
	height: 600,
	loadonce: true, // this is just for the demo
   	autowidth: true,
	shrinkToFit: true,
	pager: "#targetGridPager",
	rownumbers : true, // ���ȣ ǥ�ÿ���
	rownumWidth : 40, // ���ȣ ���� �ʺ�	
	rowNum:14,
	jsonReader : {
		id : "ID"
	}
});
	
	$("#btnDownloadExel").on("click", function(){
		$("#targetGrid").jqGrid("exportToCsv",{
			separator: ",",
			separatorReplace : "", // in order to interpret numbers
			quote : '"', 
			escquote : '"', 
			newLine : "\r\n", // navigator.userAgent.match(/Windows/) ?	'\r\n' : '\n';
			replaceNewLine : " ",
			includeCaption : true,
			includeLabels : true,
			includeGroupHeader : true,
			includeFooter: true,
			fileName : "jqGridExportTest.csv",
			mimetype : "text/csv; charset=utf-8",
			returnAsString : false
		})
	});
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 

	today = yyyy+mm+dd;

	function downLoadExcel()
	{
	    oGrid.jqGrid("exportToCsv",{
	        separator: ",",
	        separatorReplace : "", // in order to interpret numbers
	        quote : '"', 
	        escquote : '"', 
	        newLine : "\r\n", // navigator.userAgent.match(/Windows/) ? '\r\n' : '\n';
	        replaceNewLine : " ",
	        includeCaption : true,
	        includeLabels : true,
	        includeGroupHeader : true,
	        includeFooter: true,
	        fileName : "����_��Ž����_����Ʈ_" + today + ".csv",
	        mimetype : "text/csv; charset=utf-8",
	        returnAsString : false
	    })
	}
</script>

</body>
</html>
