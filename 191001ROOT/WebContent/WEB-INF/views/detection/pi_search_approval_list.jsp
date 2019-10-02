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
				<p class="location">���� ���� > ���� ���� > ��Ž/��Ž ���� ����Ʈ</p>
			</div>
			<div class="grid_top">
				<h3>��Ž/��Ž ���� ����Ʈ</h3>
	            <div class="list_sch">
	            <c:if test="${memberInfo.USER_GRADE != '0'}">
	                <div class="sch_area">
	                    <button type="button" name="button" class="btn_new" id="btnSearch">Search</button>
                        <button type="button" name="button" class="btn_new" id="btnApproveAll">�ϰ� ����</button>
	                    <button type="button" name="button" class="btn_new" id="btnApprove">����</button>
	                </div>
	            </c:if>
	            </div>
                <table class="user_info approvalTh">
                    <caption>���������</caption>
                    <tbody>
                        <tr>
                            <td style="text-align: center; background-color: #d6e4ed; width:4vw">��������</td>
                            <td style="width:10.5vw;">
                                <select id="selectList" name="selectList" style="width:9.7vw;">
                                    <option value="/approval/pi_search_list">��Ž/��Ž ����Ʈ</option>
                                    <option value="/approval/pi_search_approval_list" selected>��Ž/��Ž ���� ����Ʈ</option>
                                    <!-- <option value="/excepter/pi_exception_list">��� ���� ����Ʈ</option>
                                    <option value="/excepter/pi_exception_approval_list">��� ���� ���� ����Ʈ</option> -->
                                    <option value="/change/pi_change_list"> ����� ���� ����Ʈ</option>
                                </select>
                            </td>
                            <td style="text-align: center; background-color: #d6e4ed; width:3vw;">����</td>
                            <td style="width:5.7vw;">
                                <select id="statusList" name="statusList" style="width:4.9vw;">
                                    <option value="">��ü</option>
                                    <option value="E">���οϷ�</option>
                                    <option value="D">�ݷ�</option>
                                    <option value="W" selected>���δ��</option>
                                </select>
                            </td>
                            <td style="text-align: center; background-color: #d6e4ed; width:4vw;">������</td>
                            <td style="width:8.9vw"><input type="text" style="width: 8vw; font-size: .85vw;" size="20" id="schPath" placeholder="�������� �Է��ϼ���"></td>
                            <td style="text-align: center; background-color: #d6e4ed; width:4vw">�����</td>
                            <td style="width:9.7vw"><input type="text" style="width: 8.9vw; font-size: .85vw;" size="10" id="schUserNm" placeholder="����ڸ��� �Է��ϼ���"></td>
                            <td style="text-align: center; background-color: #d6e4ed; width:5vw">���������</td>
                            <td style="width:17vw;">
                                <input type="date" id="fromDate" style="text-align: center; width:7.5vw; font-size:.6vw;" readonly="readonly" value="${fromDate}" >
                                <span style="width: 8%; margin-right: 3px;">~</span>
                                <input type="date" id="toDate" style="text-align: center; width:7.5vw; font-size:.6vw;" readonly="readonly" value="${toDate}" >
                            </td>
                        </tr>
                    </tbody>
                </table>
			</div>
			<div class="left_box2" style="overflow: hidden; max-height: 732px;height: 700px;">
  					<table id="processApproveGrid"></table>
  					<div id="processApproveGridPager"></div>
			</div>
		</div>
	</div>
	

<!-- �˾�â ���� ���� ��û Ȯ�� -->
<div id="selecetProcessPopup" class="popup_layer" style="display:none">
	<div class="popup_box" style="height: 510px;">
		<div class="popup_top">
			<h1 id="">���� ��û Ȯ��</h1>
		</div>
		<div class="popup_content">
			<div class="content-box" style="height: 390px;">
				<!-- <h2>���λ���</h2>  -->
				<table class="popup_tbl" style="table-layout:fixed;">
					<colgroup>
						<col width="130">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th style="background-color: #f9f9f9;">�̸�</th>
							<td style="padding:5px;">
                                <textarea id="excepPath" name="excepPath" style="border: 0px solid #cdcdcd; width: 100%; height: 230px; resize: none;" readonly="true"></textarea>
							</td>
						</tr>
						<tr>
							<th style="background-color: #f9f9f9;">����</th>
								<td>
								<input type="radio" name="trueFalseChk" id="permit" value="E" class="edt_sch" style=" border: 0px solid #cdcdcd;">����
								<input type="radio" name="trueFalseChk" id="reject" value="D" class="edt_sch" style="margin-left:100px; border: 0px solid #cdcdcd;">�ݷ�
								<input type="hidden" id="selectedDate" value="">
							</td>  
						</tr>
						<tr>
							<th style="background-color: #f9f9f9;">����</th>
								<td style="padding:5px;"><textarea id="reason" class="edt_sch" style="border: 0px solid #cdcdcd; width: 100%; height: 50px; margin-top: 5px; margin-bottom: 5px; resize: none;"></textarea>
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

<!-- �˾�â ���� ��Ž/��Ž ��û ����-->
<div id="insertPathPopup" class="popup_layer" style="display:none">
	<div class="popup_box" style="height: 510px;">
		<div class="popup_top">
			<h1 id="groupName"></h1>
		</div>
		<div class="popup_content">
			<div class="content-box" style="height: 390px;">
				<!-- <h2>���λ���</h2>  -->
				<table class="popup_tbl" style="table-layout:fixed;">
					<colgroup>
						<col width="130">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th style="background-color: #f9f9f9;">�̸�</th>
							<td style="padding:5px;">
                                <textarea id="processPath" name="processPath" style="border: 0px solid #cdcdcd; width: 100%; height: 330px; resize: none;" readonly="true"></textarea>
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

<!-- container -->
</section>
<!-- section -->
<%@ include file="../../include/footer2.jsp"%>
<script>
var bApprovalAll = false;
var oApprovalAll = {};

$(document).ready(function () {

	// ��¥ ����
    setSelectDate();

	$("#selectList").change(function () {
		location.href=$("#selectList").val();
	});

    // ��ȸ���� ����� inputbox Keydown Event (����� ��ȸ)
    $("#schPath, #schUserNm").keydown(function(e) {
        if(e.keyCode == 13) 
            fn_search();
    });

    // �˻�
    $("#btnSearch").click(function() {
        fn_search();
    });

    // �˻�
    $("#statusList").change(function() {
        fn_search();
    });

    // 
	$("#btnCheck").click(function(e) {
		$("#insertPathPopup").hide();
		$("#processPath").val();
	});

	// �ϰ� ���� ��ư
	$("#btnApproveAll").click(function(e) {
	    reqApprovalAll();
	});

	// ���� ��ư
	$("#btnApprove").click(function(e) {
		reqApproval();
	});

	// ���� ���
	$("#btnCancel").click(function(e) {
        bApprovalAll = false;
        oApprovalAll = {};
        $("#excepPath").val('');
        $("#reason").val('');
        $("#selecetProcessPopup").hide();
	});

	// ���� - ����
	$("#btnSave").click(function(e) {
		if (bApprovalAll) {
		    saveApprovalAll();
		} 
		else {
			saveApproval();
		}
        bApprovalAll = false;
        oApprovalAll = {};
        $("#excepPath").val('');
        $("#reason").val('');
	    $("#selecetProcessPopup").hide();
	});

	loadJqGrid($("#processApproveGrid"));
});

//��Ž/��Ž ���� ����Ʈ �׸��� ��ȸ
function loadJqGrid(oGrid)
{
    // ��Ž/��Ž ���� ����Ʈ �׸���
    var oPostDt = {};
    oPostDt["target_id"] = $("#hostSelect").val();
    oPostDt["status"]    = $("select[name='statusList']").val();
    oPostDt["user_nm"]   = $("#schUserNm").val();
    oPostDt["path"]      = $("#schPath").val();
    oPostDt["fromDate"]  = $("#fromDate").val();
    oPostDt["toDate"]    = $("#toDate").val();

    oGrid.jqGrid({
        url: "${getContextPath}/approval/searchApprovalListData",
        postData: oPostDt,
        datatype: "json",
        mtype: "POST",
        async: true,
        contentType: "application/json; charset=UTF-8",
        colModel: [    
            {label: '',          index: 'CHK',             name: 'CHK',             width: 30,  align: 'center', hidden:true},
            {label: '������',     index: 'PATH',            name: 'PATH',            width: 200, align: 'left'},
            {label: '�����',     index: 'USER_NAME',       name: 'USER_NAME',       width: 60,  align: 'center'},
            {label: '������',     index: 'OK_USER_NAME',    name: 'OK_USER_NAME',    width: 60,  align: 'center'},
            {label: '���������',  index: 'REGDATE',         name: 'REGDATE',         width: 100, align: 'center'},   
            {label: '������',     index: 'OKDATE',          name: 'OKDATE',          width: 100, align: 'center'},   
            {label: '����',       index: 'APPROVAL_STATUS', name: 'APPROVAL_STATUS', width: 50,  align: 'center', formatter:'select', editoptions:{value:{'E':'���οϷ�','D':'�ݷ�','W':'���δ��'}}},
            {label: '���',       index: 'REASON',          name: 'REASON',          width: 100, align: 'left'},
            {label: 'CHARGE_ID', index: 'CHARGE_ID',       name: 'CHARGE_ID',       width: 10,  hidden:true}
        ],
        loadonce: true,
        viewrecords: true,                  // show the current page, data rang and total records on the toolbar
        width: oGrid.parent().width(),
        height: 600,
        multiselect: true,
        autowidth: true,
        shrinkToFit: true,
        rownumbers: false,                  // ���ȣ ǥ�ÿ���
        rownumWidth: 75,                    // ���ȣ ���� �ʺ�  
        rowNum: 25,
        rowList: [50,250,1000],
        pager: "#processApproveGridPager",
        ondblClickRow: function(rowid, icol, cellcontent, e) {

        	// ���̺��� path_ex_group_name �����ͼ� �־������
            var oPostDt = {};
            oPostDt["CHARGE_ID_LIST"] = oGrid.getCell(rowid, 'CHARGE_ID');

            var oJson = JSON.stringify(oPostDt);

            $.ajax({
                url: "${getContextPath}/approval/selectProcessGroupPath",
                type: "POST",
                async : true,
                data : oJson,
                contentType: 'application/json; charset=UTF-8',
                success: function (searchList) {

                    if (searchList.length > 0) {
                    	var sChargeId = undefined;
                    	var sText = "";
                        $.each(searchList, function (i, s) {

                            if (sChargeId != s.CHARGE_ID) {
                            	sText += "\r\n- " + s.data_processing_name + "\r\n";
                            }

                            sText += s.PATH + "\r\n";
                            sChargeId = s.CHARGE_ID;
                        });
                        sText = sText.replace(/^\/r\/n/g, "");
                        $("#processPath").val(sText);
                    }
                    return;
                },
                error: function (request, status, error) {
                    alert("���� �Ͽ����ϴ�.");
                }
            });
            
            var detailName = oGrid.getCell(rowid, 'PATH');
            console.log(detailName);
            $("#groupName").html(detailName);
            $("#insertPathPopup").show();
        },
//         onCellSelect: function(rowid, icol, cellcontent, e) {
//             if (status) {
//                 var cbs = $("tr.jqgrow > td > input.cbox:disabled", oGrid[0]);
//                 cbs.removeAttr("checked");
                
//                 oGrid[0].p.selarrrow = oGrid.find("tr.jqgrow:has(td > input.cbox:checked)").map(function() { return this.id; }).get();
//             }
//         },
//         loadComplete: function(data) {
//             var idArry = oGrid.jqGrid('getDataIDs'); //grid�� id ���� �迭�� ������
                                        
//             for(var i=0 ; i < idArry.length; i++){
//                 var ret =  oGrid.getRowData(idArry[i]); // �ش� id�� row �����͸� ������

//                 if(ret.APPROVAL_STATUS != 'W'){ //�ش� row�� Ư�� �÷� ���� 1�� �ƴϸ� multiselect checkbox disabled ó��
//                    //�ش� row�� checkbox disabled ó�� "jqg_list_" �� �κ��� grid���� �ڵ� ����
//                    $("#jqg_processApproveGrid_"+idArry[i]).attr("disabled", true); 
//                 }
//             }
//         },
//         beforeSelectRow: function (rowid, e) {
//             var $myGrid = $(this),
//                 i = $.jgrid.getCellIndex($(e.target).closest('td')[0]),
//                 cm = $myGrid.jqGrid('getGridParam', 'colModel');
//             return (cm[i].name === 'cb');
//         }
    });
}

//�ϰ� ����
function reqApprovalAll()
{
	$.ajax({
	    type: "POST",
	    url: "${getContextPath}/approval/searchApprovalAllListData",
	    async : true,
	    success: function (searchList) {
	
	        if (searchList.length > 0) {
	            var sGroupId = undefined;
	            var sText = "";
	            $.each(searchList, function (i, s) {
	
	                if (sGroupId != s.GROUP_ID) {
	                    sText += "\r\n- (" + s.CHARGE_NAME + ") " + s.data_processing_name + "\r\n";
	                }
	
	                sText += s.PATH + "\r\n";
	                sGroupId = s.GROUP_ID;
	            });
	            sText = sText.replace(/^\/r\/n/g, "");
	            $("#excepPath").val(sText);
	        }
	
	        bApprovalAll = true;
	        oApprovalAll = searchList;

	        if (oApprovalAll.length <= 0) {
	            alert("ó���� ���簡 ���� ���� �ʽ��ϴ�.");
	            return;
	        }

	        $("#selecetProcessPopup").show();
	        return;
	    },
	    error: function (request, status, error) {
	        alert("���� �Ͽ����ϴ�.");
	    }
	});
}

function saveApprovalAll()
{
    var aChargeId = [];
    for (var i = 0; i < oApprovalAll.length; i += 1)
    {
        if (aChargeId.indexOf(oApprovalAll[i]["CHARGE_ID"]) < 0) 
            aChargeId.push(oApprovalAll[i]["CHARGE_ID"]);
    }

    var sReason  = $("#reason").val();
    var apprType = $("input:radio[name=trueFalseChk]:checked").val();

    if (!apprType) {
        alert("������ �����ϼ���.");
        return false;
    }

    var oPostDt = {};
    oPostDt["chargeIdList"] = aChargeId.join(",");
    oPostDt["reason"]   = sReason
    oPostDt["apprType"] = apprType;

    var oJson = JSON.stringify(oPostDt);

    $.ajax({
        url: "${getContextPath}/approval/updateProcessApproval",
        type: "POST",
        async : false,
        data : oJson,
        contentType: 'application/json; charset=UTF-8',
        success: function (result) {

            if (result.resultCode != "0") {
                alert(result.resultCode + "("+result.resultMessage+"} ó�� ����� ���� �Ͽ����ϴ�.");
                return;
            }

            alert("ó���� ��� �Ͽ����ϴ�.");

            $("#processApproveGrid").setGridParam({
                url: "${getContextPath}/approval/searchApprovalListData",
                postData: $("#processApproveGrid").getGridParam('postData'), 
                datatype: "json"
            }).trigger("reloadGrid");

            $("#deletionRegistPopup").hide();
            $("input:radio[name=trueFalseChk]").prop("checked", false);

            return;
        },
        error: function (request, status, error) {
            alert("ó�� ����� ���� �Ͽ����ϴ�.");
            $("input:radio[name=trueFalseChk]").prop("checked", false);
            return;
        }
    });

    bApprovalAll = false;
    oApprovalAll = {};
    $("#excepPath").val('');
}

// ���� ����Ʈ ��ȸ
function reqApproval()
{
    var sStatus = "";
    var bException = false;
    var aChargeId = [];

    var aSelRow = $("#processApproveGrid").getGridParam('selarrrow');                           // üũ�� row id���� �迭�� ��ȯ

    for (var i = 0; i < aSelRow.length; i += 1)
    {
    	aChargeId.push($("#processApproveGrid").getCell(aSelRow[i], 'CHARGE_ID'));
        sStatus = $("#processApproveGrid").getCell(aSelRow[i], 'APPROVAL_STATUS');

        if ((sStatus == "D") || (sStatus == "E")) {
        	bException = true;
        }
    }

    if (bException) {
        alert("�̹� ó���� �׸��� �����մϴ�.");
        return;
    }

    if (aChargeId.length == 0) {
        alert("�����û �׸��� �����ϼ���.");
        return;
    }

    var oPostDt = {};
    oPostDt["CHARGE_ID_LIST"] = aChargeId.join(",");
    var oJson = JSON.stringify(oPostDt);

    $.ajax({
        url: "${getContextPath}/approval/selectProcessGroupPath",
    	type: "POST",
        async : true,
        data : oJson,
        contentType: 'application/json; charset=UTF-8',
        success: function (searchList) {

            if (searchList.length > 0) {
                var sChargeId = undefined;
                var sText = "";
                $.each(searchList, function (i, s) {

                    if (sChargeId != s.CHARGE_ID) {
                        sText += "\r\n- " + s.data_processing_name + "\r\n";
                    }

                    sText += s.PATH + "\r\n";
                    sChargeId = s.CHARGE_ID;
                });
                sText = sText.replace(/^\/r\/n/g, "");
                $("#excepPath").val(sText);
            }
            return;
        },
        error: function (request, status, error) {
            alert("���� �Ͽ����ϴ�.");
        }
    });

    $("#selecetProcessPopup").show();
}

// ���� ����
function saveApproval() 
{
    var sStatus = "";
    var bException = false;
    var aChargeId = [];

    var aSelRow = $("#processApproveGrid").getGridParam('selarrrow');      //üũ�� row id���� �迭�� ��ȯ

    for (var i = 0; i < aSelRow.length; i += 1)
    {
        aChargeId.push($("#processApproveGrid").getCell(aSelRow[i], 'CHARGE_ID'));
        sStatus = $("#processApproveGrid").getCell(aSelRow[i], 'APPROVAL_STATUS');

        if ((sStatus == "D") || (sStatus == "E")) {
        	bException = true;
        }
    }

    if (bException) {
        alert("�̹� ó���� �׸��� �����մϴ�.");
        return;
    }
    if (aChargeId.length == 0) {
        alert("�����û �׸��� �����ϼ���.");
        return;
    }

    var sReason  = $("#reason").val();
    var apprType = $("input:radio[name=trueFalseChk]:checked").val();

    if (!apprType) {
        alert("������ �����ϼ���.");
        return false;
    }

    var oPostDt = {};
    oPostDt["chargeIdList"] = aChargeId.join(",");
    oPostDt["reason"]   = sReason
    oPostDt["apprType"] = apprType;

    var oJson = JSON.stringify(oPostDt);

    $.ajax({
        url: "${getContextPath}/approval/updateProcessApproval",
        type: "POST",
        async : false,
        data : oJson,
        contentType: 'application/json; charset=UTF-8',
        success: function (result) {

        	if (result.resultCode != "0") {
                alert(result.resultCode + "("+result.resultMessage+"} ó�� ����� ���� �Ͽ����ϴ�.");
                return;
            }

            alert("ó���� ��� �Ͽ����ϴ�.");

            $("#processApproveGrid").setGridParam({
                url: "${getContextPath}/approval/searchApprovalListData",
                postData: $("#processApproveGrid").getGridParam('postData'), 
                datatype: "json"
            }).trigger("reloadGrid");

            $("#deletionRegistPopup").hide();
            $("input:radio[name=trueFalseChk]").prop("checked", false);

            return;
        },
        error: function (request, status, error) {
            alert("ó�� ����� ���� �Ͽ����ϴ�.");
            $("input:radio[name=trueFalseChk]").prop("checked", false);
            return;
        }
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
    oPostDt["target_id"] = $("#hostSelect").val();
    oPostDt["status"]    = $("select[name='statusList']").val();
    oPostDt["user_nm"]   = $("#schUserNm").val();
    oPostDt["path"]      = $("#schPath").val();
    oPostDt["fromDate"]  = $("#fromDate").val();
    oPostDt["toDate"]    = $("#toDate").val();

	$("#processApproveGrid").clearGridData();
	$("#processApproveGrid").setGridParam({
	    url: "${getContextPath}/approval/searchApprovalListData",
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