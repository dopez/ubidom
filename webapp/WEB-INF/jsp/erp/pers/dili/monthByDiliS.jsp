<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;  
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,6,8],"3E");
	//월근태
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	gridMst = new dxGrid(subLayout.cells("a"),false);
    gridMst.addHeader({name:"&nbsp;", colId:"no", 	width:"5", align:"center", type:"cntr"});
    gridMst.addHeader({name:"부서", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"직위", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"사번", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"성명", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"근무일수", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"근무시간", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"연장시간", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"야근시간", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"특근시간", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"특근연장시간", colId:"", 	width:"7", align:"center", type:"ed"});
    gridMst.addHeader({name:"특근야근(심야)", colId:"", 	width:"7", align:"center", type:"ed"});
    gridMst.addHeader({name:"주휴일수", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"지각시간", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"조퇴시간", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"외출시간", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"결근", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"무단결근", colId:"", 	width:"5", align:"center", type:"ed"});
    gridMst.addHeader({name:"연차휴가", colId:"", 	width:"5", align:"center", type:"ed"});
 	gridMst.setColSort("str");
 	gridMst.setUserData("","pk","");
 	gridMst.init();	
	
	subLayout.cells("b").attachObject("bootContainer2");
	subLayout.cells("b").setHeight(50);
	
	gridDtl = new dxGrid(subLayout.cells("c"),false);
	gridDtl.addHeader({name:"&nbsp;", colId:"no", 	width:"5", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"근무일자", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"근태구분", colId:"", 	width:"5", align:"center", type:"combo"});
	gridDtl.addHeader({name:"출근", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"퇴근", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"정상", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"연장", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"야근", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"외출", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"조퇴", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"지각", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"총근무", colId:"", 	width:"5", align:"center", type:"ed"});
	gridDtl.addHeader({name:"휴일구분", colId:"", 	width:"5", align:"center", type:"combo"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","");
	gridDtl.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t+"/"+m;
	
	$("#postName").click(function(e){
		if(e.target.id == 'postName'){
			gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()}); 
		}
	})

});
//doc ready end
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_excel(){
	
}
function fn_loadGridMst(){
	var obj={};
	//obj.workDate = $('#workDate').val();
	obj.postCode = $('#postCode').val();
	obj.jikgun = $('#jikgun').val();
	if(obj.postCode == ''){
		obj.postCode = '%';
	}
    gfn_callAjaxForGrid(gridMain,obj,"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCallBack);
}
function fn_loadGridMstCallBack(data){
	console.log(data[0].empNo);
}
function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="postCode"){
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			$('#postName').val(obj.postName);
			$('#postCode').val(obj.postCode);
		}		  
	}
 };
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
    <div class="container">
        <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                           	 년월
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker" class="calicon form-control">
                            </div>
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                           	 직군
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <select name="jikgun" id="jobgubn" class="form-control input-xs">
							   <option value="%" selected="selected">전체</option>
							   <option value="01">관리직</option>
							   <option value="02">생산직</option>
							   <option value="03">용역</option>
							   <option value="04">외국인</option>
							   <option value="05">기술직</option>
							   <option value="06">계약직</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                          부서
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                         	성명
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-offset-1 col-md-offset-1 col-sm-2 col-md-2">
                            <input type="button" name="month" id="month" value="월근태생성" class="form-control btn btn-default btn-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="bootContainer2" style="position: relative;">
    <div class="container">
        <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-10 col-md-10">
                        <label class="col-sm-4 col-md-4" for="textinput">
                            *해당사원의 1개월치 일일근태입니다.
                        </label>
                        <label class="col-sm-6 col-md-6" for="textinput">
                            1. 해당항목 수정 후 반드시 데이터 값 확인후 저장하시기 바랍니다.
                            <br> 2. 일근태 저장 후 월근태를 재생성 하시기 바랍니다.
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" name="dilisave" id="dilisave" value="일근태저장" class="form-control btn btn-default btn-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>