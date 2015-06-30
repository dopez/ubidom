<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var combo01, combo02;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(1,[1,3,5,6],"1C");
	//재증명서발급
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",           width:"50",  align:"center", type:"cntr"});
	gridMain.addHeader({name:"발급일자", colId:"passpostDate", width:"80",  align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"발급번호", colId:"passpostNo",   width:"80",  align:"left",   type:"ed"});
	gridMain.addHeader({name:"구분",     colId:"certKind",     width:"80",  align:"left",   type:"combo"});
	gridMain.addHeader({name:"사원번호", colId:"empNo",        width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",      width:"80",  align:"left",   type:"combo"});	
	gridMain.addHeader({name:"담당업무", colId:"workName",     width:"80",  align:"left",   type:"ed"});	
	gridMain.addHeader({name:"신청일자", colId:"applyDate",    width:"80",  align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"용도",     colId:"useType",      width:"100", align:"left",   type:"ed"});
	gridMain.addHeader({name:"제출처",   colId:"custSubject",  width:"150", align:"left",   type:"ed"});
	gridMain.addHeader({name:"발급자",   colId:"balgbja",      width:"80",  align:"left",   type:"ed"});
	gridMain.addHeader({name:"매수",     colId:"maesu",        width:"50",  align:"right",  type:"edn"});
	gridMain.setUserData("","pk","no");
	gridMain.dxObj.setUserData("","@passpostDate","format_date");
	gridMain.dxObj.setUserData("","@applyDate","format_date");
	gridMain.init(); 
	gridMain.attachEvent("onRowDblClicked",doOnRowDbClicked);

	g_dxRules = {
			passpostNo :   [r_notEmpty, r_len + "|3"],
			passpostDate : [r_notEmpty],
			certKind :     [r_notEmpty],
			korName :      [r_notEmpty],
			workName :     [r_notEmpty],
			applyDate :    [r_notEmpty],
			useType :      [r_notEmpty],
			custSubject :  [r_notEmpty],
			balgbja :      [r_notEmpty],
			maesu :        [r_notEmpty]
		};
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"endDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("endDate").value = t;
	
	
	$("#certiBtn").click(function(){
		var rowCheck = gridMain.getSelectedRowId();
		if(rowCheck == null){
			return false;
		}else{
			var url = "/erp/pers/pers/certificateDataS/report/CertificateDataP.do";
			url = url + "?empNo=" + gridMain.setCells(rowCheck,4).getValue();
			url = url + "&passpostDate="+ gridMain.setCells(rowCheck,1).getValue();
			url = url + "&passpostNo="+ gridMain.setCells(rowCheck,2).getValue();
			window.open(url,'rpt',''); 
		}
	});
	var certKindIdx = gridMain.getColIndexById('certKind');
	var korNameIdx =  gridMain.getColIndexById('korName');
	combo01 =gridMain.getColumnCombo(certKindIdx);
	combo02 =gridMain.getColumnCombo(korNameIdx);
	gfn_single_comboLoad(combo01,["1","2"],["재직","경력"],2);
	gfn_codeLen2_comboLoad(combo02,"사원");

	combo02.attachEvent("onBlur", function(){
		var rowIdx = gridMain.getSelectedRowIndex();
		gridMain.setCells2(rowIdx,4).setValue(combo02.getSelectedText().empNo);
		gridMain.setCells2(rowIdx,5).setValue(combo02.getSelectedText().korName);
		});
});

function doOnRowDbClicked(id,ind){
	if(ind==4){
		gfn_load_pop('w1','common/codeLen2POP',true,{});
		}
}
function fn_onOpenPop(pName){
	if(pName=="codeLen2"){
		var obj = {};
		obj.innerName = '';
		obj.kind = "사원";
	} 
	return obj;
}
function fn_search(){
	fn_loadGridMain();
}
function fn_add(){
	 var totalColNum = gridMain.getColumnCount();
	    var data = new Array(totalColNum);
	    var passpostDateColIdx = gridMain.getColIndexById('passpostDate');
	    var applyDateColIdx = gridMain.getColIndexById('applyDate');  
		    data[passpostDateColIdx] = dateformat(new Date());
		    data[applyDateColIdx] = dateformat(new Date());
		    gridMain.addRow(data);
}

function fn_save(){
	 var jsonStr = gridMain.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;     
       $("#jsonData").val(jsonStr);                      
       $.ajax({
          url : "/erp/pers/pers/certificateDataS/gridMainSave",
          type : "POST",
          data : $("#pform").serialize(),
          async : true,
          success : function(data) {
          MsgManager.alertMsg("INF001");
          fn_search();
           }
      }); 
}

function fn_delete(){
    var rodid = gridMain.getSelectedRowId();
    gridMain.cs_deleteRow(rodid);
}

function fn_loadGridMain(){
	var obj= gfn_getFormElemntsData('frmMain');	
    gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
}

function fn_loadGridMainCB(data){
	$('#stDate').keyup();
	$('#endDate').keyup();
}

function fn_onClosePop(pName,data){
	if(pName=="empNo"){
		var empNoIdx = gridMain.getColIndexById('empNo');
		var korNameIdx = gridMain.getColIndexById('korName');
		var selRowIdx = gridMain.getSelectedRowIndex();
		gridMain.setCells2(selRowIdx,korNameIdx).setValue(data[0].korName);
		gridMain.setCells2(selRowIdx,empNoIdx).setValue(data[0].empNo); 		  
	}  
 };
 
 function fn_exit(){
	 mainTabbar.tabs(ActTabId).close();	
	}
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
				 기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'endDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="endDate" id="endDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                          </div>
                       </div> 
                 </div> 
                 <div class="col-sm-2 col-md-2">
			       <input name="certiBtn" id="certiBtn" type="button" value="증명서발급" placeholder="" class="form-control btn btn-default btn-xs">
			    </div>             
			</div>
		</div>
	  </div> 
  </form>
 </div> 
</div>