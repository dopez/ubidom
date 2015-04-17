<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4],"2E");
	//제품개선의뢰등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,부서코드,부서명",null,
			["text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100");
	gridMst.setColAlign("center,left,left");
	gridMst.setColTypes("ron,ro,ro");
	gridMst.setColSorting("int,str,str");
	gridMst.init();	
	gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked1);
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("관련부서");
	var sLayout1 = subLayout.cells("a");
	subToolbar('toolbar1',sLayout1,[5,6]);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,품목코드,품명,단위,완료일자,개선내용",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,left,center,left");
	gridDtl.setColTypes("ron,ro,ro,ro,dhxCalendarA,ed");
	gridDtl.setColSorting("int,str,str,str,date,str");
	gridDtl.init();
	gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked2);
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("개선의뢰내용");
	var sLayout2 = subLayout.cells("b");
	subToolbar('toolbar2',sLayout2,[5,6]);
	
	function doOnRowDblClicked1(rowId,colId){
		if(colId==1){
		gfn_load_popup('부서코드','common/deptCodePOP');
		}
	}
	
	function doOnRowDblClicked2(rowId){
		gfn_load_popup('제품코드','common/goodsCodePOP');
	}
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
});

 var subToolbar = function(toolbar1,sublayout,btn_id_array){
	 var tblstr = toolbar1;
	toolbar1 = sublayout.attachToolbar();
	toolbar1.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			
		  if(tblstr == 'toolbar1'){
			  fn_row_insertSub1(); 
		  }
		  if(tblstr == 'toolbar2'){
			  fn_row_insertSub2(); 
		  }	
		}
	});
	
	var size = 18;
	toolbar1.setIconSize(18);
	toolbar1.setIconsPath("/images/button/dhtmlx/");
	toolbar1.loadStruct("/common/json/button.json",fn_onLoad);

	function fn_onLoad(){
	  var item_id_set_arr = [1,2,3,4,5,6,7,8,9,10];
	    	
	  for(var i=0; i< btn_id_array.length; i++){
	       var index = item_id_set_arr.indexOf(btn_id_array[i]);
	       if (index > -1){
	             item_id_set_arr.splice(index, 1);
	          }
	      }
	  for(var i=0; i<item_id_set_arr.length; i++){
	      toolbar1.removeItem("btn"+item_id_set_arr[i]);	
	      toolbar1.removeItem("sep"+item_id_set_arr[i]);
	     }	
	 } 
} 
function fn_new(){
	
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_insertSub1(){
	gridMst.addRow(gridMst.getUID(),"1,,",1);
}
function fn_row_deleteSub1(){
	
}
function fn_row_insertSub2(){
	gridDtl.addRow(gridDtl.getUID(),"1,,,,,",1);
}
function fn_row_deleteSub2(){
	
}
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
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 고객
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="custom" id="custom" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객','common/customPOP')">
			</div>
		  </div>
	  </div>
	</div>           
  </form>
 </div> 
</div>