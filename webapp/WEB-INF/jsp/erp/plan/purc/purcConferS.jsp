<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMain;
            var calMain;
            var PscrnParm = parent.scrnParm;
            var nDate;
            var rowSelVal;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 2, 3, 4, 5, 6], "1C"); //시험검사의뢰등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = new dxGrid(subLayout.cells("a"),false);
                gridMain.addHeader({name:"No",colId:"setNo",width:"50",align:"center",type:"ro"});
                gridMain.addHeader({name:"품목코드",colId:"itemCode",width:"100",align:"center",type:"combo"});
                gridMain.addHeader({name:"품명",colId:"matrName",width:"100",align:"center",type:"ed"});
                gridMain.addHeader({name:"규격",colId:"matrSpec",width:"100",align:"left",type:"ed"});
                gridMain.addHeader({name:"단위",colId:"matrUnit",width:"100",align:"left",type:"ed"});
                gridMain.addHeader({name:"단가",colId:"cost",width:"100",align:"right",type:"edn"});
                gridMain.addHeader({name:"금액",colId:"amt",width:"100",align:"right",type:"edn"});
                gridMain.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"center",type:"dhxCalendarA"});
                gridMain.addHeader({name:"납기장소",colId:"deliPlace",width:"100",align:"left",type:"ed"});
                gridMain.setUserData("","pk","");
                gridMain.setColSort("str");
                gridMain.dxObj.setUserData("","@deliDate","format_date");
                gridMain.init();
                gridMain.cs_setNumberFormat(["cost","amt"], "0,000");
                gridMain.cs_setColumnHidden(["setSeqTemp", "setDateTemp"]);
            	g_dxRules = {
            			itemCode : [r_notEmpty],
            			matrName : [r_notEmpty],
            			matrSpec : [r_notEmpty],
            			matrUnit : [r_notEmpty],
            			cost : [r_notEmpty, r_onlyNumber, r_maxLen+"|16"],
            			amt : [r_notEmpty, r_onlyNumber, r_maxLen+"|16"],
            			deliDate : [r_notEmpty]
            	};                
                
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                
                if($('#stDate').val() == ''){
                	byId("stDate").value = t;
                }else{
                	fn_search("grid");
                }
                
                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn5"){
        				fn_insert();
        			}
        		});
                //popUp
                gridMain.attachEvent("onRowSelect",doOnRowSelect);
                
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                
                function doOnRowSelect(rowId, colIdx){
                	fn_search("top");
                }
                
                function doOnRowDblClicked(rowId, colIdx) {
                    var param = ""
                    if (colIdx == 1) {
                        gfn_load_pop('w1', 'common/matrCodePOP', true, {
                            "matrCode": param
                        }); 
                    }
                }        
                
                $("#custName").dblclick(function(){
                	gfn_load_pop('w1', 'common/customPOP', true, {"custKorName": ""});
                });
                
                fn_onClosePop = function(pName, data) {
                    var i;
                    var obj = {};
                    if (pName == "matrCode"){ 
                        for (i = 0; i < data.length; i++) {
                            obj.matrCode = data[i].matrCode;
                            obj.matrName = data[i].matrName;
                            obj.matrSpec = data[i].matrSpec;
                            obj.matrUnit = data[i].matrUnit;
                            
                            var selRowIdx = gridMain.getSelectedRowIndex();
                            var matrCodeIdx = gridMain.getColIndexById('itemCode');
                            var matrNameIdx = gridMain.getColIndexById('matrName');
                            var matrSpecIdx = gridMain.getColIndexById('matrSpec');
                            var matrUnitIdx = gridMain.getColIndexById('matrUnit');
                            
                            gridMain.setCells2(selRowIdx, matrCodeIdx).setValue(obj.matrCode);
                            gridMain.setCells2(selRowIdx, matrNameIdx).setValue(obj.matrName);
                            gridMain.setCells2(selRowIdx, matrSpecIdx).setValue(obj.matrSpec);
                            gridMain.setCells2(selRowIdx, matrUnitIdx).setValue(obj.matrUnit);
                        }                
                	}else if(pName == "custCode"){
                        $("#custCode").val("");
                        $("#custName").val("");
                        $("#custCode").val(data[0].custCode);
                        $("#custName").val(data[0].custKorName);
                	}else if(pName == "empNo"){
                		popUpCallback(data);
                	}
                };                
            });
                
            function fn_insert() {
              	var totalRowNum = gridMain.getRowsNum();
                var selRowIdx = gridMain.getSelectedRowIndex();  
                var setNoIdx = gridMain.getColIndexById('setNo');
                gridMain.addRow();
                gridMain.selectRow(totalRowNum);
                gridMain.setCells2(totalRowNum, setNoIdx).setValue(leadingZeros(totalRowNum+1, 3));
        	}
            
            function fn_delete(){
            	var rodid = gridMain.getSelectedRowId();
            	var setNoIdx = gridMain.getColIndexById('setNo');
            	var totalRowNum = gridMain.getRowsNum();
            	var selRowIdx = gridMain.getSelectedRowIndex();
            	
            	gridMain.cs_deleteRow(rodid); 
            	
            	for(var i=selRowIdx; i<gridMain.getRowsNum();i++){
            		gridMain.setCells2(i, setNoIdx).setValue(leadingZeros(i+1, 3));	 
            	}         	
            };
            
            function fn_remove(){
            	for(var i=0; i<gridMain.getRowsNum();i++){
            		gridMain.cs_deleteRow(gridMain.getRowId(i));	 
            	}
            };          
            
            function fn_getSeqReturn() {
                var obj = {};
                obj.tableName = 'TBL_PURC_CONSULT_MST';
                obj.seqColumn = 'SET_SEQ';
                obj.dateColumn1 = 'SET_DATE';
                obj.columnData1 = $("#stDate").val().split("/").join("");
                obj.dateColumn2 = "COMP_ID";
                obj.columnData2 = "${compId}";
                obj.returnLen = 3;
                gfn_callAjaxComm(obj, "/erp/plan/purc/purcConferS/seqReturn", fn_SetSeq);
            }

            function fn_SetSeq(data) {
            	$("#setSeq").val(data[0].seq);
            	$("#seqNo").val(data[0].seq);
            }            
            
            function fn_search(type) {
                $("input[name=empName]").attr("disabled",false);
                $("input[name=setDate]").val($("#stDate").val().split("/").join(""));
                
                var param = gfn_getFormElemntsData('frmSearch');

                if(type == "top"){
                	loadPaymentsHistory("/erp/plan/purc/purcConferS/topMainSel", param, fn_gridMainSelCallbckFunc);
                }else{
                	gfn_callAjaxForGrid(gridMain, param, "/erp/plan/purc/purcConferS/gridMainSel", subLayout.cells("a"), fn_gridMainSelCallbckFunc);                	
                }
            }        
            
            function fn_gridMainSelCallbckFunc(data) {
                $("input[name=empName]").attr("disabled",true);
                if($("#empNo").val() == "%"){
                	$("#empNo").val("");
                };
                $("#stDate").keyup();
            }            
            
            function fn_new(){
            	byId("frmSearch").reset();
            	$("#setSeq").val("");
            	$("#seqNo").val("");
                var t = dateformat(new Date());
                byId("stDate").value = t;
                $('#stDate').keyup();
            	gridMain.clearAll();        
            	paymentCheck();
            };
            
            function fn_save() {
            	var mstCudKey = "";
            	
            	if($("#custName").val() == ""){
            		alert("공급업체를 선택하세요.");
            		$("#custName").focus();
            		return false;
            	}            	
            	
            	if($("#seqNo").val()==null||$("#seqNo").val()=="" ||typeof $("#seqNo").val()=="undefined"){
            		mstCudKey = "INSERT";
            		fn_getSeqReturn();
            	}else{
            		mstCudKey = "UPDATE";
            	}

              	var totalRowNum = gridMain.getRowsNum();
                var selRowIdx = gridMain.getSelectedRowIndex();       
                var setSeqTemp = gridMain.getColIndexById('setSeqTemp');
                var setDateTemp = gridMain.getColIndexById('setDateTemp');
                
                for(var i=0; i<totalRowNum; i++){
                    gridMain.setCells2(i, setSeqTemp).setValue($("#setSeq").val());
                    gridMain.setCells2(i, setDateTemp).setValue($("#setDate").val());
                }              	
                
                var jsonStr = gridMain.getJsonUpdated2();
                $("#jsonData").val(jsonStr);
                var frmParam = $("#frmServer").serialize();
                
                if (jsonStr == null || jsonStr.length <= 0){
                	return false;
                }else{
                	saveTopMainGrid("/erp/plan/purc/purcConferS/gridTopSave", mstCudKey);
                	
                    $.ajax({
                        url: "/erp/plan/purc/purcConferS/gridMainSave",
                        type: "POST",
                        data: frmParam,
                        async: true,
                        success: function(data) {
                            fn_gridMainSaveCallbckFunc(data);
                        }
                    });                    	
                }
            }
            
            function fn_gridMainSaveCallbckFunc(data) {
                dhtmlx.alert("저장 완료");
                fn_search("top");
            }        
            
            function leadingZeros(n, digits) {
           	  var zero = '';
           	  n = n.toString();

           	  if (n.length < digits) {
           	    for (var i = 0; i < digits - n.length; i++)
           	      zero += '0';
           	  }
           	  return zero + n;
            }            
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
				<form id="frmServer">
					<input type="hidden" id="jsonData" name="jsonData">
				</form>             
                <form class="form-horizontal" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;" id="frmSearch">
                	<input type="hidden" name="setDate" id="setDate">
                	<input type="hidden" name="custCode" id="custCode">
                	
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">일자</label>
                                    <div class="col-sm-2 col-md-2">
                                        <div class="col-sm-10 col-md-10">
                                            <input name="stDate" id="stDate" type="text" value="${setDate}" placeholder="" class="form-control input-xs format_date">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker1" class="calicon form-control">
                                        </div>
                                    </div>
                                    <div class="col-sm-1 col-md-1">
                                        <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
		                                    <input name="seqNo" id="seqNo" type="text" value="${setSeq}" placeholder="" class="form-control input-xs" disabled="disabled">
		                                    <input name="setSeq" id="setSeq" type="hidden" value="${setSeq}">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">품의자</label>
                                    <div class="col-sm-2 col-md-2">
		                                <input name="empNo" id="empNo" type="hidden" value="${empNo}">
		                                <input name="empName" id="empName" type="text" value="${empName}" placeholder="" class="form-control input-xs" disabled="disabled">
                                    </div>
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">공급업체 </label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group form-group-sm">
                                <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/erp/common/appvTable.jsp"></jsp:include>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>        