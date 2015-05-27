<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
var combo01;
$( document ).ready(function() {
	
	Ubi.setContainer(3, [1, 2, 3, 4, 5, 6], "1C"); //구매의뢰(원부자재)등록
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");      //10 col
	gridMain.setHeader("No,품목코드,품명,규격,단위,수량,단가,금액,납기일자,용도,첨부", null, 
				[]);
	gridMain.setInitWidths("50,200,200,150,100,100,100,100,100,200,100");       
	gridMain.setColAlign("center,left,left,left,center,right,right,right,center,center,center");     
	gridMain.setColTypes("ro,combo,combo,ed,ed,edn,edn,edn,ed,ed,ed"); 
	gridMain.setColSorting("str,str,str,str,str,int,int,int,date,str,str");
	gridMain.init();
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
		//항목삽입
        toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				fn_insert();
			}
		});
	////combo01 combo02//////////////////////////////////////////////////////
		var combo01=gridMain.getColumnCombo(1);
		var combo02=gridMain.getColumnCombo(2);
		
		fn_comboMake(combo01,"#ITEM_CODE#");
		fn_comboMake(combo02,"#ITEM_NAME#");
		
        gridMain.attachEvent("onRowSelect", function(id,ind){
        	gridMain.editCell();
        	if(ind==1){
     		   doOnOpen(combo01);
     	   }else if(ind==2){
     		   doOnOpen(combo02);
     	   }else if(ind==3){
     		   gfn_load_popup1("w1","common/supplyCompCodePOP",true);
     	   }
      	});

   		combo01.attachEvent("onClose", function() {
 		alert(combo01.getSelectedText().ITEM_NAME);
 			gridMain.cells2(gridMain.getRowIndex(gridMain.getSelectedId()),2).setValue(combo01.getSelectedText().ITEM_NAME);
		})
 		combo02.attachEvent("onClose", function() {
 			gridMain.cells2(gridMain.getRowIndex(gridMain.getSelectedId()),1).setValue(combo02.getSelectedText().ITEM_CODE);
		}) 
		
/*  		fn_onClose(gridMain,combo01,2,'ITEM_NAME');
		function fn_onClose(gridName,comboName,cId,optName){
 				var getSId = gridName.getSelectedId();
 				var getSText = comboName.getSelectedText().optName;
 				alert(getSText);
 			comboName.attachEvent("onClose", function() {
 				alert(comboName.getSelectedText().optName);
 				gridName.cells2(gridName.getRowIndex(getSId),cId).setValue(getSText);
 			})
 		} */
		fn_comboReadOnly(combo01);
		fn_comboReadOnly(combo02);
		function fn_comboMake(combo,toInput){
			 combo.load({
					template: {
					    input: toInput,
					    columns: [
					        {header: "ITEM_CODE", width: 110, css: "ITEM_CODE", option: "#ITEM_CODE#"},
					        {header: "ITEM_NAME", width: 100, css: "ITEM_NAME", option: "#ITEM_NAME#"},
					    ]
					},
					options: [
					    
					]
				}); 
			combo.enableFilteringMode(true);
			combo.enableAutocomplete(true);
			combo.allowFreeText(true);
		}
 		function doOnOpen(combo){
 			$.ajax({
 				"url":"/erp/subTest",
 				"type":"get",
 				"data":{}
 			    }).done(function(jsonData) {
 					if(jsonData!="") {
 					
 						for(var i=0;i<=jsonData.length;i++){
 				        	combo.addOption([
 			                  {value: i, text:
 			                  {"ITEM_CODE": jsonData[i].itemCode,
 			                  "ITEM_NAME":jsonData[i].itemName}}   
 				            ]);
 			           }
 						
 			        }else {
 			          alert("No Data");
 			        }
 				});	
 			
 		}
		function fn_comboReadOnly(combo){
				combo.attachEvent("onChange", function(){
				combo.allowFreeText(false);
				combo.readonly(true);
				combo.enableFilteringMode(false);
				combo.enableAutocomplete(false);
			});
		}
		////combo End//////////////////////////////////////////////////////
    })
    function fn_insert() {
		var totalColNum = gridMain.getRowsNum();
	    var data = new Array(totalColNum);
	          gridMain.addRow(data, 0, 2);
	}
</script>
        <div id="container" style="position: relative; widtd: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">일자</label>
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
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">공급업체</label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="supplCompName" id="supplCompName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('공급업체','common/supplyCompCodePOP')">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                        의뢰자 </label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="rqstName" id="rqstName" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('공급업체','common/testCodePOP')">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>