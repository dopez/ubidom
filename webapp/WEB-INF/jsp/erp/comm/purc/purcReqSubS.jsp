<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(3, [1, 2, 3, 4, 5, 6], "1C"); //구매의뢰(원부자재)등록
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");      //10 col
	gridMain.setHeader("No,품목코드,품명,규격,단위,수량,단가,금액,납기일자,용도,첨부", null, 
				[]);
	gridMain.setInitWidths("50,200,200,150,100,100,100,100,100,200,100");       
	gridMain.setColAlign("center,left,left,left,center,right,right,right,center,center,center");     
	gridMain.setColTypes("ro,ro,ro,ed,ed,edn,edn,edn,ed,ed,ed"); 
	gridMain.setColSorting("str,str,str,str,str,int,int,int,date,str,str");
	gridMain.init();
	/* subLayout.cells("a").appendObject("tdisLabel01").init(); */

	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
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
				gfn_load_popup('품목코드','common/itemPOP');
			}
		}
        gridMain.attachEvent("onRowSelect", function(id,ind){
         	gridMain.editCell();
      	});
    })
        
    function fn_insert() {
			
    		gridMain.addRow(gridMain.getUID(),"1,,,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
	}

</script>
<style>
            table {
                text-align: center;
                vertical-align: middle;
            }
        </style>
        <div id="container" style="position: relative; widtd: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">일자</label>
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
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">공급업체</label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="supplCompName" id="supplCompName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('공급업체','common/supplyCompCodePOP')">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                        의뢰자 </label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="rqstName" id="rqstName" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group form-group-sm">
                                <table class="table table-bordered">
                                    <tr>
                                        <td id="appv" rowspan="2">
                                            결
                                            <br>
                                            <br>재
                                        </td>
                                        <td id="appv">작성</td>
                                        <td id="appv">검토</td>
                                        <td id="appv">검토</td>
                                        <td id="appv">승인</td>
                                    </tr>
                                    <tr>
                                        <td id="appv" class="col-md-3">
                                            <div class="col-sm-8 col-md-8 appvBottomPadding">
                                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                            </div>
                                            <div class="col-sm-4 col-md-4">
                                                <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                            <div>
                                                <select class="form-control input-xs">
                                                    <option>미결</option>
                                                    <option>전결</option>
                                                    <option>무결</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td id="appv" class="col-md-3">
                                            <div class="col-sm-8 col-md-8 appvBottomPadding">
                                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                            </div>
                                            <div class="col-sm-4 col-md-4">
                                                <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                            <div>
                                                <select class="form-control input-xs">
                                                    <option>미결</option>
                                                    <option>전결</option>
                                                    <option>무결</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td id="appv" class="col-md-3">
                                            <div class="col-sm-8 col-md-8 appvBottomPadding">
                                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                            </div>
                                            <div class="col-sm-4 col-md-4">
                                                <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                            <div>
                                                <select class="form-control input-xs">
                                                    <option>미결</option>
                                                    <option>전결</option>
                                                    <option>무결</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td id="appv" class="col-md-3">
                                            <div class="col-sm-8 col-md-8 appvBottomPadding">
                                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                            </div>
                                            <div class="col-sm-4 col-md-4">
                                                <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </button>
                                            </div>
                                            <div>
                                                <select class="form-control input-xs">
                                                    <option>미결</option>
                                                    <option>전결</option>
                                                    <option>무결</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>