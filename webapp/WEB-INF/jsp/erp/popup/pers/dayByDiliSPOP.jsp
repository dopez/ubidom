<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout;
var gridMain;
var calMain, calMain2;
var toolbar;
var config={
		title:"일일근태생성",
		id:"saveDiliS",
		width:"450",
		height:"250"
	}
$(document).ready(function(){
	
	layout = new dhtmlXLayoutObject("container", "1C");
	layout.cells("a").attachObject("bootContainer");
	layout.cells("a").hideHeader();

    calMain = new dhtmlXCalendarObject([{input:"frDate",button:"calpicker1"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	calMain.setPosition("right","bottom");
	var t = dateformat(new Date());
	byId("frDate").value = t;
	
	calMain2 = new dhtmlXCalendarObject([{input:"toDate",button:"calpicker2"}]);
	calMain2.loadUserLanguage("ko");
	calMain2.hideTime();
	calMain2.setPosition("left","bottom");
	var t = dateformat(new Date());
	byId("toDate").value = t; 
	
	
	$("#saveBtn,#cancelBtn").click(function(e){
		if(e.target.id == "saveBtn"){
		 	fn_gridCntSearch();
		}
		if(e.target.id == "cancelBtn"){
			parent.dhxWins.window("w1").close();
		}
	});
	
});

function fn_gridCntSearch(){
	var params = gfn_getFormElemntsData('frmSearch');
	gfn_callAjaxForForm("frmMain",params,"/erp/pers/dili/dayByDiliS/gridPopSearch",fn_gridCntSearchCB);
}
function fn_gridCntSearchCB(data){
	$('#frDate').keyup();
	$('#toDate').keyup();
	if(data[0].cnt > 0){
		if(MsgManager.confirmMsg("INF005")) { 
			fn_saveDiliS();
		}
	}else{
		fn_saveDiliS();
	}
}
function fn_saveDiliS(){
	var params = gfn_getFormElemntsData('frmSearch');
	gfn_callAjaxForForm("frmMain",params,"/erp/pers/dili/dayByDiliS/gridPopSave",fn_gridCntSearchCB);
	parent.fn_onClosePop(config.id,{});
	parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 400px;">
			<div class="col-xs-12" style="margin-top: 50px;">
				<label class="col-xs-3 control-label" for="textinput" style="text-align: right; margin-top: 4px;">
				 생성기간 
				</label>
				<div class="col-xs-9">
                    <div class="col-xs-5">
                         <div class="col-xs-10">
                              <input type="text" class="form-control input-xs format_date" name="frDate" id="frDate" value="">
                         </div>
                         <div class="col-xs-2">
                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'toDate', 'max')">
                          </div>
                     </div>
                       <div class="col-xs-2">
                        <label class="col-xs-4 col-xs-offset-1 control-label" style="margin-top: 4px;margin-left: 1px;">
                        ~
                        </label>
                       </div>
                        <div class="col-xs-5">
                          <div class="col-xs-10">
                              <input type="text" class="form-control input-xs format_date" name="toDate" id="toDate" value="">
                          </div>
                          <div class="col-xs-2">
                             <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'frDate', 'min')">
                          </div>
                       </div> 
                 </div>       
			</div>
			<div class="col-xs-12" style="margin-top: 30px;">
				<div class="col-xs-2 col-xs-offset-4">
                    <input type="button" name="saveBtn" id="saveBtn" value="생성" class="form-control btn btn-default btn-xs">
                 </div> 
                 <div class="col-xs-2 col-xs-offset-2">
                    <input type="button" name="cancelBtn" id="cancelBtn" value="취소" class="form-control btn btn-default btn-xs">
                 </div>         
			</div>
		</div>
  </form>
</div>
