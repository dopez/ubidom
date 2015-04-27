<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;  
var calMain;
var cName = '생산';
var cName2 = '포장';
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"2E");
	//생산포장/지시등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,수주번호,담당,고객,매출구분,구분,품목코드,품명,포장,단위,"+
			          "수량,납기일자,선택",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100,100");
	gridMst.setColAlign("center,left,left,left,center,center,left,left,right,left,"+
			            "right,center,center");
	gridMst.setColTypes("ron,ron,ro,ro,ro,ro,ro,ro,ro,ro,"+
			            "ron,ro,ra");
	gridMst.setColSorting("int,int,str,str,str,str,str,str,str,str,"+
			              "int,date,na");
	gridMst.init();	
	gridMst.attachEvent("onCheck",doOnCheck);
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("수주내역");
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,품목코드,품명,포장,단위,납기일자,재고,안전재고,수주수량,지시수량,"+
			          "생산/포장",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100");
	gridDtl.setColAlign("center,left,left,left,left,center,right,right,right,right,"+
			            "center");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,dhxCalendarA,ron,ron,ron,edn,"+
			            "radioCell");
	gridDtl.setColSorting("int,str,str,str,str,date,int,int,int,int,"+
			              "na");
	gridDtl.init();	
	gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("생산지시내역");

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
		
	function doOnCheck(rowId,colId){
		if(colId==12){
			gridDtl.addRow(gridDtl.getUID(),"1,,,,,,,,,,,",1);
		  }
	}
		
	toolbar.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			  gridMst.addRow(gridMst.getUID(),"1,1234-5678,유비덤,ceko,Y,Y,cskj-250,cskj-250,10,EA,100,2014-04-20,",1);
		  }
	});
		
	function doOnRowDblClicked(rowId,colId){
		if(colId==1){
			gfn_load_popup('제품코드','common/goodsCodePOP');
		   }
	}
}); 
var eXcell_radioCell = function(cell){
	  if (cell){
	      this.cell = cell;
	      this.grid = this.cell.parentNode.grid;
	   }
	 this.setValue=function(val){
		 
	       var row_id=this.cell.parentNode.idd;
	       var value, value1, value2;
	       var cellIndex = this.cell._cellIndex;
	       if((val=='Y') || val=='y')
	           value = "<input type='radio' name='myradio" + row_id + "_"+ cellIndex +"' value='Y' checked/>"+cName+"";
	       else
	          value= "<input type='radio' name='myradio" + row_id + "_"+ cellIndex +"' value='Y'/> "+cName+""; 
	       if((val=='N') || val=='n')
	          value1 = "<input type='radio' name='myradio" + row_id + "_"+ cellIndex +"' value='N' checked/>"+cName2+"";
	       else
	          value1= "<input type='radio' name='myradio" + row_id + "_"+ cellIndex +"' value='N'/>"+cName2+"";
	           value2 = value+value1;

	    this.setCValue(value2);
	} 
	this.getValue=function(val){
	   var row_id=this.cell.parentNode.idd;
	   return value;   
}};

eXcell_radioCell.prototype = new eXcell;
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
                         <input type="button" id="calpicker" class="calicon form-control">
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
			 담당
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>      
  </form>
 </div> 
</div>