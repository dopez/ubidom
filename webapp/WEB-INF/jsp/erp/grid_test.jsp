<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var gridMain, layout, toolbar, subLayout,gridMain;

$(function() {
	Ubi.setContainer(1, [1, 3, 4, 5, 9], "1C"); //품목코드조회

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    //form//
    layout.cells("b").attachObject("bootContainer2");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"편집", 		colId:"editStat", 	width:"5", 	align:"center", type:"ro"});
	gridMain.addHeader({name:"삭제", 		colId:"chk", 		width:"5", 	align:"center", type:"ch"});
	gridMain.addHeader({name:"번호", 		colId:"rnum", 		width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"품목코드", 		colId:"itemCode", 	width:"25", align:"center", type:"ed"});
	gridMain.addHeader({name:"품목명", 		colId:"itemName", 	width:"25", align:"center", type:"ed"});
	gridMain.addHeader({name:"규격", 		colId:"itemSize", 	width:"25", align:"center", type:"ed"});
	gridMain.attachEvent("onCheck", fn_GridCheck);	
	gridMain.setUserData("","pk","itemCode");
	gridMain.init();
	gridMain.getDxObj().enableSmartRendering(true);
	gridMain.getDxObj().setAwaitedRowHeight(25);

	g_dxRules = {
		itemCode : [r_notEmpty, r_minLen + "|2"],
		itemName : [r_notEmpty, r_minLen + "|2"],
		itemSize : [r_notEmpty]
	};

	//조회
	toolbar.attachEvent("onClick", function(id) {
		if (id == "btn1") {
			fn_loadGridList();
		}
	});

	//저장
	toolbar.attachEvent("onClick", function(id) {
		if (id == "btn3") {
			var jsonStr = gridMain.getJsonUpdated2();
	
			if (jsonStr == null || jsonStr.length <= 0) return;
			
	        $("#jsonData").val(jsonStr);
	        
			$.ajax({
				url : "/erp/gridTest/prcs",
		        type : "POST",
		        data : $("#pform").serialize(),
		        async : true,
		        success : function(data) {
		        	if(data.rtnCode == "1") {
			        	MsgManager.alertMsg("INF001");
						fn_loadGridList();
					} else {
						return;
					}
		        }
			});
		}
	});

	//삭제
	toolbar.attachEvent("onClick", function(id) {
		if (id == "btn4") {
			if(gridMain.isSelRows(1)) {
				if(!MsgManager.confirmMsg("INF002")) {
					return;
				}
			
				var jsonStr = gridMain.getJsonChecked(1);
				if (jsonStr == null || jsonStr.length <= 0) return;
				
		        $("#jsonData").val(jsonStr);
		        $.ajax({
					url : "/erp/gridTest/prcs",
			        type : "POST",
			        data : $("#pform").serialize(),
			        async : true,
			        success : function(data) {
			        	MsgManager.alertMsg("INF003");
						fn_loadGridList();
			        }
				});
			} else {
				MsgManager.alertMsg("WRN002");
			}
		}
	});
	
	//행추가
	toolbar.attachEvent("onClick", function(id) {
		if (id == "btn5") {
			var totalColNum = gridMain.getColumnCount();
			var rnumColIdx = gridMain.getColIndexById('rnum');
			
			var data = new Array(totalColNum);
			data[rnumColIdx] = '0';
			gridMain.addRow(data, gridMain.getRowsNum()+1, 1);
			editCol = editCol + (gridMain.getRowsNum()-1) + ";";
		}
	});

	//인쇄
	toolbar.attachEvent("onClick", function(id) {
		if (id == "btn9") {
			gridMain.getDxObj().printView();
		}
	});
});

function fn_loadGridList() {
	gfn_gridLoadXml("/erp/gridTest/list", {}, gridMain, fn_setCount);
	editCol = "";
	delCol = "";
}

function fn_setCount() {
	$("#totalCount").text(gridMain.getRowsNum());
}

function fn_GridCheck(selectedRowId, chkColumnId) {
	var idx = selectedRowId-1;
    if(gridMain.getDxObj().cells2(idx,chkColumnId).getValue()=="1") {
    	delCol = delCol + idx + ";";
    } else {
    	var arr = delCol.split(";");
    	for(var i=0; i < arr.length-1; i++) {
    		if(arr[i]==idx) {
    			arr = $.grep(arr, function(n,j){
					return n != arr[i];
				});
        		delCol = arr.join(";");
        		return;
    		}
    	}
    }
}
</script>

<form id="pform" name="pform" method="post">
	<input type="hidden" id="jsonData" name="jsonData"/>
</form>

<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer2">
   <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
      <div class="container">
        <div class="row">
          <div class="form-group form-group-sm">
             <div class="col-sm-8 col-md-8">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                  품목코드
                </label>
                <div class="col-sm-2 col-md-2">
                   <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
                <div class="col-sm-3 col-md-3">
                    <div class="col-md-offset-1 col-sm-offset-1 col-sm-11 col-md-11">
                        <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
               </div>
               <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
                 구분 
               </label>
               <div class="col-sm-2 col-md-2">
                   <select class="form-control input-xs">
                        <option>품목</option>
                        <option>품목2</option>
                        <option>품목3</option>
                   </select>
               </div>
            </div>
          </div>
        </div>
     </div>
  </form>
</div>