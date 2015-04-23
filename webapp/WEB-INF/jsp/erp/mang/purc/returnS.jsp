<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        	var layout, toolbar, subLayout
            var gridMain;
            var calMain;
            var gfn_load_popup;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 2, 3, 4, 5, 6], "1C"); //반품등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9
                gridMain.setHeader("No,입고일자,품목,규격,단위,수량,단가,금액,반품사유", null, []);
                gridMain.setInitWidths("50,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,left,left,center,right,right,right,left");
                gridMain.setColTypes("ron,ro,ed,ed,ed,edn,edn,edn,ed");
                gridMain.setColSorting("str,date,str,str,str,str,int,int,int,str");
                gridMain.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                
                
                function page_popup(subject,view_path){
                	var w2;
                	var eleId = "container";
                	dhxWins = new dhtmlXWindows();
                	dhxWins.attachViewportTo(eleId);
                		
                	w2 = dhxWins.createWindow(eleId, 50, 80, 1120, 500);
                	     dhxWins.window(eleId).setText(subject);
                	// iframe, get
                	w2.attachURL("/erp/popup/"+view_path+".do");
                	return w2;
                }
				
                //항목삽입
                toolbar.attachEvent("onClick", function(id) {
					if(id == "btn5"){
						fn_insert();
					}
				});
                //popUp
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			if(colId==1){
        				page_popup('입고내역 도우미창','mang/inStockPOP');
        				
        			}
        		} 
        		
        		//editcell
                gridMain.attachEvent("onRowSelect", function(id,ind){
                	gridMain.editCell();
                	});
            })
                
            function fn_insert() {
            		gridMain.addRow(gridMain.getUID(),"1,,TEST,TEST,TEST,100,100.00,10000.00,TEST",1);
			}
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                       <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                                <div class="col-sm-1 col-md-1">
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                        <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
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
                                    <input name="supplCompName" id="supplCompName" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('공급업체','common/supplyCompCodePOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    등록자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>