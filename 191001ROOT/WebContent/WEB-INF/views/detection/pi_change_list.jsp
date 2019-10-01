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
				<p class="location">���� ���� > ���� ���� > ����� ���� ����Ʈ</p>
			</div>
			<div class="grid_top">
				<h3>����� ���� ����Ʈ </h3>
                <div class="list_sch">
                    <div class="radio_area">
                        <input type="radio" name="rdo_requestStatus" id="rdo001" value="R" checked="checked"><label for="rdo001">��û</label>
                        <input type="radio" name="rdo_requestStatus" id="rdo002" value="C"><label for="rdo002">����</label>
                        <button type="button" name="button" class="btn_new" id="btnSearch">Search</button>
                        <button type="button" name="button" class="btn_new" id="btnApprove">����</button>
                    </div>
                </div>
                <table class="user_info">
                    <caption>���������</caption>
                    <tbody>
                        <tr>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">��������</td>
                            <td style="width:180px;">
                                <select id="selectList" name="selectList" style="width:160px;">
                                    <option value="/approval/pi_search_list">��Ž/��Ž ����Ʈ</option>
                                    <option value="/approval/pi_search_approval_list">��Ž/��Ž ���� ����Ʈ</option>
                                    <!-- <option value="/excepter/pi_exception_list">��� ���� ����Ʈ</option>
                                    <option value="/excepter/pi_exception_approval_list">��� ���� ���� ����Ʈ</option> -->
                                    <option value="/change/pi_change_list" selected> ����� ���� ����Ʈ</option>
                                </select>
                            </td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">����</td>
                            <td>
                                <select id="statusList" name="statusList" style="width:100px;">
                                    <option value="">��ü</option>
                                    <option value="E">���οϷ�</option>
                                    <option value="D">�ݷ�</option>
                                    <option value="W" selected>���δ��</option>
                                </select>
                            </td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">ȣ��Ʈ</td>
                            <td><input type="text" style="width: 100%;" size="10" id="schOwner" placeholder="ȣ��Ʈ���� �Է��ϼ���"></td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">�̸�</td>
                            <td><input type="text" style="width: 100%;" size="20" id="schFilename" placeholder="�������� �Է��ϼ���"></td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">����������</td>
                            <td style="width:300px;">
                                <input type="date" id="fromDate" style="text-align: center; width:127px" readonly="readonly" value="${fromDate}" >
                                <span style="width: 8%; margin-right: 3px;">~</span>
                                <input type="date" id="toDate" style="text-align: center; width:127px" readonly="readonly" value="${toDate}" >
                            </td>
                        </tr>
                    </tbody>
                </table>
			</div>
			<div class="left_box2" style="overflow: hidden; max-height: 732px;height: 700px;">
  					<table id="changeGrid"></table>
  					<div id="changeGridPager"></div>
			</div>
		</div>
	</div>
	<!-- container -->
	
<!-- �˾�â ���� ���� ��û Ȯ�� -->
<div id="approvePopup" class="popup_layer" style="display:none">
	<div class="popup_box" style="height: 510px;">
		<div class="popup_top">
			<h1 id="">���� ��û Ȯ��</h1>
		</div>
		<div class="popup_content">
			<div class="content-box" style="height: 390px;">
				<!-- <h2>���λ���</h2>  -->
				<table class="popup_tbl">
					<colgroup>
						<col width="130">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th style="background-color: #f1f1f1;">����</th>
								<td>
								<input type="radio" name="trueFalseChk" id="permit" value="E" class="edt_sch" style=" border: 0px solid #cdcdcd;">����
								<input type="radio" name="trueFalseChk" id="reject" value="D" class="edt_sch" style="margin-left:120px; border: 0px solid #cdcdcd;">�ݷ�
								<input type="hidden" id="user_no" value="${memberInfo.USER_NO}">
							</td>  
						</tr>
						<tr>
							<th style="background-color: #f1f1f1;">����</th>
						    <td style="padding:10px;">
								<textarea id="reason" class="edt_sch" style="border: 0px solid #cdcdcd; width: 100%; height: 280px; resize: none;"></textarea>
							</td>  
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="popup_btn">
			<div class="btn_area">
				<button type="button" id="btnSave">����</button>
				<button type="button" id="btnCancel">���</button>
			</div>
		</div>
	</div>
</div>
<!-- �˾�â ����  -->

</section>
<!-- section -->
<%@ include file="../../include/footer2.jsp"%>
<script>

$(document).ready(function () {

    // ��¥ ����
    setSelectDate();

    $("#selectList").change(function () {
		var selected = $("#selectList").val();
		location.href=$("#selectList").val();
		selected.prop("selected","selected");
	});

    // ��ȸ���� ����� inputbox Keydown Event (����� ��ȸ)
    $("#schOwner, #schFilename").keydown(function(e) {
        if(e.keyCode == 13) 
            fn_search();
    });

    // �˻�
    $("#statusList").change(function() {
        fn_search();
    });

    // �˻�
    $("#btnSearch").click(function() {
        fn_search();
    });

	var status = $('input[name="rdo_status"]:checked').val();
	var reqStatus = $('input[name="rdo_requestStatus"]:checked').val();

	if (reqStatus == "R"){
		$("#btnApprove").hide();
	} else {
		$("#btnApprove").show();
	}

	$("input:radio[name=rdo_requestStatus]").click(function() {

		var chgVal = $(this).val();

		if (chgVal == "R"){
			$("#btnApprove").hide();
		} 
		else {
			$("#btnApprove").show();
		}

		fn_search();
	});
	
	// ���� ��ư
	$("#btnApprove").click(function(e) {

		var bChange = false;
		var aChangeList = [];
		var selRows = $("#changeGrid").jqGrid('getGridParam', 'selarrrow');      //üũ�� row id���� �迭�� ��ȯ
		var status;

		for (var i = 0; i < selRows.length; i++)
		{
			aChangeList.push($("#changeGrid").jqGrid('getCell', selRows[i], 'CHARGE_ID'));
			status = $("#changeGrid").jqGrid('getCell', selRows[i], 'APPROVAL_STATUS');

		    if (status == "D" || status == "E") {
		    	bChange = true;
			}
	   	}        

		if (bChange) {
	    	alert("�̹� ó���� �׸��Դϴ�.");
	    	return;
	    }

	    if (aChangeList.length == 0) {
		    alert("�����û �׸��� �����ϼ���.");
		    return;
		}

		$("#approvePopup").show();
	});

	$("#reject").on("click", function(e) {
		$('input:radio[name=trueFalseChk]').val("D");
	});

	$("#permit").on("click", function(e) {
		$('input:radio[name=trueFalseChk]').val("E");
	});

	// ���� ��û - ���
	$("#btnCancel").on("click", function(e) {
		$("#reason").val('');
		$("#approvePopup").hide();
	});

	// ���� ��û - ����
	$("#btnSave").click(function(e) {

		var aIdxList = [];
		var aTargetList = [];
		var aHashIdList = [];
		var aRowId = jQuery("#changeGrid").jqGrid('getGridParam', 'selarrrow');      //üũ�� row id���� �迭�� ��ȯ

		for (var i = 0; i < aRowId.length; i++)
		{
			aIdxList.push($("#changeGrid").jqGrid('getCell', aRowId[i], 'IDX'));
			aTargetList.push($("#changeGrid").jqGrid('getCell', aRowId[i], 'TARGET_ID'));
			aHashIdList.push($("#changeGrid").jqGrid('getCell', aRowId[i], 'HASH_ID'));
	   	}

		var reason = $("#reason").val();
	    var apprType = $('input:radio[name=trueFalseChk]').val();

	    if (! apprType){
	    	alert("���縦 �����ϼ���");
	    }

	    var ok_user_no = $("#user_no").val();
		var oPostDt = {};
		oPostDt["idxList"]     = aIdxList;
		oPostDt["targetList"]  = aTargetList;
		oPostDt["hashIdList"]  = aHashIdList;
		oPostDt["apprType"]    = apprType
		oPostDt["reason"]      = reason;

		var oJson = JSON.stringify(oPostDt);

		$.ajax({
			type: "POST",
			url: "${getContextPath}/change/updateChangeApproval",
			async : false,
			data : oJson,
			contentType: "application/json; charset=UTF-8",
		    success: function (result) {

			    if (result.resultCode != "0") {
			    	alert(result.resultCode + "ó�� ����� ���� �Ͽ����ϴ�.");
			    	return;
				}

			    alert("ó���� ��� �Ͽ����ϴ�.");

			    $("#changeGrid").setGridParam({
			    	url:"${getContextPath}/change/selectChangeList",
			    	postData: $("#changeGrid").getGridParam('postData'),
			    	datatype:"json"
		    	}).trigger("reloadGrid");

				$("#deletionRegistPopup").hide();
				$("input:radio[name=trueFalseChk]").prop("checked",false);
				$('input:radio[name=trueFalseChk]').val("");
				
				return;
		    },
		    error: function (request, status, error) {
		    	alert("ó�� ����� ���� �Ͽ����ϴ�.");
		        console.log("ERROR : ", error);
				$("input:radio[name=trueFalseChk]").prop("checked",false);
				$('input:radio[name=trueFalseChk]').val("");
		        return;
		    }
		});

		$("#reason").val('');
		$("#approvePopup").hide();
	});
	
	loadJqGrid($("#changeGrid"));
});

function loadJqGrid(oGrid)
{
    // ����� ���� ����Ʈ
    var oPostDt = {};
    oPostDt["status"] = $("select[name='statusList']").val();
    oPostDt["request_status"]  = $('input[name="rdo_requestStatus"]:checked').val();
    oPostDt["owner"]    = $("#schOwner").val();
    oPostDt["filename"] = $("#schFilename").val();
    oPostDt["fromDate"] = $("#fromDate").val();
    oPostDt["toDate"]   = $("#toDate").val();

    oGrid.jqGrid({
        url: "${getContextPath}/change/selectChangeList",
        postData: oPostDt,
        datatype: "json",
        mtype: "POST",
        async: true,
        contentType: "application/json; charset=UTF-8",
        colNames:['','ȣ��Ʈ','�̸�','�����','������','��û��','������','����','���','�ݷ� ����',"TARGET_ID","HASH_ID"],
        colModel: [
            { index: 'IDX',             name: 'IDX',                width: 30,  align: 'center', hidden:true},
            { index: 'HOST',            name: 'HOST',               width: 100, align: 'center'},
            { index: 'PATH',            name: 'PATH',               width: 200, align: 'left'},
            { index: 'REG_USER_NAME',   name: 'REG_USER_NAME',      width: 50, align: 'center'},
            { index: 'OK_USER_NAME',    name: 'OK_USER_NAME',       width: 50, align: 'center'},
            { index: 'REGDATE',         name: 'REGDATE',            width: 80, align: 'center'},   
            { index: 'OKDATE',          name: 'OKDATE',             width: 80, align: 'center'},   
            { index: 'APPROVAL_STATUS', name: 'APPROVAL_STATUS',    width: 50, align: 'center', formatter:'select', editoptions:{value:{'E':'���οϷ�','D':'�ݷ�','W':'���δ��'}}},
            { index: 'REASON',          name: 'REASON',             width: 100, align: 'left'},
            { index: 'RETURN_REASON',   name: 'RETURN_REASON',      width: 100, align: 'left', hidden:true},
            { index: 'TARGET_ID',       name: 'TARGET_ID',          width: 100, align: 'left', hidden:true},
            { index: 'HASH_ID',         name: 'HASH_ID',            width: 100, align: 'left', hidden:true}
            ],
        loadonce :true,
        viewrecords: true, // show the current page, data rang and total records on the toolbar
        width: oGrid.parent().width(),
        height: 600,
        multiselect : true,
        autowidth: true,
        shrinkToFit: true,
        rownumbers : false, // ���ȣ ǥ�ÿ���
        rownumWidth : 75, // ���ȣ ���� �ʺ�  
        rowNum:25,
        rowList:[25,50,100],    
        pager: "#changeGridPager",
        onCellSelect: function(rowid,icol,cellcontent,e) {
        },
//         loadComplete: function(data) {

//             // ������ �ε� �Ϸ� �� �̺�Ʈ
//             var idArry = oGrid.jqGrid('getDataIDs');            // grid�� id ���� �迭�� ������

//             for (var i = 0; i < idArry.length; i += 1){
//                 var ret =  oGrid.getRowData(idArry[i]);         // �ش� id�� row �����͸� ������

//                 // �ش� row�� Ư�� �÷� ���� 1�� �ƴϸ� multiselect checkbox disabled ó��
//                 if (ret.APPROVAL_STATUS != ''){ 
//                    // �ش� row�� checkbox disabled ó�� "jqg_list_" �� �κ��� grid���� �ڵ� ����
//                    $("#jqg_changeGrid_"+idArry[i]).attr("disabled", true);
//                    $("#jqg_changeGrid_"+idArry[i]).prop('checked', false);
//                 }
//             }
//         },
//         beforeSelectRow: function(rowid, e) {  
//             var cbsdis = $("tr#"+rowid+".jqgrow > td > input.cbox:disabled", oGrid[0]);
//             if (cbsdis.length === 0) {  
//                 return true;    // allow select the row   
//             } else {
//                 return false;   // not allow select the row 
//             }
//         },   
//         onSelectAll: function(aRowids, status) {
//             if (status) {
//                 var cbs = $("tr.jqgrow > td > input.cbox:disabled", oGrid[0]);
//                 cbs.parent().parent().removeAttr("aria-selected");
// //                cbs.parent().parent().removeAttr("checked");
//                 cbs.parent().parent().attr("class", "jqgrow ui-row-ltr ui-widget-content");
// //                cbs.removeAttr("checked");
//                 cbs.prop('checked', false);
//             }
//         }
    });
}

//���� �����
function setSelectDate() 
{
	$("#fromDate").datepicker({
	    changeYear : true,
	    changeMonth : true,
	    dateFormat: 'yy-mm-dd'
	});
	
	$("#toDate").datepicker({
	    changeYear : true,
	    changeMonth : true,
	    dateFormat: 'yy-mm-dd'
	});
	
	var oToday = new Date();
	$("#toDate").val(getFormatDate(oToday));
	
	var oFromDate = new Date(oToday.setDate(oToday.getDate() - 30));
	$("#fromDate").val(getFormatDate(oFromDate));
}

//�˻�
function fn_search(obj) 
{
    // ��Ž/��Ž ����Ʈ �׸���
    var oPostDt = {};
    oPostDt["status"] = $("select[name='statusList']").val();
    oPostDt["request_status"]  = $('input[name="rdo_requestStatus"]:checked').val();
    oPostDt["owner"]    = $("#schOwner").val();
    oPostDt["filename"] = $("#schFilename").val();
    oPostDt["fromDate"] = $("#fromDate").val();
    oPostDt["toDate"]   = $("#toDate").val();

    $("#changeGrid").clearGridData();
    $("#changeGrid").setGridParam({
        url: "${getContextPath}/change/selectChangeList",
        postData: oPostDt, 
        datatype: "json"
    }).trigger("reloadGrid");
}

//
function getFormatDate(oDate)
{
    var nYear = oDate.getFullYear();           // yyyy 
    var nMonth = (1 + oDate.getMonth());       // M 
    nMonth = ('0' + nMonth).slice(-2);         // month ���ڸ��� ���� 

    var nDay = oDate.getDate();                // d 
    nDay = ('0' + nDay).slice(-2);             // day ���ڸ��� ����

    return nYear + '-' + nMonth + '-' + nDay;
}
</script>
</body>
</html>