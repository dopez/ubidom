<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;  
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8],"1C");
	//월근태종합현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"),false);
	gridMain.addHeader({name:"NO",           colId:"no", 	    width:"2", align:"center", type:"cntr"});
    gridMain.addHeader({name:"부서",         colId:"postName", 	width:"4", align:"center", type:"ro"});
    gridMain.addHeader({name:"직위",         colId:"jikweeName", width:"4", align:"center", type:"ro"});
    gridMain.addHeader({name:"사번",         colId:"empNo", 	    width:"4", align:"center", type:"ro"});
    gridMain.addHeader({name:"성명",         colId:"korName", 	width:"4", align:"center", type:"ro"});
    gridMain.addHeader({name:"근무일수",     colId:"workDay", 	width:"4", align:"center", type:"ro"});
    gridMain.addHeader({name:"근무시간",     colId:"workTime", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"연장시간",     colId:"overTime", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"야근시간",     colId:"nightTime", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"특근시간",     colId:"holiTime", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"특근연장시간", colId:"holiOver", 	width:"6", align:"center", type:"ron"});
    gridMain.addHeader({name:"주휴일수",     colId:"weekHoliy", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"지각시간",     colId:"lateTime", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"조퇴시간",     colId:"earlyTime", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"외출시간",     colId:"partTime", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"결근",         colId:"absence", 	width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"무단결근",     colId:"awol", 	    width:"4", align:"center", type:"ron"});
    gridMain.addHeader({name:"연차휴가",     colId:"yuncha", 	width:"4", align:"center", type:"ron"});
    gridMain.setColSort("str");
    gridMain.setUserData("","pk","no");
 	gridMain.init();	
 	gridMain.cs_setColumnHidden(["totalTime","compId",'yymm']);
	gridMain.enableSmartRendering(false);
	
	calMain = new dhtmlXCalendarObject([{input:"frYymm",button:"calpicker1"},{input:"toYymm",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y/%m");
	calMain.hideTime();
	var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("frYymm").value = t+"/"+m;
	byId("toYymm").value = t+"/"+m;
	
	$("#postName").click(function(e){
	  gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()}); 
	});
});
function fn_search(){
	fn_loadGridMain();
}
function fn_loadGridMain(){
	var obj = gfn_getFormElemntsData("frmSearch");
    gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
}
function fn_loadGridMainCB(data){
 	
	 gridMain.dxObj.customGroupFormat=function(name,count){
		 var yyyy = name.substring(0,4);
		 var mm = name.substring(4,6);
	      return yyyy+"년 "+mm+"월";
	}
	
	gridMain.dxObj.groupBy(20,["","#title","#cspan","#cspan","#cspan","#cspan","#cspan","#cspan","#cspan","#cspan"
	                           ,"#cspan","#cspan","#cspan","#cspan","#cspan","#cspan","#cspan","#cspan"]); 
	
	
	$('#frYymm').keyup();
	$('#toYymm').keyup();
	$('#postCode').val('%');
	$('#postName').val('');
};
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
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
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <input type="hidden" id="postCode" name="postCode" value="%">
      <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				 집계기간
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="frYymm" id="frYymm" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker1" class="calicon form-control"  onclick="setSens(1,'toYymm', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="toYymm" id="toYymm" value="">
                          </div>
                          <div class="col-sm-2 col-md-2"> 
                             <input type="button" id="calpicker2" class="calicon form-control"  onclick="setSens(1,'frYymm', 'min')">
                          </div>
                       </div> 
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
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 직군
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jikgun" id="jikgun" class="form-control input-xs">
			   <option value="%">전체</option>
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
  </form>
 </div> 
</div>