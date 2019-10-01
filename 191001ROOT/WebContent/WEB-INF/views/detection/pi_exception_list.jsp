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
				<p class="location">���� ���� > ���� ���� > ��� ���� ����Ʈ</p>
			</div>
			<div class="grid_top">
				<h3>��� ���� ����Ʈ</h3>
                <div class="list_sch">
                    <div class="sch_area">
                        <button type="button" name="button" class="btn_new" id="btnSearch">Search</button>
                        <button type="button" name="button" class="btn_new" id="btnApprovalRequest">���� ��û</button>
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
                                    <option value="/excepter/pi_exception_list" selected>��� ���� ����Ʈ</option>
                                    <option value="/excepter/pi_exception_approval_list">��� ���� ���� ����Ʈ</option>
                                    <option value="/change/pi_change_list"> ����� ���� ����Ʈ</option>
                                </select>
                            </td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">����</td>
                            <td>
                                <select id="statusList" name="statusList" style="width:100px;">
                                    <option value="">��ü</option>
                                    <option value="E">���οϷ�</option>
                                    <option value="D">�ݷ�</option>
                                    <option value="W">���δ��</option>
                                    <option value="NR" selected>�̿�û</option>
                                </select>
                            </td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">ȣ��Ʈ</td>
                            <td><input type="text" style="width: 100%;" size="10" id="schOwner" placeholder="ȣ��Ʈ���� �Է��ϼ���"></td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">������</td>
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
				<table id="exceptionGrid"></table>
				<div id="exceptionGridPager"></div>
			</div>
		</div>
	</div>
	<!-- container -->

<!-- �˾�â ���� ��� ���� ��û ����-->
<div id="insertPathExcepPopup" class="popup_layer" style="display:none">
	<div class="popup_box" style="height: 510px;">
		<div class="popup_top">
			<h1 id="groupName"></h1>
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
							<th style="background-color: #f1f1f1;">�̸�</th>
							<td>
								<table style="border: 0px solid #cdcdcd; width: 380px; height: 240px; margin-top: 5px; margin-bottom: 5px; resize: none;" >
								<tbody>
									<tr id="excepPath">
									</tr>
								</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<th style="background-color: #f1f1f1;">����</th>
								<td><input type="text" name="trueFalseChk" id="trueFalseChk" value="" class="edt_sch" style=" border: 0px solid #cdcdcd;" readonly>
							</td>  
						</tr>
						<tr>
							<th style="background-color: #f1f1f1;">��ϼ���</th>
								<td><input type="text" name="regisServer" id="regisServer" value="" class="edt_sch" style=" border: 0px solid #cdcdcd;" readonly>
							</td>  
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="popup_btn">
			<div class="btn_area">
				<button type="button" id="btnCheck">Ȯ��</button>
			</div>
		</div>
	</div>
</div>
<!-- �˾�â ����  -->

<!-- �˾�â ���� : ��ο��� �����û -->
<div id="exceptionApprovalPopup" class="popup_layer" style="display:none">
	<div class="popup_box" style="height: 510px;">
		<div class="popup_top">
			<h1 id="approvalRegis">���� ���</h1>
		</div>
		<div class="popup_content">
			<div class="content-box" style="height: 390px;">
				<!-- <h2>���λ���</h2>  -->
				<table class="popup_tbl">
					<colgroup>
						<col width="130">
						<col width="*">
						<col width="130">
					</colgroup>
					<tbody>
						<tr>
							<th style="background-color: #f1f1f1;">��û��</th>
							<td colspan="2"><input type="text" id="reg_user_name" value="" class="edt_sch" style="border: 0px solid #cdcdcd;" readonly></td>
						</tr>
						<tr>
							<th style="background-color: #f1f1f1;">�����</th>
							<td>
								<input type="text" id="ok_user_name" value="" class="edt_sch" style="width:100%; border: 0px solid #cdcdcd;" readonly>
							</td>
							<td class="btn_area" style="padding: 0px 0px 0px 20px; text-align: left;">
								<button type="button" id="btnUserSelectPopup" style="margin-bottom: 0px; background: #1898D2; width: 100px;">����� ����</button>
								<input type="text" id="ok_user_no" value="" class="edt_sch" style="border: 0px solid #cdcdcd; display:none;">
							</td>
						</tr>
						<tr>
							<th style="background-color: #f1f1f1;">��û����</th>
							<td colspan="2"><input type="text" id="regdate" value="" class="edt_sch" style="border: 0px solid #cdcdcd;" readonly></td>
						</tr>
						<tr>
							<th style="background-color: #f1f1f1;">�ǰ�</th>
							<td colspan="2">
								<textarea id="reason" class="edt_sch" placeholder="" style="border: 0px solid #cdcdcd; width: 380px; height: 200px; margin-top: 5px; margin-bottom: 5px; resize: none;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="popup_btn">
			<div class="btn_area">
				<button type="button" id="btnApprovalSave" value="W">����</button>
				<button type="button" id="btnApprovalCancel">���</button>
			</div>
		</div>
	</div>
</div>
<!-- �˾�â ���� -->

<!-- �˾�â ���� ����� ���� -->
<div id="userSelect" class="popup_layer" style="display:none;">
	<div class="popup_box" style="height: 200px;">
		<div class="popup_top">
			<h1>����� ����</h1>
		</div>
		<div class="popup_content">
			<div class="content-box" style="height: 450px;">
  				<table id="userGrid"></table>
   				<div id="userGridPager"></div>
			</div>
		</div>
		<div class="popup_btn">
			<div class="btn_area">
				<button type="button" id="btnUserSelect">����</button>
				<button type="button" id="btnUserCancel">���</button>
			</div>
		</div>
	</div>
</div>
<!-- �˾�â ���� -->

</section>
<!-- section -->
<%@ include file="../../include/footer2.jsp"%>
<script>

$(document).ready(function () {

    // ��¥ ����
    setSelectDate();

	$("#selectList").change(function () {
		location.href = $("#selectList").val();
	});

	var boss_user_name = "${teamManager.USER_NAME}"; 
	var boss_jikguk = "${teamManager.JIKGUK}"; 
	var boss_user_no = "${teamManager.USER_NO}";

	$("#ok_user_no").val(boss_user_no);
	$("#ok_user_name").val(boss_user_name + " " + boss_jikguk + " (" + boss_user_no + ")");

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

    // ���� ��û ��ư
    $("#btnApprovalRequest").click(function() {
        reqApproval();
    });

	// ���� ��û - ����� ����
	$("#btnUserSelectPopup").click(function (e) {
        $("#userSelect").show();
		searchAppUserSelect();
	});

	// ���� ��û - ����� ���� ���
	$("#btnUserCancel").on("click", function(e) {
		$("#userSelect").hide();
	});

	$("#btnUserSelect").on("click", function(e) {

        var nRowid  = $("#userGrid").getGridParam("selrow");
        var sUserNm = $("#userGrid").getCell(nRowid, 'USER_NAME'); 
        var sJikguk = $("#userGrid").getCell(nRowid, 'JIKGUK'); 
        var sUserNo = $("#userGrid").getCell(nRowid, 'USER_NO');

        $("#ok_user_no").val(sUserNo);
        $("#ok_user_name").val(sUserNm + " " + sJikguk + " (" + sUserNo + ")");
        $("#userSelect").hide();
	});
	
	// ���� ��û - ����
	$("#btnApprovalSave").on("click", function(e) {
		saveApproval();
	});
	
	$("#btnApprovalCancel").on("click", function(e) {
		$("#exceptionApprovalPopup").hide();
		$("#reason").val("");
	});

	$("#btnCheck").on("click", function(e) {
		$("#insertPathExcepPopup").hide();
		var tr = $("#excepPath").children();
		tr.remove();
	});

	loadJqGrid($("#exceptionGrid"));
});

// ��� ���� ����Ʈ �׸��� ��ȸ
function loadJqGrid(oGrid)
{
    // ��ο��� ����Ʈ �׸���
    var oPostDt = {};
    oPostDt["status"]   = $("select[name='statusList']").val();
    oPostDt["owner"]    = $("#schOwner").val();
    oPostDt["filename"] = $("#schFilename").val();
    oPostDt["fromDate"] = $("#fromDate").val();
    oPostDt["toDate"]   = $("#toDate").val();

    oGrid.jqGrid({
        url: "${getContextPath}/excepter/selectExceptionList",
        postData: oPostDt,
        datatype: "json",
        mtype: "POST",
        async: true,
        contentType: "application/json; charset=UTF-8",
        colNames:['', 'ȣ��Ʈ','������','���� ������','���� �����','����','���', 'USER_NO','OK_USER_NO', 'FLAG_NAME', 'CHARGE_ID', 'LEVEL'],
        colModel: [    
            { index: 'IDX',                 name: 'IDX',                width: 1, hidden:true},
            { index: 'OWNER',               name: 'OWNER',              width: 80, align: 'center'},
            { index: 'FILENAME',            name: 'FILENAME',           width: 180, align: 'left'},  
            { index: 'REGDATE',             name: 'REGDATE',            width: 100, align: 'center'}, 
            { index: 'OKDATE',              name: 'OKDATE',             width: 100, align: 'center'},
            { index: 'APPROVAL_STATUS',     name: 'APPROVAL_STATUS',    width: 50,  align: 'center', formatter:'select', editoptions:{value:{'E':'���οϷ�','D':'�ݷ�','W':'���δ��'}}},
            { index: 'NOTE',                name: 'NOTE',               width: 150,  align: 'center'},
            { index: 'USER_NO',             name: 'USER_NO',            width: 1,  hidden:true},
            { index: 'OK_USER_NO',          name: 'OK_USER_NO',         width: 1,  hidden:true},
            { index: 'FLAG_NAME',           name: 'FLAG_NAME',          width: 1, hidden:true},
            { index: 'CHARGE_ID',           name: 'CHARGE_ID',          width: 1, hidden:true},
            { index: 'LEVEL',               name: 'LEVEL',              width: 100, align: 'center', hidden:true}
        ],
        id: "exceptionGrid",
        loadonce :true,
        viewrecords: true, // show the current page, data rang and total records on the toolbar
        width: oGrid.parent().width(),
        height: 600,
        autowidth: true,
        multiselect:true,
        shrinkToFit: true,
        rownumbers : false, // ���ȣ ǥ�ÿ���
        rownumWidth : 75, // ���ȣ ���� �ʺ�  
        rowNum:25,
        rowList:[25,50,100],    
        pager: "#exceptionGridPager",
        ondblClickRow: function(nRowid, icol, cellcontent, e) {

            // ���̺��� path_ex_group_name �����ͼ� �־������
            var chid = oGrid.getCell(nRowid, 'IDX');
            var oPostDt = {};
            oPostDt["path_ex_group_id"] = chid;

            $.ajax({
                type: "POST",
                url: "${getContextPath}/excepter/selectExeptionPath",
                async: true,
                data: JSON.stringify(oPostDt),
                contentType: 'application/json; charset=UTF-8',
                success: function (searchList) {

                    var arr = [];
                    var getPathex = [];

                    if (searchList.length > 0) {
                        $.each(searchList, function (i, s) {

                            arr.push(s);
                            getPathex.push(arr[i].path_ex);
                            $("#excepPath").append("<tr style='border:none;'>" + "<th style='padding:0px; background: transparent;'>" + getPathex[i] + "</th>" + "</tr>");
                        });
                    }

                    return;
                },
                error: function (request, status, error) {
                    alert("���� �Ͽ����ϴ�.");
                }
            });

            var detailName = oGrid.getCell(nRowid, 'FILENAME');

            $("#groupName").html(detailName);
            $("#trueFalseChk").val(oGrid.getCell(nRowid, 'FLAG_NAME'));
            $("#insertPathExcepPopup").show();
        },
//         loadComplete: function(data) {

//             // ������ �ε� �Ϸ� �� �̺�Ʈ
//             var idArry = oGrid.jqGrid('getDataIDs');            // grid�� id ���� �迭�� ������

//             for (var i = 0; i < idArry.length; i += 1){
//                 var ret =  oGrid.getRowData(idArry[i]);         // �ش� id�� row �����͸� ������

//                 // �ش� row�� Ư�� �÷� ���� 1�� �ƴϸ� multiselect checkbox disabled ó��
//                 if (ret.APPROVAL_STATUS != ''){ 
//                    // �ش� row�� checkbox disabled ó�� "jqg_list_" �� �κ��� grid���� �ڵ� ����
//                    $("#jqg_exceptionGrid_"+idArry[i]).attr("disabled", true);
//                    $("#jqg_exceptionGrid_"+idArry[i]).prop('checked', false);
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

// ��� ���� ����Ʈ ���� ��û �˾� ȣ��
function reqApproval()
{
    var bDeletion = false;
    var aDeletion = [];
    var aSelRows = $("#exceptionGrid").getGridParam('selarrrow');      //üũ�� row id���� �迭�� ��ȯ

    for (var i = 0; i < aSelRows.length; i += 1)
    {
        aDeletion.push($("#exceptionGrid").getRowData(aSelRows[i]));
        var status = $("#exceptionGrid").getCell(aSelRows[i], 'APPROVAL_STATUS');

        // �����û�� �̷���� ��� ����Ұ�
        if (!isNull(status)) {
            bDeletion = true;
        }
    }

    if (bDeletion) {
        alert("�̹� ó���� �׸��� �ֽ��ϴ�.");
        return;
    }

    if (aDeletion.length == 0) {
        alert("�����û �׸��� �����ϼ���.");
        return;
    }

    var oToday = getToday();
    $("#reg_user_name").val("${memberInfo.USER_NAME}");
    $("#regdate").val(oToday.substring(0,4) + "-" + oToday.substring(4,6) + "-" + oToday.substring(6,8));
    $("#exceptionApprovalPopup").show();
    $("#reason").focus();    
}

// ��� ���� ����Ʈ ���� ��û ���� ����
function saveApproval()
{
    var oGrid = $("#exceptionGrid"); 
	var aIdxList = [];
	var aExcepScope = [];
	var aSelRow = oGrid.getGridParam('selarrrow');      //üũ�� row id���� �迭�� ��ȯ

	for (var i = 0; i < aSelRow.length; i += 1)
	{
	    aIdxList.push(oGrid.getCell(aSelRow[i], 'IDX'));
	    aExcepScope.push(oGrid.getCell(aSelRow[i], 'OWNER'));
	}

	var sApprType = $('#btnApprovalSave').val();
	var oDate = new Date(); 
    var sToday = getFormatDate(oDate).replace(/[^0-9]/g, "");
    var sDocuSeq;

	$.ajax({
        type: "POST",
        url: "${getContextPath}/excepter/selectDocuNum",
        async : false,
        data : { "today": sToday },
        datatype: "json",
        success: function (result) {
            sDocuSeq = ""+result.SEQ;
        }
	});

	var oPostDt = {};
    oPostDt["ok_user_no"] = $("#ok_user_no").val();
	oPostDt["doc_seq"]    = sDocuSeq;
    oPostDt["idxList"]    = aIdxList;
	oPostDt["apprType"]   = sApprType;
	oPostDt["comment"]    = $("#reason").val();
    oPostDt["today"]      = sToday;

	$.ajax({

        type: "POST",
        url: "${getContextPath}/excepter/registPathExceptionCharge",
        async : false,
        data : JSON.stringify(oPostDt),
        contentType: 'application/json; charset=UTF-8',

	    success: function (result) {
	        if (result.resultCode != "0") {
	            alert(result.resultCode + "ó�� ����� ���� �Ͽ����ϴ�.");
	            return;
	        }

	        alert("ó���� ��� �Ͽ����ϴ�.");
	
	        var oPostDt = { USER_NO : '${memberInfo.USER_NO}'};

	        oGrid.clearGridData();
	        oGrid.setGridParam({
	        	url:"${getContextPath}/excepter/selectExceptionList",
	        	postData: oGrid.getGridParam('postData'), 
	        	datatype:"json"
        	}).trigger("reloadGrid");

	        $("#deletionRegistPopup").hide();
	        $("#reason").val("");
	        return;
	    },
	    error: function (request, status, error) {
	        alert("ó�� ����� ���� �Ͽ����ϴ�.");
	        return;
	    }
	});
	
	$("#exceptionApprovalPopup").hide();
	$("#reason").val("");
}

//����� ��ȸ
function searchAppUserSelect()
{
	if ($("#userGrid").width() == 0) {
	
	    $("#userGrid").jqGrid({
	        url: "${getContextPath}/approval/selectTeamMember",
	        datatype: "json",
	        mtype: "POST",
	        ajaxGridOptions: {
	            type  : "POST",
	            async : true
	        },
	        colModel: [
	        	//{label: '�����ȣ', index: 'USER_NO',   name: 'USER_NO',   width: 180, align: 'center' },
                {label: '�μ�',    index: 'TEAM_NAME', name: 'TEAM_NAME', width: 180, align: 'center' },
                {label: '�����',  index: 'USER_NAME', name: 'USER_NAME', width: 180, align: 'center' },
                {label: '��å',    index: 'JIKGUK',    name: 'JIKGUK',    width: 180, align: 'center' }               
	        ],
	        id: "USER_NO",
	        loadonce:true,
	        viewrecords: true,
	        width: 600,
	        height: 280,
	        autowidth: true,
	        shrinkToFit: true,
	        loadonce: true,
	        rownumbers : false,
	        rownumWidth : 75,   
	        rowNum:25,
	        rowList:[25,50,100],
	        pager: "#userGridPager",
	        onSelectRow : function(nRowid,celname,value,iRow,iCol) {    
	        },
	        afterEditCell: function(nRowid, cellname, value, iRow, iCol){
	        },
	        afterSaveCell : function(nRowid,name,val,iRow,ICol){
	        },
	        afterSaveRow : function(nRowid,name,val,iRow,ICol){
	        },
	        ondblClickRow: function(nRowid,iRow,iCol) {
	
	            var sUserNm = $(this).getCell(nRowid, 'USER_NAME'); 
	            var sJikguk = $(this).getCell(nRowid, 'JIKGUK'); 
	            var sUserNo = $(this).getCell(nRowid, 'USER_NO');
	
	            $("#ok_user_no").val(sUserNo);
	            $("#ok_user_name").val(sUserNm + " " + sJikguk + " (" + sUserNo + ")");
	            $("#userSelect").hide();
	        },
	        loadComplete: function(data) {
	        },
	        gridComplete : function() {
	        }
	    }).filterToolbar({
	          autosearch: true,
	          stringResult: true,
	          searchOnEnter: true,
	          defaultSearch: "cn"
	    }); 
	     
	    $("#userGridPager_left").css("width", "10px");
	    $("#userGridPager_right").css("display", "none");
	}
	else {
	    $("#userGrid").setGridParam({
	        url:"${getContextPath}/approval/selectTeamMember", 
	        datatype:"json"
	    }).trigger("reloadGrid");
	}
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
    oPostDt["status"]   = $("select[name='statusList']").val();
    oPostDt["owner"]    = $("#schOwner").val();
    oPostDt["filename"] = $("#schFilename").val();
    oPostDt["fromDate"] = $("#fromDate").val();
    oPostDt["toDate"]   = $("#toDate").val();

	$("#exceptionGrid").clearGridData();
	$("#exceptionGrid").setGridParam({
		url: "${getContextPath}/excepter/selectExceptionList",
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