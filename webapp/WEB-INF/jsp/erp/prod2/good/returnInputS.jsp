<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C");
	//반품입고등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,모재코드,모재명,규격,재질,단위,반품수량,반품사유,폐기",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,left,right,left,center");
	gridMain.setColTypes("ron,ro,ed,ed,ed,ed,edn,ed,ra");
	gridMain.setColSorting("int,str,str,str,str,str,int,str,na");
	gridMain.init();	
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	    var t = dateformat(new Date());
		byId("stDate").value = t;
		
    toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				gridMain.addRow(gridMain.getUID(),"1,,,,,,,,",1);
			  }
	});	
    
    function doOnRowDblClicked(rowId,colId){
		if(colId==1){
			gfn_big_load_popup(403,400,'모재코드','prod2/metalCodePOP');
		   }
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
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
                        <input type="button"  id="calpicker" class="calicon form-control">
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
			 거래처
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="supplyComp" id="supplyComp" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('거래처','common/supplyCompPOP')">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>