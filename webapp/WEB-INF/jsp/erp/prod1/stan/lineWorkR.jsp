<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//라인작업조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("라인코드,라인명,인원,주생산제품,공정,#cspan,#cspan,#cspan,#cspan,#cspan,"+
			           "#cspan,#cspan,#cspan,#cspan,일생산량",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,세척,건조,선별,정량,함침,조립,"+
			              "그램핑,세척,무계선별,포장,#rspan",
			             ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,70,70,70,70,70,70,"+
			               "70,70,70,70,100");
	gridMain.setColAlign("left,left,right,left,right,right,right,right,right,right,"+
			             "right,right,right,right,right");
	gridMain.setColTypes("ro,ro,ron,ro,ron,ron,ron,ron,ron,ron,"+
			             "ron,ron,ron,ron,ron");
	gridMain.setColSorting("str,str,int,str,int,int,int,int,int,int,"+
			               "int,int,int,int,int");
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
				라인코드
				</label>
			<div class="col-sm-2 col-md-2">
			    <input type="text" name="lineCode" id="lineCode" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('라인코드','common/lineCodePOP')">		
			</div>
		 </div>
	    </div>
      </div>      
  </form>
 </div> 
</div>