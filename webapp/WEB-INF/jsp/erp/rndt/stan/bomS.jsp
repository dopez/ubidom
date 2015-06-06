<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
        <script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,gridDtl,subLayoutD;
   var calMain;
   $(document).ready(function() {

   	Ubi.setContainer(1, [1, 2, 3, 4], "3L"); //BOM등록

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        //form//
        layout.cells("b").attachObject("bootContainer");

       //up
		subLayout.cells("a").setWidth("300");
		gridItem = new dxGrid(subLayout.cells("a"), false);
		gridItem.addHeader({name:"제품코드",colId:"pCode",width:"50",align:"center",type:"ro"});
		gridItem.addHeader({name:"제품명",colId:"pName",width:"50",align:"center",type:"ro"});
		gridItem.setColSort("str");	
		gridItem.setUserData("","pk","pCode");
		gridItem.init(); 
		
		subLayoutA = subLayout.cells("b").attachLayout("2U");
		subLayout.cells("b").setHeight(210);
		subLayoutLeftGrid = subLayoutA.cells("a");
		subLayoutRightForm = subLayoutA.cells("b");
		
		subLayoutRightForm.hideHeader();
		/* 				subLayoutRightForm.showHeader();
		subLayoutRightForm.setText('<input type="button" value="Click me!">'); */
		subLayoutRightForm.attachObject("bootContainer2");
		
		subLayoutLeftGrid.setWidth(500);
		subLayoutLeftGrid.hideHeader();
		gridMst = subLayoutLeftGrid.attachGrid();
		gridMst = new dxGrid(subLayoutLeftGrid, false);
		gridMst.addHeader({name:"개정번호",colId:"",width:"20",align:"center",type:"ed"});
		gridMst.addHeader({name:"개정일자",colId:"",width:"20",align:"center",type:"dhxCalendarA"});
		gridMst.addHeader({name:"사유",colId:"",width:"60",align:"center",type:"ed"});
		gridMst.dxObj.setUserData("","@colId","format_date");
		gridMst.setColSort("str");	
		gridMst.setUserData("","pk","");
		gridMst.init(); 
		
	   //down
	   
	   subLayout.cells("c").showHeader();
	   subLayout.cells("c").setText("BOM");
	   gridDtl = new dxGrid(subLayout.cells("c"), false);
	   gridDtl.addHeader({name:"순번",colId:"",width:"10",align:"center",type:"ed"});
	   gridDtl.addHeader({name:"공정",colId:"",width:"10",align:"center",type:"ed"});
	   gridDtl.addHeader({name:"자재코드",colId:"",width:"10",align:"center",type:"ed"});
	   gridDtl.addHeader({name:"자재명",colId:"",width:"10",align:"center",type:"ed"});
	   gridDtl.addHeader({name:"소요량",colId:"",width:"10",align:"center",type:"ed"});
	   gridDtl.addHeader({name:"Loss율",colId:"",width:"10",align:"center",type:"ed"});
	   gridDtl.setColSort("str");	
	   gridDtl.setUserData("","pk","");
	   gridDtl.init();
	
	   //set date//
	   calMain = new dhtmlXCalendarObject([{input: "gjDate",button: "calpicker1"},{input: "appvlDate",button: "calpicker2"}, {input: "edDate",button: "calpicker3"}]);
	   calMain.loadUserLanguage("ko");
	   calMain.hideTime();
	   var t = dateformat(new Date());
	   byId("gjDate").value = t;
	   fn_selGridItem();
	   
})
function fn_search() {
	   fn_selGridItem();
   }
function fn_selGridItem(){
	if($("#pCode").val() == ""){
		$("#pCode").val("%");
	}
	if($("#pName").val() == ""){
		$("#pName").val("%");
	}
	var obj= gfn_getFormElemntsData('frmSearch');
	console.log(obj);
    gfn_callAjaxForGrid(gridItem,obj,"gridItemSel",subLayout.cells("a"));
    byId("frmSearch").reset();
}
        </script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 제품코드 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 제품명 </label>
                        <div class="col-sm-3 col-md-3">
                            <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="bootContainer2">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-md-8">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 개정번호 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="gjCode" id="gjCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 개정일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="gjDate" id="gjDate" type="text" value="" placeholder="" class="form-control input-xs format-date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 작성자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 개정사유 </label>
                        <div class="col-sm-6 col-md-6">
                            <input name="gjCause" id="gjCause" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 승인자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 승인일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="appvlDate" id="appvlDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker2" class="calicon form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 기준중량 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="rpWeight" id="rpWeight" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 가감기준 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="adjQty" id="adjQty" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 종료일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="edDate" id="edDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker3" class="calicon form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>