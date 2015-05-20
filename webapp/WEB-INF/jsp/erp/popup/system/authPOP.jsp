<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout,divAddDel;
var gridMst,treeMain;
var config={
		title:"권한등록 :: "+parent.menuNameParam,
		width:"620",
		height:"500"
	}
var menuname = parent.menuNameParam; //메뉴이름
var menucd = parent.menucdParam; //메뉴코드
$(document).ready(function(){
	Ubi.setContainer(1,[1,3],"3W");
	//권한등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    //사용자별, 그룹별 라디오 버튼 div
    layout.cells("b").attachObject("groupGbn");

    //cell 사이즈
    subLayout.cells("a").setWidth(230);
	subLayout.cells("b").setWidth(130);
	
	//버튼 div
	divAddDel = subLayout.cells("b").attachObject("divAddDel");
	
	//라디오 버튼 클릭 function
	fn_rdo_onClick();
	
	
	//버튼 클릭 이벤트
	$("#btnAdd").on("click",fn_btnAdd);
	$("#btnDel").on("click",fn_btnDel);
});
//doc Ready End

//라디오 버튼 클릭 이벤트
function fn_rdo_onClick() {
  if (userGbn.checked) {
  	gridMst = new dxGrid(subLayout.cells("a"), false);
      gridMst.addHeader({name:"사용자ID", colId:"multicd", 	width:"50", align:"center", type:"ro"});
  	gridMst.addHeader({name:"사용자명", 	 colId:"pname", 	width:"49", align:"center", type:"ro"});
  	gridMst.setColSort("str");	
  	gridMst.setUserData("","pk","multicd");
  	gridMst.dxObj.enableMultiselect(true);
  	gridMst.init();
  	
  	gridDtl = new dxGrid(subLayout.cells("c"), false);
  	gridDtl.addHeader({name:"사용자ID", colId:"logid", 	width:"18", align:"center", type:"ro"});
  	gridDtl.addHeader({name:"사용자명", 	 colId:"personname", 	width:"18", align:"center", type:"ro"});
  	gridDtl.setColSort("str");	
  	gridDtl.setUserData("","pk","logid");
  	gridDtl.dxObj.enableMultiselect(true);
  	gridDtl.init();
  	
  	fn_authList();
  	fn_noAuthList();
  	
  } else {
  	gridMst = new dxGrid(subLayout.cells("a"), false);
      gridMst.addHeader({name:"그룹코드", colId:"groupId", 	width:"50", align:"center", type:"ro"});
  	gridMst.addHeader({name:"그룹명", 	 colId:"groupName", 	width:"48", align:"center", type:"ro"});
  	gridMst.setColSort("str");	
  	gridMst.setUserData("","pk","userId");
  	gridMst.init();
  	
  	gridDtl = new dxGrid(subLayout.cells("c"), false);
  	gridDtl.addHeader({name:"그룹코드", colId:"groupId", 	width:"20", align:"center", type:"ro"});
  	gridDtl.addHeader({name:"그룹명", 	 colId:"groupName", 	width:"20", align:"center", type:"ro"});
  	gridDtl.setColSort("str");	
  	gridDtl.setUserData("","pk","userId");
  	gridDtl.init();
  }
}
//조회 버튼 동작
function fn_search(){
	fn_noAuthList();
	fn_authList();
}

//저장 버튼 동작
function fn_save(){
        var jsonStr = gridMst.getJsonUpdated2();
        if (jsonStr == null || jsonStr.length <= 0) return;
        $("#jsonData").val(jsonStr);
        $("#Pmenucd").val(menucd);
        $.ajax({
            url: "/erp/system/menuS/prcsAuthSave",
            type: "POST",
            data: $("#hiddenform").serialize(),
            async: true,
            success: function(data) {
                MsgManager.alertMsg("INF001");
                gridMst.clearAll();
                fn_authList();
                gridDtl.clearAll();
                fn_noAuthList();
            }
        });
    
}

//우측 그리드 조회
function fn_noAuthList(){
	var param = "menucd="+menucd;
	gfn_callAjaxForGrid(gridDtl,param,"/erp/system/menuS/selNoAuthList",subLayout.cells("c"),fn_callBack);
}

//좌측 그리드 조회
function fn_authList(){
	var param = "menucd="+menucd;
	gfn_callAjaxForGrid(gridMst,param,"/erp/system/menuS/selAuthList",subLayout.cells("a"),fn_callBack);
}

//콜백
function fn_callBack(){
	
}


//추가 버튼 이벤트
function fn_btnAdd(){
	var selRowId = {};
    	selRowId = gridDtl.getSelectedRowId();
   	var selRowIdArr = selRowId.split(",");
   	
   	var	logid = {};
   	var personname = {};
	
   	var totalColNum = gridMst.getColumnCount();
  	var totalRowNum = gridMst.getRowsNum();
  	
  	var multicdColIdx = gridMst.getColIndexById("multicd");
  	var pnameColIdx = gridMst.getColIndexById("pname");
  	var data = new Array(totalColNum);
  	
   	for(i=0;i<selRowIdArr.length;i++){
	    logid[i] = gridDtl.setCells(selRowIdArr[i], "0").getValue();
	    personname[i] = gridDtl.setCells(selRowIdArr[i], "1").getValue();
	    gridDtl.dxObj.deleteRow(selRowIdArr[i]);

	    data[multicdColIdx] = logid[i];
  		data[pnameColIdx] = personname[i];
		gridMst.addRow(data);
   	}
  	gridMst.selectRow(totalRowNum);
}

//제거 버튼 이벤트
function fn_btnDel() {
    var selRowId = {};
    selRowId = gridMst.getSelectedRowId();
    var selRowIdx = selRowId - 1;
    var selRowIdArr = selRowId.split(",");
    for (i = 0; i < selRowIdArr.length; i++) {
        if (gridMst.isDelRows(selRowIdArr[i])) {
            var jsonStr = gridMst.getJsonRowDel(selRowIdArr[i]);
            if (jsonStr == null || jsonStr.length <= 0) return;
            $("#jsonData").val(jsonStr);
            $("#Pmenucd").val(menucd);
            console.log(jsonStr);
            console.log($("#hiddenform").serialize());
            $.ajax({
                url: "/erp/system/menuS/prcsAuthSave",
                type: "POST",
                data: $("#hiddenform").serialize(),
                async: true,
                success: function(data) {
                    gridMst.clearAll();
                    fn_authList();
                    gridDtl.clearAll();
                    fn_noAuthList();
                }
            });
        } else {
            MsgManager.alertMsg("WRN002");
        }
    }
    MsgManager.alertMsg("INF003");
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="Pmenucd" name="Pmenucd" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="divAddDel" style="display:table; height:100%; width:100%; background:linear-gradient(#e0e0e0, #d9d9d9);overflow:hidden;text-align:center;">
    <div class="form-group form-group-sm" style=" position:absolute;top: 50%;display:table-cell; vertical-align:middle;  margin-top:-40%;">
        <div class="col-sm-offset-1 col-sm-10">
            <input name="btnAdd" id="btnAdd" type="button" value="◀ 추가" placeholder="" class="btn btn-default btn-xs form-control" style="margin-bottom: 15px">
            <input name="btnDel" id="btnDel" type="button" value="제거 ▶" placeholder="" class="btn btn-default btn-xs form-control">
        </div>
    </div>
</div>
<div id="groupGbn" style="position: relative;">
    <div class="container">
	    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
	        <div class="form-group form-group-sm">
	            <div class="col-sm-2 col-md-2">
		            <div class="col-sm-offset-1 col-sm-11 col-md-11">
		                <input type="radio" id="userGbn" name="groupGbn" value="0" onclick="fn_rdo_onClick()" checked="checked">사용자별
		                <input type="radio" id="gpGbn"name="groupGbn" value="1" onclick="fn_rdo_onClick()">그룹별
		            </div>
	            </div>
	        </div>
	    </form>
    </div>
</div>