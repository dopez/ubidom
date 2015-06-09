<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var grid;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8],"1C");
	//직위별인원현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

	layout.cells("b").attachObject("bootContainer");
	grid = new dxGrid(subLayout.cells("a"), false);
	grid.addHeader({name:"고객코드", colId:"postCode", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"고객명", 	colId:"postName", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont1", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont2", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont3", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont4", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont3", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont5", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont6", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont7", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont8", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont9", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont0", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont10", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont11", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont12", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont13" ,width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont14", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont15", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont16", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont17", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont18", width:"80", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont19", width:"80", align:"right", type:"ro"});
	grid.setColSort("str");
	grid.setUserData("","pk","postCode");
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
			 사업장
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jikGun" id="jikGun" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="관리직">본점</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  급여년월
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>
             </div>
		 </div>
	    </div>
      </div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 직군
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="serveGbn" id="serveGbn" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="관리직">관리직</option>
			   <option value="생산직">생산직</option>
			   <option value="용역">용역</option>
			   <option value="외국인">외국인</option>
			   <option value="기술직">기술직</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div>
</div>