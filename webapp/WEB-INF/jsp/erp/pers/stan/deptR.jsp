<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//부서조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO", colId:"deptCode", width:"50", align:"center", type:"ro"});
	gridMain.addHeader({name:"부서코드", colId:"deptName", width:"50", align:"center", type:"ro"});
	gridMain.addHeader({name:"부서명", colId:"deptCode", width:"50", align:"center", type:"ro"});
	gridMain.addHeader({name:"시작일", 	colId:"deptName", width:"50", align:"center", type:"ro"});
	gridMain.addHeader({name:"종료일", 	colId:"deptName", width:"50", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","itemCode");
	gridMain.init();

});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="deptName" id="deptName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			</div>
		  </div>
	  </div>
	</div>           
  </form>
 </div> 
</div>