<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
            var gridMst;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(4, [1, 3, 4, 5, 6], "2E"); //세금계싼서생성

             	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");
                

                //grid	
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //7
                gridMst.setHeader("No,고객,공급가액,세액,발행일자,구분,발행");
                gridMst.attachFooter("&nbsp;,합계,0,0");
                gridMst.setInitWidths("100,100,100,100,100,130,100");
                gridMst.setColAlign("center,left,right,right,center,center,center");
                gridMst.setColTypes("ron,ed,edn,edn,dhxCalendar,radioCell,ra");
                gridMst.setColSorting("int,str,int,int,date,str,str");
                gridMst.init();

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //9
                gridDtl.setHeader("No,출하일자,고객,품명,규격,수량,단가,공급가액,세액");
                gridDtl.attachFooter("&nbsp;,합계,#cspan,#cspan,#cspan,0,0,0,0");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,left,left,left,right,right,right,right");
                gridDtl.setColTypes("ron,dhxCalendar,ed,ed,ed,edn,edn,edn,edn");
                gridDtl.setColSorting("int,date,str,str,str,int,int,int,int");
                gridDtl.init();
                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
                	gridDtl.addRow(gridDtl.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
        		}
                toolbar.attachEvent("onClick", function(id) {
           			if(id == "btn1"){
           				fn_insert();
           			}
           		});
            })
               function fn_insert() {
               		gridMst.addRow(gridMst.getUID(),"TEST,TEST,TEST,TEST,TEST,,",1);
               		
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
			        var value = "<input type='radio' name='myradio" + row_id + "' value='0'/>청구";
			        value += "<input type='radio' name='myradio" + row_id + "' value='1'/>영수";
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
        <div id="container" style="position: relative; width: 100%; height: 100%; ">
        </div>
        <div id="bootContainer2">
        <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
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
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객코드','common/customPOP')">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('담당사원','common/chargePOP')">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
					<div class="form-group form-group-sm">
						<div class="col-sm-8 col-md-8">
							<label class=" col-sm-2 col-md-2 control-label"
								for="textinput"> 구분 </label>
							<div class="col-sm-4 col-md-4">
								
								<div class="col-xs-4 col-sm-4 col-md-4">
								  <input type="radio"
									name="searchGbn" value="1" checked="checked">일반
								 
								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
								  <input type="radio"
									name="searchGbn" value="2">영세
								
								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
								  <input type="radio"
									name="searchGbn" value="3">면세
								
								</div>
							
							</div>
							
						<div class="col-sm-6 col-md-6">
                            <div class="col-sm-6 col-md-6">
                                <input name="" id="" type="button" value="세금계산서생성" placeholder="" class="btn btn-default btn-xs form-control">
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <input name="" id="" type="button" value="매출전표생성" placeholder="" class="btn btn-default btn-xs form-control">
                            </div>
                        </div>
						</div>
					</div>
					
				</div>
            </form>
            </div>
        </div>