<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout,divAddDel;
var gridMain,treeMain;
var config={
		title:"권한등록 :: "+parent.menuNameParam,
		width:"800",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(1,[1,3],"3W");
	//권한등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("groupGbn");
	subLayout.cells("b").setWidth(100);
	divAddDel = subLayout.cells("b").attachObject("divAddDel");
	rdo_onClick();
    

	
	

});
function rdo_onClick() {
    if (userGbn.checked) {
    	gridMst = new dxGrid(subLayout.cells("a"), false);
        gridMst.addHeader({name:"No", colId:"rowNo", 	width:"33", align:"center", type:"cntr"});
        gridMst.addHeader({name:"사용자ID", colId:"userId", 	width:"33", align:"center", type:"ro"});
    	gridMst.addHeader({name:"사용자명", 	 colId:"userName", 	width:"33", align:"center", type:"ro"});
    	gridMst.setColSort("str");	
    	gridMst.setUserData("","pk","userId");
    	gridMst.init();
    	
    	gridDtl = new dxGrid(subLayout.cells("c"), false);
    	gridDtl.addHeader({name:"No", colId:"rowNo", 	width:"20", align:"center", type:"cntr"});
    	gridDtl.addHeader({name:"사용자ID", colId:"userId", 	width:"20", align:"center", type:"ro"});
    	gridDtl.addHeader({name:"사용자명", 	 colId:"userName", 	width:"20", align:"center", type:"ro"});
    	gridDtl.setColSort("str");	
    	gridDtl.setUserData("","pk","userId");
    	gridDtl.init();
    } else {
    	gridMst = new dxGrid(subLayout.cells("a"), false);
        gridMst.addHeader({name:"No", colId:"rowNo", 	width:"33", align:"center", type:"cntr"});
        gridMst.addHeader({name:"그룹코드", colId:"groupId", 	width:"33", align:"center", type:"ro"});
    	gridMst.addHeader({name:"그룹명", 	 colId:"groupName", 	width:"33", align:"center", type:"ro"});
    	gridMst.setColSort("str");	
    	gridMst.setUserData("","pk","userId");
    	gridMst.init();
    	
    	gridDtl = new dxGrid(subLayout.cells("c"), false);
    	gridDtl.addHeader({name:"No", colId:"rowNo", 	width:"20", align:"center", type:"cntr"});
    	gridDtl.addHeader({name:"그룹코드", colId:"groupId", 	width:"20", align:"center", type:"ro"});
    	gridDtl.addHeader({name:"그룹명", 	 colId:"groupName", 	width:"20", align:"center", type:"ro"});
    	gridDtl.setColSort("str");	
    	gridDtl.setUserData("","pk","userId");
    	gridDtl.init();
    }
    function fn_search(){
    	console.log(parent.menuNameParam);
    }
}
</script>
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
		                <input type="radio" id="userGbn" name="groupGbn" value="0" onclick="rdo_onClick()" checked="checked">사용자별
		                <input type="radio" id="gpGbn"name="groupGbn" value="1" onclick="rdo_onClick()">그룹별
		            </div>
	            </div>
	        </div>
	    </form>
    </div>
</div>