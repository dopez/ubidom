<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C");
	//발주등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("품목코드,품명,규격,단위,재고,안전재고,발주수량,단가,금액,납기일자,"+
			           "납품장소",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			               "100");
	gridMain.setColAlign("left,left,left,left,right,right,right,right,right,center,"+
			             "left");
	gridMain.setColTypes("ro,ro,ro,ro,ron,ron,edn,ron,ron,dhxCalendarA,"+
			             "ed");
	gridMain.setColSorting("str,str,str,str,int,int,int,int,int,date,"+
			               "str");
	gridMain.init();	
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
		
	toolbar.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			gridMain.addRow(gridMain.getUID(),",,,,,,,,,,",1);
		  }
	});
		
	function doOnRowDblClicked(rowId,colId){
		if(colId==0){
			gfn_load_popup('품목코드','common/itemCodePOP');
		   }
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
       <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control" >
                  </div>              
             </div>
            <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div>      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			등록자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="register" id="register" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
    <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			공급업체
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="supplyCom" id="supplyCom" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('공급업체코드','common/supplyCompCodePOP')">
			</div>
			<div class="col-sm-4 col-md-4" style="margin-left: 5px;">
		    <div class="col-sm-6 col-md-6">
		      <button type="button"  class="btn btn-default form-control" name="btnCalcul" id="btnCalcul" onclick="fn_Calcul()" >발주수량산출</button>
		    </div>
		    <div class="col-sm-6 col-md-6">
		       <button type="button"  class="btn btn-default form-control" name="btnPrint" id="btnPrint" onclick="fn_print()">발주서인쇄</button>
		    </div>
		  </div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>