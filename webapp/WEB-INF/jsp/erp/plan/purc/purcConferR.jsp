<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMain;
            var calMain;
            var mainMenu = parent.mainMenu;
            var mainTabbar = parent.mainTabbar;
            var tabId = null;
            var uri = null;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 8, 9], "1C"); //재료출고의뢰조회

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = new dxGrid(subLayout.cells("a"),false);
                gridMain.addHeader({name:"No",colId:"",width:"50",align:"center",type:"cntr"});
                gridMain.addHeader({name:"품의일자",colId:"setDate",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"품의자",colId:"empNo",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"공급업체",colId:"custName",width:"100",align:"left",type:"ro"});
                gridMain.addHeader({name:"품명",colId:"matrName",width:"100",align:"left",type:"ro"});
                gridMain.addHeader({name:"규격",colId:"matrSpec",width:"100",align:"left",type:"ro"});
                gridMain.addHeader({name:"단위",colId:"matrUnit",width:"100",align:"left",type:"ro"});
                gridMain.addHeader({name:"수량",colId:"qty",width:"100",align:"right",type:"ron"});
                gridMain.addHeader({name:"단가",colId:"cost",width:"100",align:"right",type:"ron"});
                gridMain.addHeader({name:"금액",colId:"amt",width:"100",align:"right",type:"ron"});
                gridMain.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"center",type:"ro"});
                gridMain.setUserData("","pk","");
                gridMain.setColSort("str");
                gridMain.dxObj.setUserData("","@setDate","format_date");
                gridMain.dxObj.setUserData("","@deliDate","format_date");
                gridMain.init();    
                gridMain.cs_setNumberFormat(["qty","cost","amt"], "0,000");
                gridMain.cs_setColumnHidden(["setSeq"]);
                gridMain.attachEvent("onRowDblClicked",doOnRowDbClicked);
                
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{input:"setSDate",button:"calpicker1"},{input:"setEDate",button:"calpicker2"}]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("setSDate").value = t;
                
                
                $("#custName").dblclick(function(){
                	gfn_load_pop('w1', 'common/customPOP', true, {"custKorName": ""});
                });
                
                fn_onClosePop = function(pName, data) {
                    $("#custCode").val("");
                    $("#custName").val("");
                    $("#custCode").val(data[0].custCode);
                    $("#custName").val(data[0].custKorName);
                };
                
            })
            
            function fn_search() {
                var param = gfn_getFormElemntsData('frmSearch');

                gfn_callAjaxForGrid(gridMain, param, "/erp/plan/purc/purcConferR/gridMainSel", subLayout.cells("a"), fn_gridMainSelCallbckFunc)
            }   
            
            function fn_gridMainSelCallbckFunc(data) {
                $("#setSDate").keyup();
                $("#setEDate").keyup();
            }                    
            
            function doOnRowDbClicked(rId,cInd){
            	var cFlag = true;
            	var setDateIdx = gridMain.getColIndexById('setDate');
            	var setSeqIdx = gridMain.getColIndexById('setSeq');
            	var dateValue = gridMain.setCells(rId,setDateIdx).getValue();
            	var seqValue = gridMain.setCells(rId,setSeqIdx).getValue();
            	var ids = mainTabbar.getAllTabs();
            	var preId = "1000000776";
            	for(var i=0;i<ids.length;i++){
            		if(ids[i] == preId){
            			if(MsgManager.confirmMsg("INF006")) { 
            				mainTabbar.tabs(preId).close();
            				cFlag = true;
            			}else{
            				cFlag = false;
            				return;
            			}
            		}
            	}
            	if(cFlag){
            		var uri = mainMenu.getUserData(preId, "uri");
            		var menuItemText = mainMenu.getDxObj().getItemText(preId);
            		mainTabbar.addTab(preId, menuItemText, null, null, true, true);
            		mainTabbar.tabs(preId).attachURL("/"+uri+".do",false,{setDate:dateValue,setSeq:seqValue});	
            	}
            };            
            
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                	<input type="hidden" name="custCode" id="custCode" value="">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 기간 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs format_date" name="setSDate" id="setSDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'setEDate', 'max')">
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs format_date" name="setEDate" id="setEDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'setSDate', 'min')">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 공급업체 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>