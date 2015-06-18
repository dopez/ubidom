<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMain;
            var calMain;
            var PscrnParm = parent.scrnParm;
            var nDate;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 2, 3, 4, 5, 6], "1C"); //시험검사의뢰등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                //gridMain = subLayout.cells("a").attachGrid();
                gridMain = new dxGrid(subLayout.cells("a"),false);
                gridMain.addHeader({name:"No",colId:"setNo",width:"50",align:"center",type:"ro"});
                gridMain.addHeader({name:"품목코드",colId:"itemCode",width:"100",align:"center",type:"combo"});
                gridMain.addHeader({name:"품명",colId:"matrName",width:"100",align:"center",type:"ed"});
                gridMain.addHeader({name:"규격",colId:"matrSpec",width:"100",align:"left",type:"ed"});
                gridMain.addHeader({name:"단위",colId:"matrUnit",width:"100",align:"left",type:"ed"});
                gridMain.addHeader({name:"단가",colId:"cost",width:"100",align:"left",type:"ed"});
                gridMain.addHeader({name:"금액",colId:"amt",width:"100",align:"left",type:"ed"});
                gridMain.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"center",type:"dhxCalendarA"});
                gridMain.addHeader({name:"납기장소",colId:"deliPlace",width:"100",align:"left",type:"ed"});
                gridMain.setUserData("","pk","");
                gridMain.setColSort("str");
                gridMain.dxObj.setUserData("","@deliDate","format_date");
                gridMain.init();                
                
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
        	   			$("button").each(function(index){
        	   				if(btnEvt == this.id){
        	   					var i = index+2;
        	   					var korNameId = "sttleKorName"+i;
        	   					var empId = "sttleEmp"+i;
        	   					$("#"+empId).val("");
        	   					$("#"+korNameId).val("");
        	   					$("#"+empId).val(data[0].empNo);
        	   					$("#"+korNameId).val(data[0].korName);
        	   				}	   				
        	   			});
                	}
                };                
            });
                
            function fn_insert() {
            	gridMain.addRow();
        	}
            
            function fn_delete(){
            	var rodid = gridMain.getSelectedRowId();
            	gridMain.cs_deleteRow(rodid); 
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
            }            
            
            function fn_search(type) {
                $("input[name=empNo]").attr("disabled",false);
                $("input[name=setSeq]").attr("disabled",false);
                
                $("input[name=setDate]").val($("#stDate").val().split("/").join(""));
                
                var param = gfn_getFormElemntsData('frmSearch');

                if(type == "top"){
                	var topData = gfn_callAjaxComm(param, "/erp/plan/purc/purcConferS/topMainSel", fn_gridMainSelCallbckFunc);
                	
                	$(topData).each(function(index){
                		var settle2State = topData[index].settle2State;
                		var settle3State = topData[index].settle3State;
                		var settle4State = topData[index].settle4State;
                		var empNo = topData[index].empNo;
                		
                		$("#custCode").val(topData[index].custCode);
                		$("#custName").val(topData[index].custName);
                		
                		$("#sttleEmp2").val(topData[index].sttle2Emp);
                		$("#sttleKorName2").val(topData[index].settle2EmpName);
                		$("#sttleSelectBox2 option").each(function(index){
                			if($("#sttleSelectBox2 option").eq(index).val() == settle2State){
                				$("#sttleSelectBox2 option").eq(index).attr("selected", "selected")
                			}
                		});
                		$("#sttleEmp3").val(topData[index].sttle3Emp);
                		$("#sttleKorName3").val(topData[index].settle3EmpName);
                		$("#sttleSelectBox3 option").each(function(index){
                			if($("#sttleSelectBox3 option").eq(index).val() == settle3State){
                				$("#sttleSelectBox3 option").eq(index).attr("selected", "selected")
                			}
                		});                		
                		$("#sttleEmp4").val(topData[index].sttle4Emp);
                		$("#sttleKorName4").val(topData[index].settle4EmpName);
                		$("#sttleSelectBox4 option").each(function(index){
                			if($("#sttleSelectBox4 option").eq(index).val() == settle4State){
                				$("#sttleSelectBox4 option").eq(index).attr("selected", "selected")
                			}
                		});                		
                	});
                	
                }else{
                	gfn_callAjaxForGrid(gridMain, param, "/erp/plan/purc/purcConferS/gridMainSel", subLayout.cells("a"), fn_gridMainSelCallbckFunc);                	
                }
            }        
            
            function fn_gridMainSelCallbckFunc(data) {

                $("input[name=empNo]").attr("disabled",true);
                $("input[name=setSeq]").attr("disabled",true);
                if($("#empNo").val() == "%"){
                	$("#empNo").val("");
                };
                $("#stDate").keyup();
            }            
            
            function fn_new(){
            	gridMain.clearAll();
            	$('#setSeq').val('');
            };
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
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
                                            <input name="setSeq" id="setSeq" type="text" value="${setSeq}" placeholder="" class="form-control input-xs" disabled="disabled">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">품의자</label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="empNo" id="empNo" type="text" value="${empNo}" placeholder="" class="form-control input-xs" disabled="disabled">
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