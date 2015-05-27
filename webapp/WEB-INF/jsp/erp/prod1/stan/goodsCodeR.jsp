<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
   $(document).ready(function() {
	Ubi.setContainer(1,[1,8,9],"1C");
	//제품코드조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");//col 9
	gridMain.setHeader("구분,대분류,중분류,소분류,제품코드,제품명,규격,단위,포장단위", null, 
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,center,center,center,left,left,left,center,center");
	gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
	gridMain.setColSorting("str,str,str,str,str,str,str,str,str");
	gridMain.init();	
})   
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">	
	<form class="form-horizontal" name="frmSearch" id="frmSearch" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class="col-sm-2 col-md-2 control-label" for="textinput">
						제품코드 
					</label>
					<div class="col-sm-1 col-md-1">
						<input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<div class="col-sm-2 col-md-2" style="margin-left: 10px;">
						<input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<label class="col-sm-2 col-md-2 control-label" for="textinput"> 
					구분 
					</label>
					<div class="col-sm-2 col-md-2">
						<select class="form-control input-xs">
							<option value="제품">제품</option>
							<option value="제품2">제품2</option>
							<option value="제품3">제품3</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>
   </div>	
</div>