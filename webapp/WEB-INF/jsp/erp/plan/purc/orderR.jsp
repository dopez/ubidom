<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMain, gridSub;
            var calMain;
            var mainMenu = parent.mainMenu;
            var mainTabbar = parent.mainTabbar;
            var tabId = null;
            var uri = null;
            $(document).ready(function() {
                Ubi.setContainer(3, [1, 8, 9], "1C"); //발주조회

            	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();             	
            	
                layout.cells("b").attachObject("bootContainer2");
				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("품의내역");

                gridMain = new dxGrid(subLayout.cells("a"),false);
                gridMain.addHeader({name:"No",colId:"no",width:"50",align:"center",type:"cntr"});
                gridMain.addHeader({name:"품의일자",colId:"setDate",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"품의자",colId:"empName",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"공급업체",colId:"custName",width:"100",align:"left",type:"ro"});
                gridMain.addHeader({name:"품명",colId:"matrName",width:"100",align:"center",type:"ed"});
                gridMain.addHeader({name:"규격",colId:"matrSpec",width:"100",align:"center",type:"ed"});
                gridMain.addHeader({name:"단위",colId:"matrUnit",width:"100",align:"left",type:"ed"});
                gridMain.addHeader({name:"수량",colId:"qty",width:"100",align:"right",type:"edn"});
                gridMain.addHeader({name:"단가",colId:"cost",width:"100",align:"right",type:"edn"});
                gridMain.addHeader({name:"금액",colId:"amt",width:"100",align:"right",type:"edn"});
                gridMain.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"center",type:"dhxCalendarA"});
                gridMain.setUserData("","pk","no");
                gridMain.setColSort("str");
                gridMain.dxObj.setUserData("", "@setDate","format_date");
                gridMain.dxObj.setUserData("", "@deliDate","format_date");
                gridMain.init();
                gridMain.cs_setNumberFormat(["qty", "cost", "amt"], "0,000");
                gridMain.cs_setColumnHidden(["compId", "setSeq", "setNo", "purcConsultKey", "custCode"]);                
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                
                calMain = new dhtmlXCalendarObject([{input:"setSDate",button:"calpicker1"},{input:"setEDate",button:"calpicker2"}]);
            	calMain.loadUserLanguage("ko");
            	calMain.hideTime();
            	var t = dateformat(new Date());
            	byId("setSDate").value = t;
            	byId("setEDate").value = t;
            	
                $("#custName").dblclick(function(){
                	gfn_load_pop('w1', 'common/customPOP', true, {"custKorName": ""});
                });   
                
                $("#postName").dblclick(function(){
                	gfn_load_pop('w1', 'common/deptCodePOP', true, {"postName": ""});
                });                   
                
                fn_onClosePop = function(pName, data) {
                    var i;
                    var obj = {};
                    if(pName == "custCode"){
                        $("#custCode").val("");
                        $("#custName").val("");
                        $("#custCode").val(data[0].custCode);
                        $("#custName").val(data[0].custKorName);
                	}else if(pName == "postCode"){
                        $("#postCode").val("");
                        $("#postName").val("");
                        $("#postCode").val(data[0].postCode);
                        $("#postName").val(data[0].postName);
                	}
                };    
            });
            
            function doOnRowDblClicked(rId, cInd){
            	var cFlag = true;
            	var setDateIdx = gridMain.getColIndexById('setDate');
            	var setSeqIdx = gridMain.getColIndexById('setSeq');
            	var purcConsultKeyIdx = gridMain.getColIndexById('purcConsultKey');
            	var custCodeIdx = gridMain.getColIndexById('custCode');
            	var custNameIdx = gridMain.getColIndexById('custName');
            	
            	var dateValue = gridMain.setCells(rId,setDateIdx).getValue();
            	var seqValue = gridMain.setCells(rId,setSeqIdx).getValue();
            	var purcConsultKeyValue = gridMain.setCells(rId,purcConsultKeyIdx).getValue();
            	var custCodeValue = gridMain.setCells(rId,custCodeIdx).getValue();
            	var custNameValue = gridMain.setCells(rId,custNameIdx).getValue();
            	
            	var ids = mainTabbar.getAllTabs();
            	var preId = "1000000771";
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
            		mainTabbar.tabs(preId).attachURL("/"+uri+".do",false,
	            		{
	            			setDate:dateValue, 
	            			setSeq:seqValue,
	            			custCode : custCodeValue,
	            			custName : custNameValue,
	            			purcConsultKey:purcConsultKeyValue
	            		}
            		);	
            	}            	
            }
            
            function fn_search() {
                var param = gfn_getFormElemntsData('frmSearch');
                gfn_callAjaxForGrid(gridMain, param, "/erp/plan/purc/orderR/gridMainSel", subLayout.cells("a"), fn_gridMainSelCallbckFunc)
            }               
            
            function fn_gridMainSelCallbckFunc(data) {
                $("#setSDate").keyup();
                $("#setEDate").keyup();
            }                          
            
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
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
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 의뢰부서 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
                                    <input type="hidden" name="postCode" id="postCode">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 공급업체 </label>
                                <div class="col-sm-2 col-md-2">
                                	<input type="hidden" name="custCode" id="custCode">
                                    <input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>