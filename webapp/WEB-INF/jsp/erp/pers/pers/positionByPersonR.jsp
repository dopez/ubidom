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
// 	POST_CODE, POST_NAME, '18', '12', '13', '14', '15', '16', '21', '23', '31', '41', '51', '81', '11', '62', '63', '64', '82', '17', '10', '84', '73'

// 18    감    사
// 12    부 사 장
// 13    전무이사
// 14    상무이사
// 15    이    사
// 16    이사대우
// 21    본 부 장
// 23    부    장
// 31    차    장
// 41    과    장
// 51    대    리
// 81    별 정 직
// 11    사    장
// 62    직    장
// 63    반    장
// 64    사    원
// 82    임 시 직
// 83    주    임
// 17    고    문
// 10    회    장
// 84    계약직
// 73    계    장
	grid = new dxGrid(subLayout.cells("a"), false);
	grid.addHeader({name:"고객코드", colId:"postCode", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"고객명", 	colId:"postName", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont1", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont2", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont3", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont4", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont3", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont5", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont6", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont7", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont8", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont9", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont0", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont10", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont11", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont12", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont13" ,width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont14", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont15", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont16", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont17", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont18", width:"45", align:"right", type:"ro"});
	grid.addHeader({name:"사업자번호", 	colId:"cont19", width:"45", align:"right", type:"ro"});
	grid.setColSort("str");

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