<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,3,5,6],"1C");
	//재증명서발급
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",           width:"4", align:"center", type:"cntr"});
	gridMain.addHeader({name:"발급일자", colId:"passpostDate", width:"7", align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"발급번호", colId:"passpostNo",   width:"7", align:"center", type:"ed"});
	gridMain.addHeader({name:"구분",     colId:"certKind",     width:"5", align:"center", type:"combo"});
	gridMain.addHeader({name:"성명",     colId:"korName",      width:"7", align:"center", type:"ro"});	
	gridMain.addHeader({name:"담당업무", colId:"workName",     width:"7", align:"center", type:"ed"});	
	gridMain.addHeader({name:"신청일자", colId:"applyDate",    width:"7", align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"용도",     colId:"useType",      width:"7", align:"center", type:"ed"});
	gridMain.addHeader({name:"제출처",   colId:"custSubject",  width:"7", align:"center", type:"ed"});
	gridMain.addHeader({name:"발급자",   colId:"balgbja",      width:"7", align:"center", type:"ed"});
	gridMain.addHeader({name:"매수",     colId:"maesu",        width:"4", align:"center", type:"edn"});
	gridMain.setUserData("","pk","no");
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["empNo"]);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	
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
	fn_calValue();
	fn_search();
	
	$("#certiBtn").click(function(){
		var rowCheck = gridMain.getSelectedRowId();
		if(rowCheck == null){
			return false;
		}else{
			var url = "/erp/pers/pers/certificateDataS/report/CertificateDataP.do";
			url = url + "?empNo=" + gridMain.setCells(rowCheck,11).getValue();
			url = url + "&passpostDate="+ gridMain.setCells(rowCheck,1).getValue();
			url = url + "&passpostNo="+ gridMain.setCells(rowCheck,2).getValue();
			window.open(url,'rpt',''); 
		}
	});
	
	var combo =gridMain.getColumnCombo(3);
	  combo.setTemplate({
		    input: "#interName#",
		    columns: [
		       {header: "구분", width: 100,  option: "#interName#"}
		    ]
		});

	 combo.addOption("1","재직");
	 combo.addOption("2","경력");
	 combo.enableFilteringMode(true);
	 combo.enableAutocomplete(true);
	 combo.allowFreeText(true);
});
function doOnRowSelect(id,ind){
	if(ind==4){
		gfn_load_pop('w1','common/empPOP',true,{"korName":""});
		}
}
function fn_calValue(){
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("endDate").value = t;
};
function fn_search(){
	fn_loadGridLeftList();
	fn_calValue();
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

function fn_loadGridLeftList(){
	var obj={};
	obj.stDate = $('#stDate').val();
	obj.endDate = $('#endDate').val();
    gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"));
    byId("frmMain").reset();
}
function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="empNo"){
		for(i=0;i<data.length;i++){
			obj.korName=data[i].korName;
			obj.empNo=data[i].empNo;
				var selRowIdx = gridMain.getSelectedRowIndex();
				gridMain.setCells2(selRowIdx,4).setValue(obj.korName);
				gridMain.setCells2(selRowIdx,11).setValue(obj.empNo); 
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
				 기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'endDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="endDate" id="endDate" value="">
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