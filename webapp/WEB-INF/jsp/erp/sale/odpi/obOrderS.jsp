<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
        var gridMain;   
        $(document).ready(function(){
        	Ubi.setContainer(2,[1,2,3,4,5,6],"1C");
        	layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();
        	//수주등록
        	

                //form//
                layout.cells("b").attachObject("bootContainer2");
                layout.cells("b").setHeight(204);

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //17
                gridMain.setHeader("No,품목코드,품명,포장,단위,통화단위,단가,수량,금액,납기일자,납품장소,재고수량,출고요청,생산의뢰,품검요청,개발요청,구분");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,150");
                gridMain.setColAlign("center,left,left,center,center,right,right,right,right,center,center,right,center,center,center,center,center");
                gridMain.setColTypes("ron,ed,ed,ed,ed,ed,edn,edn,edn,dhxCalendar,ed,edn,ch,ch,ch,ch,radioCell");
                gridMain.setColSorting("int,str,str,str,str,str,int,int,int,date,str,int,str,str,str,str,str");
                gridMain.init();

                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                
                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn5"){
        				fn_insert();
        			}
        		});
                //popUp
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			if(colId==1){
        				gfn_load_popup('품목코드','common/itemCodePOP');
        			}
        		}
            })
                
            function fn_insert() {
            		gridMain.addRow(gridMain.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,radioCell",1);
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
	        var value = "<input type='radio' name='myradio" + row_id + "' value='0' checked='checked'/>매출";
	        value += "<input type='radio' name='myradio" + row_id + "' value='1'/>Sample";
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
        <div id="container" style="position: relative; width: 100%; height: 100%;">
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
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('고객코드','common/customCodePOP')">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 매출구분 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객PO No </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 결제조건 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 인도조건 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 선적항 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 도착항 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 특이사항 </label>
                            <div class="col-sm-6 col-md-6">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                <input type="button" id="" name="" value="Excel Upload"> </label>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>