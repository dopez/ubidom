<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var gridMstCode;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"2U");
	//제코드등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");//attach search Condition div
	
	//좌측 그리드 config
	subLayout.cells("a").setWidth(400);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"코드", colId:"code", width:"50", type:"ed"});
	gridMst.addHeader({name:"코드명", colId:"codeName", width:"50", type:"ed"});
	gridMst.setColSort("str");
	gridMst.setUserData("","pk","code");
	gridMst.init();	
	
	//우측 그리드 config
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	/* gridDtl.addHeader({name:"No", colId:"rowNo", width:"10", type:"ro"}); */
	gridDtl.addHeader({name:"내부코드", colId:"innerCode", width:"10", type:"ed"});
	gridDtl.addHeader({name:"내부코드명", colId:"innerCodeName", width:"10", type:"ed"});
	gridDtl.addHeader({name:"변수", colId:"addVar", width:"10", type:"ed"});
	gridDtl.addHeader({name:"비고", colId:"descRmk", width:"10", type:"ed"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","innerCode");
	gridDtl.init();	
	
//	gridMstCode = gridMst.getCellValue(gridMst.getSelectedRowIndex(),gridMst.getColIndexById('code'));
	//var gridMstCode = gridMst.getCellValue(gridMst.getSelectedRowId(),0).getValue();
	//var gridMstCode = gridMst.getSelectedRowIndex()+1;
	//상위 버튼 동작 이벤트
	toolbar.attachEvent("onClick", function(id){
		//조회 버튼 동작
		if(id == "btn1"){
			alert("조회");
			//var param = {V_COMP:"100", V_CODE:"%",V_NAME:"%"};
			var params = "codeName=" + $("#baseName").val();
			alert(params);
			//gfn_gridLoad("/erp/rndt/baseCodeS/baseCodeMstSel",params, gridMst,fn_callBack);
			gfn_callAjaxForGrid(gridMst,params,"/erp/rndt/baseCodeS/baseCodeMstSel",subLayout.cells("a"),"INF004");
		}
		//신규 버튼 동작
		if(id == "btn2"){
			alert("좌측 그리드 row 추가");
			var totalColNum = gridMst.getColumnCount();
          	var data = new Array(totalColNum);
            gridMst.addRow(data, 0, 2);
		}
		//저장 버튼 동작
		if(id == "btn3"){
			alert("변경 사항 저장");
			var jsonStr = gridMst.getJsonUpdated2();
		    if (jsonStr == null || jsonStr.length <= 0) return;        		
		        $("#jsonData").val(jsonStr);                      
		        $.ajax({
		           url : "/erp/rndt/codeSave",
		           type : "POST",
		           data : $("#hiddenform").serialize(),
		           async : true,
		           success : function(data) {
		           MsgManager.alertMsg("INF001");
		           
		            }
		       });
			var jsonStr2 = gridDtl.getJsonUpdated2();
		    if (jsonStr2 == null || jsonStr2.length <= 0) return;        		
		        $("#jsonData2").val(jsonStr2);                      
		        $.ajax({
		           url : "/erp/rndt/codeSaveDtl",
		           type : "POST",
		           data : $("#hiddenform").serialize(),
		           async : true,
		           success : function(data) {
		           MsgManager.alertMsg("INF001");
		           
		            }
		       });
			
		}
		//삭제 버튼 동작
		if(id == "btn4"){
			//alert(gridMstCode);
			alert("좌측 그리드 select row 삭제(하위항목까지)");
		}
		//한줄삽입 버튼 동작
		if(id == "btn5"){
			alert("우측 그리드 row 추가");
			var totalColNum = gridDtl.getColumnCount();
          	var data = new Array(totalColNum);
          	
          	gridDtl.addRow(data, 0, 2);
		}
		//한줄삭제 버튼 동작
		if(id == "btn6"){
			alert("우측 그리드 row 삭제");
		}
	})
	//좌측 그리드 로우 더블클릭 시 우측 그리드 조회
 	gridMst.attachEvent("onRowDblClicked",function(rId,cInd){
		
	})
});

		//gfn_gridLoad("/erp/rndt/baseCodeS/baseCodeDtlSel",param,gridDtl,fn_callBack);
function fn_callBack(){
	alert("isDone?");
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="jsonData2" name="jsonData2" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				코드
		   </label>
			<div class="col-sm-1 col-md-1">
			 <input type="text" name="baseCode" id="baseCode" value="" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-2 col-md-2" style="margin-left: 10px;">
			 <input type="text" name="baseName" id="baseName" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	    </div>
      </div>     
  </form>
 </div> 
</div>