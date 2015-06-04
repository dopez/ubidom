<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout;
var gridMst, gridMain;
var calStDate
$(document).ready(function() {

    Ubi.setContainer(1, [1,8,9], "1C"); //진공증착기준조회

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
    layout.cells("b").attachObject("bootContainer");
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",colId:"rNum",width:"5",align:"center",type:"cntr"});
    gridMain.addHeader({name:"설비코드",colId:"equiCode",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"설비명",colId:"equiName",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"적용일자",colId:"applyDate",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"모재",colId:"matrCodeMjName",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"약품명",colId:"matrName",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"온도",colId:"temperature",width:"5",align:"center",type:"ed"});
    gridMain.addHeader({name:"진공도",colId:"vacuumRate",width:"5",align:"center",type:"ed"});
    gridMain.addHeader({name:"에칭",colId:"etching1",width:"5",align:"center",type:"ed"});
    gridMain.addHeader({name:"어시스트",colId:"assist",width:"5",align:"center",type:"ed"});
    gridMain.addHeader({name:"두께",colId:"thickness",width:"5",align:"center",type:"ed"});
    gridMain.addHeader({name:"Rate",colId:"rate",width:"5",align:"center",type:"ed"});
    gridMain.addHeader({name:"에칭",colId:"ecthing2",width:"5",align:"center",type:"ed"});
    gridMain.addHeader({name:"방식",colId:"method",width:"5",align:"center",type:"ed"});
	gridMain.dxObj.setUserData("","@applyDate","format_date");
    gridMain.setUserData("","pk","No");
    gridMain.setColSort("str");
    gridMain.init();
	
    fn_search();
                        
})
function fn_search(){
   var obj = {};
   obj.mjCode = $("#mjCode").val();
   if(obj.mjCode == ""){
	   obj.mjCode = "%";
   }
   gfn_callAjaxForGrid(gridMain, obj, "gridMainSel", subLayout.cells("a"));
}
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
//print
function  fn_print(){
	gridMain.printView();
 }
        </script>
<div id="container"
	style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmMain">
		<div class="container">
			<div class="row">
				<div class="form-group form-group-sm">
					<div class="col-sm-8 col-md-8">
						<label class=" col-sm-2 col-md-2 control-label" for="textinput">
							모재코드 </label>
						<div class="col-sm-2 col-md-2">
							<input name="mjCode" id="mjCode" type="text" value=""
								placeholder="" class="form-control input-xs">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>