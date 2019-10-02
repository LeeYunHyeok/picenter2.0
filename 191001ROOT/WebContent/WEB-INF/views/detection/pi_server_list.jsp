<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/header2.jsp"%>

<!-- ������� -->


<!-- section -->
<section>
	<!-- container -->
	<div class="container">
	<%@ include file="../../include/menu2.jsp"%>

		<!-- content -->
		<div class="content magin_t45">
			<div class="location_area">
				<p class="location">���� ���� > ���� ����Ʈ</p>
			</div>
			<div class="left_area2">
				<h3><i class="fas fa-upload"></i>���� ����Ʈ</h3>
				<div class="left_box2" style="overflow: hidden; max-height: 580px; height: 580px;">
					<div class="search_area bold">
						<input type="text" id="txt_host" value="" style="width: 300px" placeholder="ȣ��Ʈ �̸��� �Է��ϼ���.">
						<button type="button" id="btn_search" style="right: 5px;">�˻�</button>
					</div>
   					<table id="targetGrid"></table>
   					<div id="targetGridPager"></div>
				</div>
				<table class="user_info magin_t1">
					<colgroup>
						<col width="65%">
						<col width="35%">
					</colgroup>
					<tr>
						<th style="color:#fff;">�� ���� ����</th>
						<td class="ta_r" id="hostCnt">0��</td>
					</tr>
					<tr> 
						<th style="color:#fff;">���� �ȵ� ���� ����</th>
						<td class="ta_r" id="notLinkHostCnt">0��</td>
					</tr>				
				</table>
			</div>

			<div class="grid_top" style="margin-left: 350px; height: 100%;">
				<h3>���� �� �� TOP N</h3>
<!-- 			<div class="sch_left" style=" position: absolute; right: 11px; top: 0; width: 300px;">
					�˻� : <input type="text" id="txt_host" value="" class="edt_sch" style="width: 263px;">
					<button id="btn_search" class="btn_sch">�˻�</button>
				</div>-->
				<div class="left_box2" style="height: 732px; max-height: 732px; overflow: hidden;">
   					<table id="topNGrid"></table>
   					<div id="topNGridPager"></div>
   				</div>
			</div>
		</div>
	</div>
	<!-- container -->
</section>
<!-- section -->

<%@ include file="../../include/footer2.jsp"%>
	
<script>
function ifConnect (cellvalue, options, rowObject) {
	switch (rowObject["AGENT_CONNECTED"]) {
	case '1':
		return '<img src="<%=request.getContextPath()%>/resources/assets/images/icon_con.png" />';
		break;
	case '0':
		return '<img src="<%=request.getContextPath()%>/resources/assets/images/icon_dicon.png" />';
	    break;
    default :
    	return '<img src="<%=request.getContextPath()%>/resources/assets/images/icon_dicon.png" />';
    break;
    }
}
	
$(document).ready(function () {
	
	fn_drawTargetGrid();
	//var gridWidth = $("#targetGrid").parent().width();
	//var gridHeight = $("#targetGrid").parent().height();
	var postData = {};
	$("#targetGrid").setGridParam({url:"<%=request.getContextPath()%>/target/selectUserTargetList", postData : postData, datatype:"json" }).trigger("reloadGrid");

	// �˻�â�� �Է��ϴ´�� �˻��Ϸ��� �̰� �����(keyup)
/*	$('#txt_host').keyup(function() {
		fn_search();
	});
*/	
	$('#btn_search').click(function() {
		fn_search();
	});


});

function fn_drawTargetGrid() {
	var gridWidth = 300;
	var gridHeight = 440;

	$("#targetGrid").jqGrid({
		//url: 'data.json',
		datatype: "local",
	   	mtype : "POST",
	   	ajaxGridOptions : {
			type    : "POST",
			async   : true
		},
		colNames:['ȣ��Ʈ �̸�','�������', '�������', 'TARGET_ID'
		],
		colModel: [      
			{ index: 'AGENT_NAME', 			name: 'AGENT_NAME', 		width: 210 },
			{ index: 'AGENT_CONNECTED1', 	name: 'AGENT_CONNECTED1',	width: 65, align: 'center', formatter:ifConnect},
			{ index: 'AGENT_CONNECTED', 	name: 'AGENT_CONNECTED',	width: 250, align: 'center', hidden:true},
			{ index: 'TARGET_ID', 			name: 'TARGET_ID', 			width: 500, hidden : true }
		],
		loadonce: true, // this is just for the demo
		viewrecords: true, // show the current page, data rang and total records on the toolbar
		width: gridWidth,
		height: gridHeight,
	   	autowidth: true,
		shrinkToFit: true,
		rownumbers : false, // ���ȣ ǥ�ÿ���
		rownumWidth : 35, // ���ȣ ���� �ʺ�	
		rowNum:25,
	   	rowList:[25,50,100],			
		pager: "#targetGridPager",
		//jqgrid�� Ư���� - rowpos�� �̺�Ʈ�� onSelectCell, beforeEditCell �� ���־�� ��
	  	onSelectRow : function(rowid,celname,value,iRow,iCol) {

	  		var postData = {target : $(this).jqGrid('getCell', rowid, 'TARGET_ID')};
	  		$("#topNGrid").setGridParam({url:"<%=request.getContextPath()%>/target/selectServerFileTopN", postData : postData, datatype:"json" }).trigger("reloadGrid");
	  		
	  	},
		loadComplete: function(data) {

			if (data.records == 0) {
				fn_drawTopNGrid(); 
				return;
			}
			
			$(this).setSelection(1);
			var rowCount = 0;
			var notLinkRowCount = 0;
			
			var userData = $("#targetGrid").jqGrid('getGridParam', 'data');
    		$.each(userData, function(idx, rowId) {
    			rowCount++;
    			rowData = userData[idx];
    			
        		if (rowData.AGENT_CONNECTED != '1') {
        			notLinkRowCount++;
        		}
    		});

			$("#hostCnt").html(rowCount + "��");
			$("#notLinkHostCnt").html(notLinkRowCount + "��");
			
			var postData = {target : $(this).jqGrid('getCell', 1, 'TARGET_ID')};
	  		$("#topNGrid").setGridParam({url:"<%=request.getContextPath()%>/target/selectServerFileTopN", postData : postData, datatype:"json" }).trigger("reloadGrid");
	  		
	    },
	    gridComplete : function() {
	    }
	});
	
	$("#targetGridPager_left").css("display", "none");
	$("#targetGridPager_right").css("display", "none");
}

function fn_drawTopNGrid() {
	
	var gridWidth = $("#topNGrid").parent().width();
	var gridHeight = 632;
	$("#topNGrid").jqGrid({
		//url: "<%=request.getContextPath()%>/target/selectServerFileTopN",
		datatype: "local",
	   	mtype : "POST",
		colNames:['���','������','���� ����'],
		colModel: [
			{ index: 'PATH', 	name: 'PATH', 	editable: true, width: 500 },
			{ index: 'OWNER', 	name: 'OWNER', 	width: 150, align: "center" },
			{ index: 'CNT', 	name: 'CNT', 	width: 150, align: "right" },
		],
		loadonce:false,
	   	autowidth: true,
		shrinkToFit: true,
		viewrecords: true, // show the current page, data rang and total records on the toolbar
		width: gridWidth,
		height: gridHeight,
		rownumbers : false, // ���ȣ ǥ�ÿ���
		rownumWidth : 35, // ���ȣ ���� �ʺ�	
		rowNum:25,
	   	rowList:[25,50,100],
	   	//editurl: 'clientArray',
	   	//cellEdit : true,
	   	//cellsubmit: 'clientArray',
	   	//multiselect:true,
		pager: "#topNGridPager",
		//jqgrid�� Ư���� - rowpos�� �̺�Ʈ�� onSelectCell, beforeEditCell �� ���־�� ��
	  	onSelectRow : function(rowid,celname,value,iRow,iCol) {	
	  		
	  	},
	  	afterSaveCell : function(rowid,name,val,iRow,ICol){ // �ο� ������ �����ϰ� ����ġ�ų� �ٸ� �� Ŭ�������� �ߵ�
	    },
	  	afterSaveRow : function(rowid,name,val,iRow,ICol){ // �ο� ������ �����ϰ� ����ġ�ų� �ٸ� �� Ŭ�������� �ߵ�
	    },
		loadComplete: function(data) {
			//console.log(data);
	    },
	    gridComplete : function() {
	    }
	});
}

function fn_search() {
	var postData = {host : $("#txt_host").val()};
	
	$("#targetGrid").setGridParam({url:"<%=request.getContextPath()%>/target/selectUserTargetList", postData : postData, datatype:"json" }).trigger("reloadGrid");
	console.log(postData);
}

</script>
</body>
</html>