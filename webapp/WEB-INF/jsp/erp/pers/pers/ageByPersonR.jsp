<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var grid;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8],"1C");
	//연령별인원현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

	layout.cells("b").attachObject("bootContainer");

// 	grid = subLayout.cells("a").attachGrid();


	grid = new dxGrid(subLayout.cells("a"), false);
	grid.addHeader({name:"NO",       colId:"no",       width:"50",  align:"right", type:"cntr"});
	grid.addHeader({name:"부서명", colId:"postName", width:"80", align:"left", type:"ro"});
	grid.addHeader({name:"20세이하",   colId:"one",   width:"80", align:"right", type:"dhxCalendarA"});
	grid.addHeader({name:"21~15", 	colId:"two",  width:"80", align:"right", type:"dhxCalendarA"});
	grid.addHeader({name:"26~30",   colId:"three", width:"80", align:"right", type:"ed"});
	grid.addHeader({name:"31~35",   colId:"four", width:"80", align:"right", type:"ed"});
	grid.addHeader({name:"36~40",   colId:"five", width:"80", align:"right", type:"ed"});
	grid.addHeader({name:"41~45",   colId:"six", width:"80", align:"right", type:"ed"});
	grid.addHeader({name:"46~50", colId:"seven", width:"80", align:"right", type:"combo"});
	grid.addHeader({name:"56~60",  colId:"eight", width:"80", align:"right", type:"combo"});
	grid.addHeader({name:"61세이상", colId:"nine", width:"80", align:"right", type:"combo"});
	grid.addHeader({name:"합계", colId:"ten", width:"80", align:"right", type:"combo"});
	grid.addHeader({name:"평균", colId:"costKind", width:"80", align:"right", type:"combo"});
	grid.setUserData("","pk","postCode");
	grid.setColSort("str");
// 	grid.attachFooter(",연령합계,,,,,,,,,"+
//     ",,,");

	grid.init();
	fn_search();
});
function fn_search(){
	gfn_callAjaxForGrid(grid,$("#frmSearch").serialize(),"search",subLayout.cells("a"));
};
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 직군
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jikGun" id="jikGun" class="form-control input-xs">
			   <option value="">전체</option>
			   <option value="">관리직</option>
			   <option value="">생산직</option>
			   <option value="">용역</option>
			   <option value="">외국인</option>
			   <option value="">기술직</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 근무
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="serveGbn" id="serveGbn" class="form-control input-xs">
			   <option value="">전체</option>
			   <option value="">재직</option>
			   <option value="">휴직</option>
			   <option value="">퇴직</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div>
</div>