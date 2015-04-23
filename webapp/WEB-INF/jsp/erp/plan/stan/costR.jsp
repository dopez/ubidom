<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout
var gridMain;
$( document ).ready(function() {
	
	Ubi.setContainer(2,[1,2,3,4,5,6],"1C"); //매출단가조회

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid(); 
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //9
	gridMain.setHeader("고객코드,고객명,품목코드,품명,규격,단위,통화단위,단가,적용일자", null, 
					[]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,");       
	gridMain.setColAlign("left,center,left,left,left,center,right,right,center");     
	gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro"); 
	gridMain.setColSorting("str,str,str,str,str,str,str,int,date");
	gridMain.init();   
	
})
function fn_search(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" >
<div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
					고객
					 </label>
					<div class="col-sm-4 col-md-4">
					<div class="col-sm-10 col-md-10">
						<input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<div class="col-sm-2 col-md-2">
							<button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('고객코드','common/customCodePOP');">
							  <span class="glyphicon glyphicon-search"></span>
							</button>
					  </div>
			    </div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
					품목코드
					 </label>
					<div class="col-sm-4 col-md-4">
					<div class="col-sm-10 col-md-10">
						<input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<div class="col-sm-2 col-md-2">
							<button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('품목코드','common/itemCodePOP');">
							  <span class="glyphicon glyphicon-search"></span>
							</button>
					  </div>
			    </div>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>