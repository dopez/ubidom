<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        	var layout, toolbar, subLayout;
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

            	Ubi.setContainer(2,[2,3,4], "2E"); //출입허가결재

            	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");



                //up

				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("신청내역");
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //7 col
                gridMst.setHeader("작성일자,작성자,출입자 정보,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,결재,#cspan,#cspan,#cspan" ,null,[]);
                gridMst.attachHeader("#rspan,#rspan,성명,직위,소속,시작일자,종료일자,기간,신청사유,작성,검토,검토,승인" ,[]);
                
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridMst.setColTypes("dhxCalendar,ed,ed,ed,ed,dhxCalendar,dhxCalendar,ed,ed,ed,radioCell,radioCell,radioCell");
                gridMst.init();

                //down
  				subLayout.cells("b").showHeader();
				subLayout.cells("b").setText("출입허가지역");

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //13col
                gridDtl.setHeader("등급,지역,신청,허가,지역,신청,허가,지역,신청,허가,지역,신청,허가", null, []);
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridDtl.setColTypes("ron,ed,ra,radioCell,ed,ra,radioCell,ed,ra,radioCell,ed,ra,radioCell");
                gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str");
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
                	gridDtl.addRow(gridDtl.getUID(),"TEST,TEST,TEST,,TEST,TEST,,TEST,TEST,,TEST,TEST,",1);
                	gridMst.editCell();
                	});
                
                /* gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked); */
                /* function doOnRowDblClicked(rowId,colId){
        				gridDtl.addRow(gridDtl.getUID(),"TEST,TEST,TEST,,TEST,TEST,,TEST,TEST,,TEST,TEST,",1);
        		} */
             //항목삽입
                   toolbar.attachEvent("onClick", function(id) {
           			if(id == "btn2"){
           				fn_insert();
           			}
           		});
            })
               function fn_insert() {
               		gridMst.addRow(gridMst.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,,,",1);
               		
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
			        var value = "<input type='radio' name='myradio" + row_id + "' value='0'/>가";
			        value += "<input type='radio' name='myradio" + row_id + "' value='1'/>부";
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
		////////////////////////////////////////////////////////////////////////


        </script>
        <style>

        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
        <div class="container">
            <form class="form-horizontal" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;" id="frmSearch">
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