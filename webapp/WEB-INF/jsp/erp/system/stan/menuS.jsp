<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain,treeMain;
var menuNameParam;
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,5,6],"2U");
	//시스템 메뉴 등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	//좌측 트리 그리드
	subLayout.cells("a").setWidth(300);
	treeMain = subLayout.cells("a").attachTree();
	treeMain.enableSmartCheckboxes(true);
	fn_treeMainConf();
	treeMain.enableThreeStateCheckboxes(true);
	treeMain.enableCheckBoxes(true, true);
	
	//우측 그리드 config
	gridMain = new dxGrid(subLayout.cells("b"), false);
	gridMain.addHeader({name:"순서", colId:"seq", align:"center",width:"5", type:"cntr"});//화면순서
	gridMain.addHeader({name:"화면구분", colId:"menugbn", align:"center",width:"8", type:"combo"});//화면구분(폴더/윈도우)
	gridMain.addHeader({name:"메뉴코드", colId:"menucd", align:"center",width:"10", type:"ro"});
	gridMain.addHeader({name:"메뉴명", colId:"menuname", width:"15", type:"ed"});
	gridMain.addHeader({name:"URI", colId:"uri", width:"25", type:"ed"});
	gridMain.addHeader({name:"웹매개변수", colId:"agValue", width:"7", type:"ed"});
	gridMain.addHeader({name:"사용구분", colId:"exegbn", width:"5", align:"center",type:"combo"});
 	//gridMain.addHeader({name:"사용구분", colId:"exegbn", width:"5", align:"center",type:"ch"});
	gridMain.setColSort("str");
	gridMain.setUserData("","pk","menucd");
	gridMain.init();
	
	//대분류 메뉴 로드
	fn_loadGridMain('0000000000');
	
	//grid 드래그 앤 드랍
	gridMain.dxObj.enableDragAndDrop(true);
 	gridMain.attachEvent("onDrop",fn_onDrop);
	
	//콤보박스 (드랍다운 리스트)
	var comboGbn = gridMain.getColumnCombo(1);
	comboGbn.addOption("0","폴더");
	comboGbn.addOption("1","윈도우");
	var comboGbn2 = gridMain.getColumnCombo(6);
	comboGbn2.addOption("1","사용");
	comboGbn2.addOption("0","미사용");	
	
	//onselect edit cell
  	gridMain.attachEvent("onRowSelect", function(id,ind){
		gridMain.editCell();
 	}); 
	
	//더블 클릭 시 팝업
 	gridMain.attachEvent("onRowDblClicked",fn_load_pop);
	
	// 체크 값
	gridMain.attachEvent("onCheck",testCk);
});
//doc Ready End

//row drag n drop
function fn_onDrop() {
     var totalRowNum = gridMain.getRowsNum();
 	 for(var i=0;i<totalRowNum;i++){
		gridMain.setCells2(i,0).setValue();
 	 }
}
    
function testCk(selRowId,colnum) {
  var selRowIdx = selRowId-1;
  console.log("selRowIdx = "+selRowIdx);
  console.log("selRowId = "+selRowId);
  var checkState = gridMain.setCells2(selRowIdx, colnum).getValue();
   if (checkState == 1) {
      gridMain.setCells2(selRowIdx, colnum).setValue(1);
  } else if(checkState == 0){
      gridMain.setCells2(selRowIdx, colnum).setValue(0);
  }
   console.log("checkState = " + checkState);
}

//row dbl click
function fn_load_pop() {
        var selRowId = gridMain.getSelectedRowId();
        var selRowIdx = gridMain.getSelectedRowIndex(selRowId);
        menuNameParam = gridMain.setCells2(selRowIdx, "3").getValue(selRowIdx - 1);
        menucdParam = gridMain.setCells2(selRowIdx, "2").getValue(selRowIdx - 1);
        gfn_load_pop('w1', 'system/authPOP', true, menuNameParam);
    }

//조회 버튼 동작
function fn_search() {
    fn_treeMainConf();
    gridMain.clearAll();
    fn_loadGridMain('0000000000');
}

//저장 버튼 동작
function fn_save(){
	g_dxRules = {
			menugbn : [r_notEmpty],
			menuname : [r_notEmpty, r_minLen + "|2"]
		};
	
    fn_saveGridMain();
}
function fn_saveGridMain(){
    var jsonStr = gridMain.getJsonUpdated2();
    if (jsonStr == null || jsonStr.length <= 0) return;
    $("#jsonData").val(jsonStr);
	console.log(jsonStr.length);
    $.ajax({
        url: "/erp/system/menuS/prcsMenuS",
        type: "POST",
        data: $("#hiddenform").serialize(),
        async: true,
        success: function(data) {
            gridMain.clearAll();
            MsgManager.alertMsg("INF001");
            var menucd = $("#Pmenucd").val()
            fn_loadGridMain(menucd);
        }
    });
}
//한줄삽입
function fn_add(){
	var totalColNum = gridMain.getColumnCount();
  	var totalRowNum = gridMain.getRowsNum();
  	var exegbnColIdx = gridMain.getColIndexById("exegbn");
  	var data = new Array(totalColNum);
  		data[exegbnColIdx] = "1";
  	gridMain.addRow(data);
  	gridMain.selectRow(totalRowNum);
}
//한줄삭제
function fn_delete() {
    var rodid = gridMain.getSelectedRowId();
    var rodIdx = gridMain.getSelectedRowIndex();
    if (gridMain.isDelRows(rodid)) {
        if (MsgManager.confirmMsg("INF002")) {
            if (gridMain.chkUnsavedRow(rodIdx, rodid)) {
                return
            } else {
                var jsonStr = gridMain.getJsonRowDel(rodid);
                if (jsonStr == null || jsonStr.length <= 0) return;
                $("#jsonData").val(jsonStr);
                $.ajax({
                    url: "/erp/system/menuS/prcsMenuS",
                    type: "POST",
                    data: $("#hiddenform").serialize(),
                    async: true,
                    success: function(data) {
                        MsgManager.alertMsg("INF003");
                        gridMain.clearAll();
                        var menucd = $("#Pmenucd").val()
                        fn_loadGridMain(menucd);
                    }
                });
            }
        } else {
            MsgManager.alertMsg("WRN004");
        }
    } else {
        MsgManager.alertMsg("WRN002");
    }
}
/*--------트리 config / load start--------*/
function fn_treeMainConf(){
	var req = $.ajax({
		url: "/erp/system/menuS",
		type: "get",
		dataType: "json",
	    beforeSend: function() {
    	   subLayout.cells("a").progressOn();
	    },
	    success:
	    	function(jsonData) {
			if("[]"!=JSON.stringify(jsonData)) {
				var data = {menuTree:jsonData};
				fn_treeMainLoad(data);
			} else {
				MsgManager.alertMsg("WRN040");
			}
		},
	    complete: function() {
    	  subLayout.cells("a").progressOff();
        }
	});
}
var fn_treeMainLoad = function(param) {
	if(treeMain!=null) {
		treeMain.destructor();
	}
	treeMain = subLayout.cells("a").attachTree();
	treeMain = new dxTree(treeMain);
	treeMain.setData(param.menuTree);
	treeMain.click(function(id){
		fncSelectItem(treeMain, id);
	});
	
	treeMain.load("menucd", "pmenucd", "menuname", treeMain);

}
/*--------트리 config / load end--------*/

/*--------트리 select action--------*/
var fncSelectItem = function(tree, id) {
	var exegbn = "";
	try { //tree open&close
		exegbn = tree.getUserData(id, "exegbn");
		if(exegbn=="0" && tree.getDxObj().getOpenState(id)==1) {
			tree.getDxObj().closeItem(id);
		} else {
			tree.getDxObj().openItem(id);
			tree.getDxObj().selectItem(id, false, false);
		}
	} catch(e){
		alert(e);
	}
	
	if(exegbn=="0") { // 우측 그리드 조회 
		fn_loadGridMain(id);
		$("#Pmenucd").val(id);
	}

}
/*--------트리 select action--------*/
function fn_loadGridMain(menucd){
	var param = "menucd="+menucd;
	gfn_callAjaxForGrid(gridMain,param,"/erp/system/menuS/selMenuDtl",subLayout.cells("b"),fn_callBack);
}
function fn_callBack(data){
	
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="Pmenucd" name="Pmenucd" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>