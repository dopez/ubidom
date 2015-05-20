<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
   var gridMain, layout, toolbar, subLayout;
   var calStDate
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
	gridMain.addHeader({name:"자재코드",colId:"matrCode",width:"32",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재명",colId:"matrName",width:"35",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재규격",colId:"matrSpec",width:"33",align:"center",type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","pCode");
	gridMain.init();

    //right form
    subLayout.cells("b").attachObject("productCodeInfo");
    
	//calendar
    calStDate = new dhtmlXCalendarObject([{
        input: "validTime",
        button: "calpicker1"
    }, {
        input: "enterDate",
        button: "calpicker2"
    }, {
        input: "useEndDate",
        button: "calpicker3"
    }]);
    calStDate.loadUserLanguage("ko");
    calStDate.hideTime();
    var t = dateformat(new Date());
    byId("validTime").value = t;
    byId("enterDate").value = t;
    byId("useEndDate").value = t;
    
    //combo
    comboMatrGubn = dhtmlXComboFromSelect("matrGubn");
    comboMatrGubn.addOption("1","자재");
    
    comboDisKind = dhtmlXComboFromSelect("disKind");
    comboDisKind.addOption("1","제조");
    comboDisKind.addOption("2","개봉");
    
    comboInspYn = dhtmlXComboFromSelect("inspYn");
    comboInspYn.addOption("0","무검사");
    comboInspYn.addOption("1","검사");
    
    comboChemicalKind = dhtmlXComboFromSelect("chemicalKind");
    comboChemicalKind.addOption("1","산");
    comboChemicalKind.addOption("2","알칼리");
    comboChemicalKind.addOption("3","혼적가능");
    comboChemicalKind.addOption("4","단독선적");
    
    comboAcctKind = dhtmlXComboFromSelect("acctKind");
    comboAcctKind.addOption("1","원재료");
    
    comboUseYn = dhtmlXComboFromSelect("useYn");
    comboUseYn.addOption("1","사용");
    comboUseYn.addOption("2","미사용");
    
	byId("cudKey").value = "INSERT";

})
//doc Ready End

//조회 버튼 동작
function fn_search() {
 
}

//신규 버튼 동작
function fn_new(){
	
}

//저장 버튼 동작
function fn_save(){
	 f_dxRules = {
			 matrCode : ["자재코드",r_notEmpty],
			 matrName : ["자재명",r_notEmpty]
			};
		   
	if(gfn_formValidation('frmMain')){
		var params = $("#frmMain").serialize();
		var jsonStr = JSON.stringify(params);
		console.log(jsonStr);
		console.log(params);
/*      $.ajax(
		{
		  type:'POST',
		  url:"/erp/pers/pers/persDataS/prcsPersData",
		  data:params,
		  success:function(data)
		  {
			MsgManager.alertMsg("INF001"); 
		    prcsPersDataCB(data);
		  }
	   }); */
	} 
}

//삭제 버튼 동작
function fn_remove(){
	
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
                            <input name="mCode" id="Code" type="text" value="" placeholder="" class="form-control input-xs">
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
                       <input name="packUnit" id="packUnit" type="text" value="" placeholder="" class="form-control input-xs">
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
                       <input name="outUnit2" id="outUnit2" type="text" value="" placeholder="" class="form-control input-xs">
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
                       <input name="inputCust1" id="inputCust1" type="text" value="" placeholder="" class="form-control input-xs">
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
                       <input name="inputCust2" id="inputCust2" type="text" value="" placeholder="" class="form-control input-xs">
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
                       <div class="col-sm-10 col-md-10">
                           <input name="validTime" id="validTime" type="text" value="" placeholder="" class="form-control input-xs">
                       </div>
                       <div class="col-sm-2 col-md-2">
                           <input type="button" id="calpicker1" class="calicon form-control">
                       </div>
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
                        <input name="class" id="class" type="text" value="" placeholder="" class="form-control input-xs">
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
                            <input name="enterDate" id="enterDate" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker2" class="calicon form-control">
                        </div>
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용중지일자 </label>
                    <div class="col-sm-2 col-md-2">
                        <div class="col-sm-10 col-md-10">
                            <input name="useEndDate" id="useEndDate" type="text" value="" placeholder="" class="form-control input-xs">
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