<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        	var layout, toolbar, subLayout
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

            	Ubi.setContainer(2,[1,2,3,4], "2E"); //구매품의결재등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();


                //form//
                layout.cells("b").attachObject("bootContainer2");

                //up

				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("품의내역");
				
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //12 col
                gridMst.setHeader("No,품의자,의뢰부서,의뢰자,공급업체,품의금액,결재금액,선택,결재,#cspan,#cspan,#cspan", null,[]);
                gridMst.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,작성,검토,검토,승인", []);
                gridMst.attachFooter("&nbsp;,합계,#cspan,#cspan,#cspan,0,0");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,left,left,left,left,right,right,center,center,center,center,center");
                gridMst.setColTypes("ron,ed,ed,ed,ed,edn,edn,ra,ed,radioCell,radioCell,radioCell");
                
                gridMst.setColSorting("int,str,str,str,str,int,int,str,str,str,str,str");
                gridMst.init();

                //down
  				subLayout.cells("b").showHeader();
				subLayout.cells("b").setText("품의상세내역");
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //13col
                gridDtl.setHeader("No,품명,규격,단위,수량,단가,금액,납기일자,용도,구매제외사유,선택,#cspan,#cspan", null, []);
                gridDtl.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,구매,보류,취소", []);
                gridDtl.attachFooter("&nbsp;,합계,#cspan,#cspan,0,0,0");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,left,center,left,left,left,left,center,center,center,center,center");
                gridDtl.setColTypes("ron,ed,ed,ed,edn,edn,edn,dhxCalendar,ed,ed,radioCell01,radioCell02,radioCell03");
                gridDtl.setColSorting("int,str,str,str,int,int,int,date,str,str,na,na,na");
                gridDtl.init();
				
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;

              //editcell
                gridDtl.attachEvent("onRowSelect", function(id,ind){
                	gridDtl.editCell();
                	});
                gridMst.attachEvent("onRowSelect", function(id,ind){
                	gridMst.editCell();
                	});
             //항목삽입
                   toolbar.attachEvent("onClick", function(id) {
           			if(id == "btn2"){
           				fn_insert();
           			}
           		});
                   //popUp
                   gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
                   function doOnRowDblClicked(rowId,colId){
           			if(colId==1){
           				gfn_load_popup('제품코드','common/goodsCodePOP');
	           			}
	           		}
                   gridMst.attachEvent("onCheck",doOnCheck);
                   function doOnCheck(rowId,colId){
              		if(colId==7){
              			gridDtl.addRow(gridDtl.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,,,",1);
	              		}
	              	}
               })
                   
               function fn_insert() {
               		gridMst.addRow(gridMst.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,,TEST,,,,",1);
               		
           	}

///////////////////////two radio in 1 col/////////////////////////
				function eXcell_radioCell(cell) 
			{
			    if (cell) 
			    {
			        this.cell = cell;
			        this.grid = this.cell.parentNode.grid;
			    }
			    this.setValue=function(val) 
			    {
			        var row_id=this.cell.parentNode.idd;
			        var value = "<input type='radio' name='myradio" + row_id + "' value='0'/>결재";
			        value += '<br/>';
			        value += "<input type='radio' name='myradio" + row_id + "' value='1'/>반려";
			        this.setCValue(value);
			    }
			    this.getValue=function(val)
			    {
			        var row_id=this.cell.parentNode.idd;
			       //return {value};
			       return this.cell.firstChild.value;
			    }
			}
			
			eXcell_radioCell.prototype = new eXcell; 
			
			function eXcell_radioCell01(cell) 
			{
			    if (cell) 
			    {
			        this.cell = cell;
			        this.grid = this.cell.parentNode.grid;
			    }
			    this.setValue=function(val) 
			    {
			        var row_id=this.cell.parentNode.idd;
				        var value = "<input type='radio' name='radioPurc" + row_id + "' value='1'/>";
			        this.setCValue(value);
			    }
			    this.getValue=function(val)
			    {
			        var row_id=this.cell.parentNode.idd;
			       return this.cell.firstChild.value;
			    }
			}
			eXcell_radioCell01.prototype = new eXcell; 
			
			function eXcell_radioCell02(cell) 
			{
			    if (cell) 
			    {
			        this.cell = cell;
			        this.grid = this.cell.parentNode.grid;
			    }
			    this.setValue=function(val) 
			    {
			        var row_id=this.cell.parentNode.idd;
				        var value = "<input type='radio' name='radioPurc" + row_id + "' value='2'/>";
			        this.setCValue(value);
			    }
			    this.getValue=function(val)
			    {
			        var row_id=this.cell.parentNode.idd;
			       return this.cell.firstChild.value;
			    }
			}
			eXcell_radioCell02.prototype = new eXcell; 
			
			function eXcell_radioCell03(cell) 
			{
			    if (cell) 
			    {
			        this.cell = cell;
			        this.grid = this.cell.parentNode.grid;
			    }
			    this.setValue=function(val) 
			    {
			        var row_id=this.cell.parentNode.idd;
				        var value = "<input type='radio' name='radioPurc" + row_id + "' value='3'/>";
			        this.setCValue(value);
			    }
			    this.getValue=function(val)
			    {
			        var row_id=this.cell.parentNode.idd;
			       return this.cell.firstChild.value;
			    }
			}
			eXcell_radioCell03.prototype = new eXcell; 
		////////////////////////////////////////////////////////////////////////
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
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 결재자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="appvName" id="appvName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>