<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
var combo01;
var popValue = $('#supplCompName').val();
$( document ).ready(function() {
	
	Ubi.setContainer(3, [1, 2, 3, 4, 5, 6], "1C"); //combo_sample
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	
	gridMain = new dxGrid(subLayout.cells("a"), true);
	
	gridMain.addHeader({name:"No", colId:"gridNo", width:"10", type:"ed"});
	gridMain.addHeader({name:"품목코드", colId:"itemCode", width:"10", type:"combo"});
	gridMain.addHeader({name:"품목명", colId:"itemName", width:"10", type:"ro"});
	gridMain.setColSort("str");
	gridMain.setUserData("","pk","itemCode");
	gridMain.init();
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
        gridMain.attachEvent("onRowSelect", function(id,ind){
        	gridMain.editCell();
        	if(ind==1){
     		   doOnOpen(combo01);
     	   }else if(ind==2){
     		   gfn_load_pop("w1","common/supplyCompCodePOP",true);
     	   }
      	});
		//항목삽입
        toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				fn_insert();
			}
		});
        
        toolbar.attachEvent("onClick", function(id) {
			if(id == "btn1"){
				alert(popValue);
			}
		});
		//Combo
		var combo01=gridMain.getColumnCombo(1);
		fn_comboMake(combo01,"#itemCode#","품목코드",100,"#itemCode#","품목명",100,"#itemName#");
		fn_comboReadOnly(combo01);
   		combo01.attachEvent("onClose", function() {
 			gridMain.setCells2(gridMain.getSelectedRowIndex(),2).setValue(combo01.getSelectedText().itemName);
		})
		//Combo End
    })
    
    
    
		function fn_comboMake(combo,toInput,hName,hWidth,optName,hName2,hWidth2,optName2){
			
 			/* var comboHeader = "";
			comboHeader += '{'+'header:'+'"'+hName+'"'+',width:'+hWidth+', option:'+'"'+optName+'"'+'},';
			comboHeader += '{'+'header:'+'"'+hName2+'"'+',width:'+hWidth2+', option:'+'"'+optName2+'"'+'}';
			alert(comboHeader); */ 
			 combo.load({
					template: {
					    input: toInput,
					    columns: [
					        //comboHeader
					        {header: "itemCode", width: 110,  option: "#itemCode#"},
					        {header: "itemName", width: 100,  option: "#itemName#"}
					    ]
					},
					options: [
					    
					]
				}); 
			combo.enableFilteringMode(true);
			combo.enableAutocomplete(true);
			combo.allowFreeText(true);
		}
		
/* 			var comboHeader = {header:"",width:"",option:""};
			comboHeader.header = new Array();
			comboHeader.width = new Array();
			comboHeader.option = new Array();
			var setComHeader = function(val){
				comboHeader.header.push(val.name);
				comboHeader.width.push(val.width);
				comboHeader.option.push(val.option);
			}
			var sample = setComHeader({name:"품목코드", width:"100", option:"#itemName#"});
			alert(sample); */
		
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
 			                  {itemCode: jsonData[i].itemCode,
 			                  itemName:jsonData[i].itemName}}   
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
                                        <input name="supplCompName" id="supplCompName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_pop('w1','common/supplyCompCodePOP',false)">
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