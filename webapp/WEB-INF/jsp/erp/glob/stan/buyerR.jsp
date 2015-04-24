<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C"); 
	//Buyer조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("코드,Buyer명,국가,대표자명,주소,담당자,전화번호,팩스번호,이메일,홈페이지",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("left,left,left,left,left,left,left,left,left,left");
	gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
	gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str");
	gridMain.init();	
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-11 col-md-9">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				구분 
				</label>
			<div class="col-sm-10 col-md-10">
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="1" checked="checked">매출
					</div>
					<div class="col-sm-1 col-md-1">
					    <input type="checkbox" name="empGbn_group1" value="2">매입
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="3">외주
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="4">금융
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="5">품질
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="6">총무
					</div>
					<div class="col-sm-2 col-md-2">
						<input type="checkbox" name="empGbn_group1" value="7"> Buyer
					</div>
				</div>
		   </div>
	    </div>
      </div>
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-11 col-md-9">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 Buyer
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="buyerCode" id="buyerCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('Buyer','common/buyerPOP')">
			</div>
		</div>
	  </div>
	</div>     
  </form>
 </div> 
</div>