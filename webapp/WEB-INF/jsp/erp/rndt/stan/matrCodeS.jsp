<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
   var gridMain, layout, toolbar, subLayout;
   var calStDate
   var popParam
   $(document).ready(function() {

    Ubi.setContainer(1, [1, 2, 3, 4], "2U"); //자재코드등록

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    //form//
    layout.cells("b").attachObject("bootContainer2");

    //left grid//
    subLayout.cells("a").setWidth("302");
    
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"자재코드",colId:"matrCode",width:"31",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재명",colId:"matrName",width:"35",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재규격",colId:"matrSpec",width:"33",align:"center",type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","pCode");
	gridMain.init();

    //right form
    subLayout.cells("b").attachObject("productCodeInfo");
    
	//calendar
    calStDate = new dhtmlXCalendarObject([{
        input: "enterDate",
        button: "calpicker1"
    }, {
        input: "useEndDate",
        button: "calpicker2"
    }]);
    calStDate.loadUserLanguage("ko");
    calStDate.hideTime();
    fn_calValue();
  //mask test
//    $('.unit').mask("#,##0", {reverse: true});
//    $('.date').mask('####/##/##');

    //combo(form)
    comboMatrGubn = dhtmlXComboFromSelect("matrGubn");
    fn_comboOpt(comboMatrGubn,"자재");

    comboDisKind = dhtmlXComboFromSelect("disKind");
    fn_comboOpt(comboDisKind,"제조","개봉");
    
    comboInspYn = dhtmlXComboFromSelect("inspYn");
    fn_comboOpt(comboInspYn,"무검사","검사");
    
    comboUseYn = dhtmlXComboFromSelect("useYn");
    fn_comboOpt(comboUseYn,"사용","미사용");
    
    comboChemicalKind = dhtmlXComboFromSelect("chemicalKind");
    fn_comboOpt(comboChemicalKind,"산","알칼리");
    comboChemicalKind.addOption("3","혼적가능");
    comboChemicalKind.addOption("4","단독선적");
	
    comboAcctKind = dhtmlXComboFromSelect("acctKind");
    comboAcctKind.setTemplate({
	    input: "#interCode#",
	    input: "#interName#",
	    columns: [
	       {header: "내부코드", width: 100,  option: "#interCode#"},
		   {header: "코드명",   width: 100,  option: "#interName#"}
	    ]
    });
    comboAcctKind.enableFilteringMode(true);
    comboAcctKind.enableAutocomplete(true);
    comboAcctKind.allowFreeText(true);
    comboAcctKind.readonly(true);
    fn_comboCodeLoad(comboAcctKind);
	
    
    gridMain.attachEvent("onRowSelect",fn_doOnRowSelect);
	fn_disabledInput();
	fn_search();

})
//doc Ready End
function fn_comboOpt(comboId,opt1,opt2){
	comboId.addOption(1,opt1);
	if(opt2==null){
		return
	}else{
		comboId.addOption(2,opt2);
	}
	comboId.readonly(true);
}
function fn_comboCodeLoad(comboId){
	   var param={};
	   param.code = "J04"
	   $.ajax({
		"url":"/erp/cmm/InterCodeR",
		"type":"post",
		"data":param,
		"success" : function(data){
		  var list = data;
		  for(var i=2;i<list.length;i++){
			comboId.addOption([
			  {value: i, text:
			  {interCode: list[i].interCode,
			   interName: list[i].interName}}   
			   ]);	
		    }
		  comboAcctKind.selectOption(0);
		}
  });
};

//calendar value
function fn_calValue(){
	var t = dateformat(new Date());
	byId("enterDate").value = t;
};

//onRowSelect Handler
function fn_doOnRowSelect(id, ind){
	byId("cudKey").value = "UPDATE";
	var param={};
	param.matrCode= gridMain.setCells(id,0).getValue();
	fn_loadFormMain(param);
}
function fn_loadFormMain(param){
	gfn_callAjaxForForm("frmMain",param,"/erp/rndt/stan/matrCodeS/selFormMain",fn_loadFormCallback);
}
function fn_loadFormCallback(data){
	comboAcctKind.setComboValue(data[0].acctKind);
}

//조회 버튼 동작
function fn_search() {
    fn_loadGridMain();
    fn_new();
}
function fn_loadGridMain(){
	var inputParams={}
	inputParams.matrCode = $("#mCode").val();
	inputParams.matrName = $("#mName").val();
	
	if(inputParams.matrName==null ||inputParams.matrName==""){
		inputParams.matrName = "%";
	}
	if(inputParams.matrCode==null ||inputParams.matrCode==""){
		inputParams.matrCode = "%";
	}
	gfn_callAjaxForGrid(gridMain,inputParams,"/erp/rndt/stan/matrCodeS/selGridMain",subLayout.cells("a"),fn_LoadGridMainCallback);
}
function fn_LoadGridMainCallback(){
	
}
//신규 버튼 동작
function fn_new(){
	byId("frmMain").reset();
	byId("frmSearch").reset();
	fn_calValue();
    comboUseYn.selectOption(0);
    comboInspYn.selectOption(0);
    comboDisKind.selectOption(0);
    comboMatrGubn.selectOption(0);
    comboAcctKind.selectOption(0);
	byId("cudKey").value = "INSERT";	
}

//저장 버튼 동작
function fn_save(){
	//$('.unit').unmask();
	 f_dxRules = {
			 matrCode : ["자재코드",r_notEmpty],
			 matrName : ["자재명",r_notEmpty],
			 matrGubn : ["구분",r_notEmpty],
			 matrSpec : ["규격",r_notEmpty],
			 matrUnit : ["단위",r_notEmpty],
			 packUnit : ["포장단위",r_onlyNumber],
			 morderUnit : ["발주단위",r_onlyNumber],
			 inputUnit : ["입고단위",r_onlyNumber],
			 outUnit1 : ["출고단위1",r_onlyNumber],
			 outUnit2 : ["출고단위2",r_onlyNumber],
			 minOrderQty : ["최소발주량",r_onlyNumber],
			 safetyQty : ["안전재고",r_onlyNumber],
			 leadTime : ["lead time",r_onlyNumber],
			 totWet : ["총중량",r_onlyNumber],
			 baseWet : ["순중량",r_onlyNumber],
			 keepTemp1 : ["보관온도",r_onlyNumber],
			 keepTemp2 : ["보관온도",r_onlyNumber]
			};
		   
 	if(gfn_formValidation('frmMain')){
		fn_nullReplaceInt();
		var params = $("#frmMain").serialize();
		console.log(params);
       $.ajax(
		{
		  type:'POST',
		  url:"/erp/rndt/stan/matrCodeS/prcsMatrCodeS",
		  data:params,
		  success:function(data)
		  {
			MsgManager.alertMsg("INF001"); 
            fn_new();
            fn_loadGridMain();
		  }
	   }); 
	}
}

//삭제 버튼 동작
function fn_remove(){
    var selRowId = gridMain.getSelectedRowId();
    var selRowIdx = gridMain.getSelectedRowIndex();
    if(gridMain.isDelRows(selRowId)) {
       if(MsgManager.confirmMsg("INF002")) {
    	   byId("cudKey").value = "DELETE";
    	   fn_nullReplaceInt();
    	   console.log($("#frmMain").serialize());
                $.ajax({
                 url : "/erp/rndt/stan/matrCodeS/prcsMatrCodeS",
                 type : "POST",
                 data : $("#frmMain").serialize(),
                 async : true,
                 success : function(data) {
                 MsgManager.alertMsg("INF003");
                 fn_new();
                 fn_loadGridMain();
                }
            });   	 
        } else {
         	 MsgManager.alertMsg("WRN004");
          } 
     }else {
         MsgManager.alertMsg("WRN002");
      }
};
//임시 function (int가 null로 넘어 갈 때 로직 필요)
function fn_nullReplaceInt(){
	//프로시져로 넘겨 받을 때 integer야 하는 인풋들
	fn_inputIntValChk('packUnit');
	fn_inputIntValChk('morderUnit');
	fn_inputIntValChk('inputUnit');
	fn_inputIntValChk('outUnit1');
	fn_inputIntValChk('outUnit2');
	fn_inputIntValChk('minOrderQty');
	fn_inputIntValChk('safetyQty');
	fn_inputIntValChk('leadTime');
	fn_inputIntValChk('totWet');
	fn_inputIntValChk('baseWet');
	fn_inputIntValChk('keepTemp1');
	fn_inputIntValChk('keepTemp2');
}
function fn_inputIntValChk(inputId){
	if($("#"+inputId).val()==""){
		$("#"+inputId).val(0);
	}
}

function fn_disabledInput(){
	  $("input[name=toxic]").attr("disabled",true);
	  $("input[name=hazard]").attr("disabled",true);
	  $("input[name=restrictHandling]").attr("disabled",true);
}
//공급사1,2 팝업
function fn_openCustCodePop(param){
	popParam = param
    gfn_load_pop('w1', 'common/supplyCompCodePOP', true,popParam);
}

function fn_closeCustCodePop(param){
	if(popParam == 1){
		$("#inputCust1").val(param);
	}else{
		$("#inputCust2").val(param);
	}
}
</script>

<style>
</style>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer2">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
        <div class="container">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 자재코드 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="mCode" id="mCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 자재명 </label>
                        <div class="col-sm-3 col-md-3">
                            <input name="mName" id="mName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="productCodeInfo" style="position: relative; width: 100%; height: 100%;">
   <form id="frmMain" class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
	<input type="hidden" id="cudKey" name="cudKey" />
       <div class="container">
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 자재코드 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="matrCode" id="matrCode" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                   <div class="col-sm-2 col-md-2">
                       <select id="matrGubn" name="matrGubn" class="form-control input-xs">
                       </select>
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 자재명 </label>
                   <div class="col-sm-6 col-md-6">
                       <input name="matrName" id="matrName" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 규격 </label>
                   <div class="col-sm-6 col-md-6">
                       <input name="matrSpec" id="matrSpec" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 단위 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="matrUnit" id="matrUnit" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 포장단위 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="packUnit" id="packUnit" type="text" value="" placeholder="" class="form-control input-xs unit"/>
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 발주단위 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="morderUnit" id="morderUnit" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 입고단위 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="inputUnit" id="inputUnit" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 출고단위1 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="outUnit1" id="outUnit1" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 출고단위2 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="outUnit2" id="outUnit2" type="text" value="" placeholder="" class="form-control input-xs unit">
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 최소발주량 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="minOrderQty" id="minOrderQty" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 공급사1 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="inputCust1" id="inputCust1" type="text" value="" placeholder="" class="form-control input-xs" onclick="fn_openCustCodePop(1)">
                   </div>
                   <div class="col-sm-2 col-md-2">
                       <input type="radio" name="inputCustKind1" value="1" checked="checked">내자
                       <input type="radio" name="inputCustKind1" value="2">외자
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 원산지 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="origin" id="origin" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 공급사2 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="inputCust2" id="inputCust2" type="text" value="" placeholder="" class="form-control input-xs"onclick="fn_openCustCodePop(2)">
                   </div>
                   <div class="col-sm-2 col-md-2">
                       <input type="radio" name="inputCustKind2" id="inputCustKind2" value="1" checked="checked">내자
                       <input type="radio" name="inputCustKind2" id="inputCustKind2" value="2">외자
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 제조사 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="makeCust" id="makeCust" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 유효기간 </label>
                   <div class="col-sm-2 col-md-2">
                        <input name="validTime" id="validTime" type="text" value="" placeholder="" class="form-control input-xs date">
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 유통기간구분 </label>
                   <div class="col-sm-2 col-md-2">
                       <select id="disKind" name="disKind" class="form-control input-xs">
                       </select>
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 안전재고 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="safetyQty" id="safetyQty" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <div class="col-sm-2 col-md-2">
                       <input type="radio" name="safetyKind" value="2" checked="checked">변동
                       <input type="radio" name="safetyKind" value="1">고정
                   </div>
               </div>
           </div>
           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> LEAD TIME </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="leadTime" id="leadTime" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 총중량 </label>
                   <div class="col-sm-2 col-md-2">
                       <input name="totWet" id="totWet" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
               </div>
           </div>

           <div class="row">
               <div class="form-group form-group-sm">
                   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 순중량</label>
                   <div class="col-sm-2 col-md-2">
                       <input name="baseWet" id="baseWet" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 보관온도 </label>
                   <div class="col-sm-2 col-md-2">
                       <div class="col-sm-4 col-md-4">
                           <input name="keepTemp1" id="keepTemp1" type="text" value="" placeholder="" class="form-control input-xs">
                       </div>
                       <label class="col-sm-4 col-md-4" style="text-align: center; vertical-align: middle;">~</label>

                       <div class="col-sm-4 col-md-4">
                           <input name="keepTemp2" id="keepTemp2" type="text" value="" placeholder="" class="form-control input-xs">
                       </div>
                   </div>
                   <label class="col-sm-2 col-md-2" style="vertical-align: middle;"> ˚C </label>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 검사유무 </label>
                    <div class="col-sm-2 col-md-2">
                        <select id="inspYn" name="inspYn" class="form-control input-xs">
                        </select>
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> Class </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="matrClass" id="matrClass" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> HS CODE </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="hsCode" id="hsCode" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> Packing Group </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="packingGroup" id="packingGroup" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> UN No </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="unNo" id="unNo" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 유독물 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="toxic" id="toxic" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 약품구분 </label>
                    <div class="col-sm-2 col-md-2">
                        <select id="chemicalKind" name="chemicalKind" class="form-control input-xs">
                        </select>
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 위험물 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="hazard" id="hazard" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 입고장소 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="inputArea" id="inputArea" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 취급제한물질 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="restrictHandling" id="restrictHandling" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 회계구분 </label>
                    <div class="col-sm-2 col-md-2">
                        <select id="acctKind" name="acctKind" class="form-control input-xs">
                        </select>
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용구분 </label>
                    <div class="col-sm-2 col-md-2">
                        <select id="useYn" name="useYn"class="form-control input-xs">
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 등록일자 </label>
                    <div class="col-sm-2 col-md-2">
                        <div class="col-sm-10 col-md-10">
                            <input name="enterDate" id="enterDate" type="text" value="" placeholder="" class="form-control input-xs date">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker2" class="calicon form-control">
                        </div>
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용중지일자 </label>
                    <div class="col-sm-2 col-md-2">
                        <div class="col-sm-10 col-md-10">
                            <input name="useEndDate" id="useEndDate" type="text" value="" placeholder="" class="form-control input-xs date">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker3" class="calicon form-control">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>