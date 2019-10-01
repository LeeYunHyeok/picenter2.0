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
				<p class="location">���� ���� > ���� ���� > ��� ���� ���� ����Ʈ</p>
			</div>
			<div class="grid_top">
				<h3>��� ���� ���� ����Ʈ</h3>
	            <div class="list_sch">
	            <c:if test="${memberInfo.USER_GRADE != '0'}">
	                <div class="sch_area">
                        <button type="button" name="button" class="btn_new" id="btnSearch">Search</button>
	                    <button type="button" name="button" class="btn_new" id="btnApproveAll">�ϰ� ����</button>
	                    <button type="button" name="button" class="btn_new" id="btnApprove">����</button>
	                </div>
	            </c:if>
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
                                    <option value="/excepter/pi_exception_list">��� ���� ����Ʈ</option>
                                    <option value="/excepter/pi_exception_approval_list" selected>��� ���� ���� ����Ʈ</option>
                                    <option value="/change/pi_change_list"> ����� ���� ����Ʈ</option>
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
                            <td style="text-align: center; background-color: #eeeeee; width:100px">������</td>
                            <td><input type="text" style="width: 100%;" size="20" id="schPath" placeholder="�������� �Է��ϼ���"></td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">�����</td>
                            <td><input type="text" style="width: 100%;" size="10" id="schUserNm" placeholder="����ڸ��� �Է��ϼ���"></td>
                            <td style="text-align: center; background-color: #eeeeee; width:100px">���������</td>
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
  					<table id="excepApproveGrid"></table>
  					<div id="excepApproveGridPager"></div>
			</div>
		</div>
	</div>
	
<!-- �˾�â ���� ���� ��û Ȯ�� -->
<div id="selecetExcepPopup" class="popup_layer" style="display:none">
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
							<th style="background-color: #f9f9f9;">����Ʈ</th>
							<td  style="padding:5px;">
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
                            <th style="background-color: #f9f9f9;">����Ʈ</th>
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
        $("#processPath").val("");
    });

	// �ϰ� ���� ��ư
	$("#btnApproveAll").click(function(e) {
		reqApprovalAll();
	});

	// ���� ��ư
	$("#btnApprove").click(function(e) {
		reqApproval();
	});

	$("#btnCancel").click(function(e) {
        bApprovalAll = false;
        oApprovalAll = {};
        $("#excepPath").val("");
        $("#reason").val('');
        $("#selecetExcepPopup").hide();
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
        $("#excepPath").val("");
        $("#reason").val('');
		$("#selecetExcepPopup").hide();
	});

	loadJqGrid($("#excepApproveGrid"));
});

function loadJqGrid(oGrid)
{
    // ��Ž/��Ž ���� ����Ʈ �׸���
    var oPostDt = {};
    oPostDt["status"]    = $("select[name='statusList']").val();
    oPostDt["user_nm"]   = $("#schUserNm").val();
    oPostDt["path"]      = $("#schPath").val();
    oPostDt["fromDate"]  = $("#fromDate").val();
    oPostDt["toDate"]    = $("#toDate").val();

    oGrid.jqGrid({
        url: "${getContextPath}/excepter/exceptionApprovalListData",
        postData: oPostDt,
        datatype: "json",
        mtype: "POST",
        ajaxGridOptions : {
            type: "POST",
            async: true
        },
        colNames:['IDX','������','�����','������','���������','������','����','���', 'CHARGE_ID'],
        colModel: [    
            { index: 'IDX',          name: 'IDX',          width: 1,   hidden:true},
            { index: 'NAME',         name: 'NAME',         width: 180, align: 'left'},
            { index: 'USER_NAME',    name: 'USER_NAME',    width: 80,  align: 'center'},
            { index: 'OK_USER_NAME', name: 'OK_USER_NAME', width: 80,  align: 'center'},
            { index: 'REGDATE',      name: 'REGDATE',      width: 100, align: 'center'},   
            { index: 'OKDATE',       name: 'OKDATE',       width: 100, align: 'center'},   
            { index: 'STATUS',       name: 'STATUS',       width: 50,  align: 'center', formatter:'select', editoptions:{value:{'E':'���οϷ�','D':'�ݷ�','W':'���δ��'}}},
            { index: 'REASON',       name: 'REASON',       width: 100, align: 'left'},
            { index: 'CHARGE_ID',    name: 'CHARGE_ID',    width: 10,  hidden:true}
        ],
        loadonce :true,
        viewrecords: true,      // show the current page, data rang and total records on the toolbar
        width: oGrid.parent().width(),
        height: 600,
        multiselect : true,
        autowidth: true,
        shrinkToFit: true,
        rownumbers: false,      // ���ȣ ǥ�ÿ���
        rownumWidth: 75,        // ���ȣ ���� �ʺ�  
        rowNum:25,
        rowList:[25,50,100],    
        pager: "#excepApproveGridPager",
        ondblClickRow: function(rowid, icol, cellcontent, e) {

            // ���̺��� path_ex_group_name �����ͼ� �־������
            var oPostDt = {};
            oPostDt["CHARGE_ID_LIST"] = oGrid.getCell(rowid, 'CHARGE_ID');

            var oJson = JSON.stringify(oPostDt);

            $.ajax({
            	url: "${getContextPath}/excepter/selectExceptionGroupPath",
                type: "POST",
                async : true,
                data : oJson,
                contentType: 'application/json; charset=UTF-8',
                success: function (searchList) {

                	$("#processPath").val("");
                    if (searchList.length > 0) {
                        var sChargeId = undefined;
                        var sText = "";
                        $.each(searchList, function (i, s) {

                            if (sChargeId != s.group_id) {
                                sText += "\r\n- " + s.path_ex_scope + "\r\n";
                            }

                            sText += s.path_ex + "\r\n";
                            sChargeId = s.group_id;
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
            
            var detailName = oGrid.getCell(rowid, 'NAME');
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
                
//                 if(ret.STATUS != 'W'){ //�ش� row�� Ư�� �÷� ���� 1�� �ƴϸ� multiselect checkbox disabled ó��
//                    //�ش� row�� checkbox disabled ó�� "jqg_list_" �� �κ��� grid���� �ڵ� ����
//                    $("#jqg_excepApproveGrid_"+idArry[i]).attr("disabled", true); 
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
	    url: "${getContextPath}/excepter/exceptionApprovalAllListData",
	    async : true,
	    success: function (searchList) {
	
	        if (searchList.length > 0) {
	            var sGroupId = undefined;
	            var sText = "";
	            $.each(searchList, function (i, s) {
	
	                if (sGroupId != s.group_id) {
	                    sText += "\r\n- " + s.path_ex_scope + "\r\n";
	                }
	
	                sText += s.path_ex + "\r\n";
	                sGroupId = s.group_id;
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

	        $("#selecetExcepPopup").show();
	        return;
	    },
	    error: function (request, status, error) {
	        alert("���� �Ͽ����ϴ�.");
	    }
	});
}

// �ϰ� ���� ����
function saveApprovalAll()
{
	var oGrid = $("#excepApproveGrid");
    var aChargeId = [];

    if (oApprovalAll.length <= 0) {
    	alert("ó���� ���簡 ���� ���� �ʽ��ϴ�.");
    	return;
    }

    for (var i = 0; i < oApprovalAll.length; i += 1)
    {
        if (aChargeId.indexOf(oApprovalAll[i]["charge_id"]) < 0) 
            aChargeId.push(oApprovalAll[i]["charge_id"]);
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
        url: "${getContextPath}/excepter/updateExcepApproval",
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

            oGrid.setGridParam({
            	url: "${getContextPath}/excepter/exceptionApprovalListData",
                postData: oGrid.getGridParam('postData'), 
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
    $("#excepPath").val();
}

//���� ����Ʈ ��ȸ
function reqApproval()
{
	var oGrid = $("#excepApproveGrid")
    var sStatus = "";
    var bException = false;
    var aChargeId = [];

    var aSelRow = oGrid.getGridParam('selarrrow');                           // üũ�� row id���� �迭�� ��ȯ

    for (var i = 0; i < aSelRow.length; i += 1)
    {
        aChargeId.push(oGrid.getCell(aSelRow[i], 'CHARGE_ID'));
        sStatus = oGrid.getCell(aSelRow[i], 'STATUS');

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
        url: "${getContextPath}/excepter/selectExceptionGroupPath",
        type: "POST",
        async : true,
        data : oJson,
        contentType: 'application/json; charset=UTF-8',
        success: function (searchList) {

            if (searchList.length > 0) {
                var sChargeId = undefined;
                var sText = "";
                $.each(searchList, function (i, s) {

                    if (sChargeId != s.group_id) {
                        sText += "\r\n- " + s.path_ex_scope + "\r\n";
                    }

                    sText += s.path_ex + "\r\n";
                    sChargeId = s.group_id;
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

    $("#selecetExcepPopup").show();
}

//���� ����
function saveApproval() 
{
	var oGrid = $("#excepApproveGrid");
    var sStatus = "";
    var bException = false;
    var aChargeId = [];

    var aSelRow = oGrid.getGridParam('selarrrow');      //üũ�� row id���� �迭�� ��ȯ

    for (var i = 0; i < aSelRow.length; i += 1)
    {
        aChargeId.push(oGrid.getCell(aSelRow[i], 'CHARGE_ID'));
        sStatus = oGrid.getCell(aSelRow[i], 'STATUS');

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
        url: "${getContextPath}/excepter/updateExcepApproval",
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

            oGrid.setGridParam({
            	url: "${getContextPath}/excepter/exceptionApprovalListData",
            	postData: oGrid.getGridParam('postData'), 
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
    oPostDt["status"]    = $("select[name='statusList']").val();
    oPostDt["user_nm"]   = $("#schUserNm").val();
    oPostDt["path"]      = $("#schPath").val();
    oPostDt["fromDate"]  = $("#fromDate").val();
    oPostDt["toDate"]    = $("#toDate").val();
    
    $("#excepApproveGrid").clearGridData();
    $("#excepApproveGrid").setGridParam({
        url: "${getContextPath}/excepter/exceptionApprovalListData",
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