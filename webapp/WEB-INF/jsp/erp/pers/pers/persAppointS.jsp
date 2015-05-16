<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,5,6],"2U");
	//인사발령등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(350);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"No",       colId:"no",       width:"15", align:"center", type:"ro"});
	gridMst.addHeader({name:"사원번호", colId:"empNo",    width:"35", align:"center", type:"ro"});
	gridMst.addHeader({name:"성명",     colId:"empName",  width:"25", align:"center", type:"ro"});
	gridMst.addHeader({name:"부서", 	colId:"deptName", width:"25", align:"center", type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","no");
	gridMst.init(); 
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"No",         colId:"no",       width:"5", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령일",     colId:"empNo",    width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"급여구분",   colId:"empName",  width:"5", align:"center", type:"ro"});
	gridDtl.addHeader({name:"근무구분",   colId:"deptName", width:"5", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령구분",   colId:"no",       width:"5", align:"center", type:"ro"});
	gridDtl.addHeader({name:"부서코드",   colId:"empNo",    width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령부서",   colId:"empName",  width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직군",   colId:"deptName", width:"5", align:"center", type:"ro"});
	gridDtl.addHeader({name:"근무형태",   colId:"no",       width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직위",   colId:"empNo",    width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직책",   colId:"empName",  width:"5", align:"center", type:"ro"});
	gridDtl.addHeader({name:"급여사업장", colId:"deptName", width:"10", align:"center", type:"ro"});
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","no");
	gridDtl.init(); 
	
	gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	$("#deptName").dblclick(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"deptName":$(this).val()});
	});

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	    var t = dateformat(new Date());
		byId("stDate").value = t;
		
		toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				gridDtl.addRow(gridDtl.getUID(),"1,,,,,,,,,,,",1);
			}
		});
		
		function doOnRowDblClicked(rowId,colId){
			if(colId==5 || colId ==6){
			gfn_load_popup('부서코드','common/deptCodePOP');
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
			  구분 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-6 col-md-6">
			       <input type="radio" name="gubn" id="gubn" value="재직" checked="checked">재직
			    </div>
			    <div class="col-sm-6 col-md-6">
			       <input type="radio" name="gubn" id="gubn" value="퇴직">퇴직
			    </div>           
             </div>
		 </div>
	    </div>
      </div>
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="deptName" id="deptName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  
		  <label class="col-sm-1 col-md-1 control-label" for="textinput">
			 성명
		  </label>
		  <div class="col-sm-2 col-md-2">
			  <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
		  </div>
	   </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>