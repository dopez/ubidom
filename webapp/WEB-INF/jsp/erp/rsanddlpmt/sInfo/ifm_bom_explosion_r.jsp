<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var o; 
var gridMain;
$( document ).ready(function() {
	
	ubi.init(1,[1,8,9],"1C"); //Bom정전개
	
	o = ubi.getDataSet();
	
	//form//
	o.layout.cells("b").attachObject("bootContainer2");

	//grid	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //11col
	gridMain.setHeader("개정번호,품목코드,품명,규격,단위,수량,Loss율,공정,승인일자,종료일자,비고", null,
						[]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");       
	gridMain.setColAlign("left,left,left,left,center,right,right,left,center,center,center");     
	gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro"); 
	gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
	gridMain.init();
	
	
})

</script>
<div id="container"
	style="position: relative; width: 100%; height: 100%; overflow: auto;">
	</div>
<div id="bootContainer2">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;"
		id="frmSearch">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				품목코드
				 </label>
				<div class="col-sm-4 col-md-4">
					<div class="col-sm-10 col-md-10">
						<input name="postNo" id="postNo" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<div class="col-sm-2 col-md-2">
							<button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="fn_search()">
							  <span class="glyphicon glyphicon-search"></span>
							</button>
					  </div>
			    </div>
			</div>
			</div>
		</div>
	</form>
</div>
