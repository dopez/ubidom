<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calStDate;
var popParam;

$(document).ready(function() {

    Ubi.setContainer(2, [1, 2, 3, 4, 5, 6], "1C"); //업무일지등록

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    //form//
    layout.cells("b").attachObject("bootContainer");

    //grid	
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",colId:"rNum",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"고객",colId:"custKorName",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"종류",colId:"workKind",width:"5",align:"center",type:"combo"});
    gridMain.addHeader({name:"내용",colId:"no",width:"15",align:"left",type:"ed"});
    gridMain.addHeader({name:"첨부",colId:"fileName",width:"5",align:"left",type:"ed"});
    gridMain.setUserData("","pk","");
    gridMain.setColSort("str");
    gridMain.init();
    gridMain.cs_setColumnHidden(["empNo","logDate","logSeq","logNum","logName","custCode"]);
	
    //combo
   	var combo01 = gridMain.getColumnCombo(2);
	fn_comboLoad(combo01,gridMain.getColumnId(2),"W01",2);

    //setDate//
    calStDate = new dhtmlXCalendarObject([{
        input: "stDate",
        button: "calpicker1"
    }]);
    calStDate.loadUserLanguage("ko");
    calStDate.hideTime();
    var t = dateformat(new Date());
    byId("stDate").value = t;

    //popUp
    gridMain.attachEvent("onRowSelect",doOnRowSelect);
     
	$("#korName").click(function(e){
		if(e.target.id == "korName"){
			popParam = e;
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		  }
    })
	  
})
//doc ready end
var te;
function fn_search(){
	alert(1234);
	te = parent.scrnParm;
	alert(te);
}
function fn_save(){
	 var selRowIdx = gridMain.getSelectedRowIndex();
	 var empNoColIdx = gridMain.getColIndexById('empNo');    
	 var empNoVal = $("#empNo").val();
	 gridMain.setCells2(selRowIdx,empNoColIdx).setValue(empNoVal);
	 var jsonStr = gridMain.getJsonUpdated2();
	 console.log(jsonStr);
/*    if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData").val(jsonStr);                      
       $.ajax({
          url : "/erp/pers/pers/persAppointS/gridDtlSave",
          type : "POST",
          data : $("#pform").serialize(),
          async : true,
          success : function(data) {
          MsgManager.alertMsg("INF001");
          gridMst.selectRow(rowIdx,true,true,true);
          }
      }); */ 
}

function fn_comboLoad(comboId,inputName,params,colIndx){
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
		   {header: "종 류",   width: 100,  option: "#interName#"}
	    ]
	});
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
	var obj={};
	obj.compId = '100';
	obj.code = params;
	doOnOpen(comboId,obj,colIndx);
}
function doOnOpen(comboId,params,colIndx){
		$.ajax({
			"url":"/erp/cmm/InterCodeR",
			"type":"post",
			"data":params,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				  comboId.addOption(list[i].interCode,list[i].interName);
			    }
			}
	  });	
}

function doOnRowSelect(rowId,colIdx){
	var param = ""
		if(colIdx==1){
			  gfn_load_pop('w1','common/customPOP',true,{"custKorName":param});
		}
}        
function fn_add(){
	 var totalColNum = gridMain.getColumnCount();
	    var data = new Array(totalColNum);
		var empNoColIdx = gridMain.getColIndexById('empNo');    
	    var logDateColIdx = gridMain.getColIndexById('logDate');
	    var logSeqColIdx = gridMain.getColIndexById('logSeq');
	        data[empNoColIdx] = $("#empNo").val();
	        data[logDateColIdx] = $("#stDate").val();
	        data[logSeqColIdx] = $("#seqNo").val();
	        gridMain.addRow(data);
}
function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="custCode"){
		for(i=0;i<data.length;i++){
			obj.custKorName=data[i].custKorName;
			obj.custCode=data[i].custCode;
				var selRowIdx = gridMain.getSelectedRowIndex();
				var custCodeIdx = gridMain.getColIndexById('custCode');
				var custKorNameIdx = gridMain.getColIndexById('custKorName');
				gridMain.setCells2(selRowIdx,custCodeIdx).setValue(obj.custCode);
				gridMain.setCells2(selRowIdx,custKorNameIdx).setValue(obj.custKorName); 
		}		  
	}else if(pName == "empNo"){
		for(i=0;i<data.length;i++){
			obj.korName=data[i].korName;
			obj.empNo=data[i].empNo;
				$('#korName').val(obj.korName);
				$('#empNo').val(obj.empNo);
				//저장할 때 gridMain.setCells2(selRowIdx,empNoColIdx).setValue($("#empNo").val()); 맞춰주기
		}
	}  
 };
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
                        <div class="col-sm-1 col-md-1">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                        <div class="col-sm-1 col-md-1">
                            <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>