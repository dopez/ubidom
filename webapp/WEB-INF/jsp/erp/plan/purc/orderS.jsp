<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
	        var layout, toolbar, subLayout	
            var gridMain, gridSub;
            var calMain;
            $(document).ready(function() {

            	Ubi.setContainer(2,[1,2,3,4,5,6], "2E"); //발주등록

            	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();             	
            	
                layout.cells("b").attachObject("bootContainer");
				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("품의내역");

                gridMain = new dxGrid(subLayout.cells("a"),false);
                gridMain.addHeader({name:"No",colId:"no",width:"50",align:"center",type:"cntr"});
                gridMain.addHeader({name:"품의일자",colId:"setDate",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"품의자",colId:"empName",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"공급업체",colId:"custName",width:"100",align:"left",type:"ro"});
                gridMain.addHeader({name:"결재금액",colId:"amt",width:"100",align:"right",type:"ro"});
                gridMain.addHeader({name:"발주",colId:"",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"인쇄",colId:"",width:"100",align:"center",type:"ro"});
                gridMain.setUserData("","pk","no");
                gridMain.setColSort("str");
                gridMain.dxObj.setUserData("", "@setDate","format_date");
                gridMain.init();
                gridMain.enableMultiselect(true);
                gridMain.cs_setNumberFormat(["amt"], "0,000");
                gridMain.cs_setColumnHidden(["compId", "setSeq", "setNo", "matrName", "matrSpec", "matrUnit", "qty", "cost", "amt", "deliDate", "deliPlace", "purcConsultKey"]);                
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                
  				subLayout.cells("b").showHeader();
				subLayout.cells("b").setText("발주상세내역");
                gridSub = new dxGrid(subLayout.cells("b"),false);
                gridSub.addHeader({name:"No",colId:"no",width:"50",align:"center",type:"cntr"});
                gridSub.addHeader({name:"품명",colId:"matrName",width:"100",align:"center",type:"ed"});
                gridSub.addHeader({name:"규격",colId:"matrSpec",width:"100",align:"center",type:"ed"});
                gridSub.addHeader({name:"단위",colId:"matrUnit",width:"100",align:"left",type:"ed"});
                gridSub.addHeader({name:"수량",colId:"qty",width:"100",align:"right",type:"edn"});
                gridSub.addHeader({name:"단가",colId:"cost",width:"100",align:"right",type:"edn"});
                gridSub.addHeader({name:"금액",colId:"amt",width:"100",align:"right",type:"edn"});
                gridSub.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"center",type:"dhxCalendarA"});
                gridSub.addHeader({name:"납품장소",colId:"deliPlace",width:"100",align:"center",type:"ed"});
                gridSub.setUserData("","pk","no");
                gridSub.setColSort("str");     
                gridSub.dxObj.setUserData("", "@deliDate","format_date");
                gridSub.init();
                gridSub.cs_setNumberFormat(["qty", "cost", "amt"], "0,000");
                gridSub.cs_setColumnHidden(["compId", "setSeq", "setNo", "purcConsultKey"]);
                gridSub.attachEvent("onRowSelect",doOnRowSelect);
                gridSub.attachEvent("onRowDblClicked",doOnRowSubDblClicked);
                gridSub.attachEvent("onCellChanged",doOnCellChanged);
                
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
            	if($('#stDate').val() == ""){
          			byId("stDate").value = t;
          		}

                $("#custName").dblclick(function(){
                	gfn_load_pop('w1', 'common/customPOP', true, {"custKorName": ""});
                });
                
                fn_onClosePop = function(pName, data) {
                    var i;
                    var obj = {};
                    if(pName == "custCode"){
                        $("#custCode").val("");
                        $("#custName").val("");
                        $("#custCode").val(data[0].custCode);
                        $("#custName").val(data[0].custKorName);
                	}else if(pName == "empNo"){
                		//popUpCallback(data);
                	}
                };
                
                //fn_loadMain();
                //fn_search();
                
            });
            function doOnCellChanged(rId,cInd,nValue){
            	if(cInd==5){
            		doOnRowSelect(rId,cInd);
            	}
            };
            
            function doOnRowSelect(id,ind){
            	totalQtyCalcul(id);
            };

            function totalQtyCalcul(id){
            	var qtyColIdx   = gridSub.getColIndexById('qty');  
            	var costColIdx   = gridSub.getColIndexById('cost');  
            	var amtColIdx   = gridSub.getColIndexById('amt');  
            	
            	sum = gridSub.setCells(id,amtColIdx).getValue()*1;
            	qtyValue = gridSub.setCells(id,qtyColIdx).getValue()*1;
            	costValue = gridSub.setCells(id,costColIdx).getValue()*1;
            	sum = (qtyValue*costValue);
            	gridSub.setCells(id,amtColIdx).setValue(sum);
            };            
            
            function doOnRowDblClicked(rId, cInd) {
            	var cudVal = gridMain.setCells(rId, gridMain.getColIndexById('cudKey')).getValue();
        		if($("#empName").val() == ""){
        			dhtmlx.alert("등록자는 필수 항목입니다.");
        			return;
        		}else if($("#custName").val() == ""){
        			dhtmlx.alert("공급업체는 필수 항목입니다.");
        			return;
        		}else if(cudVal == "DELETE"){
        			MsgManager.alertMsg("WRN010");
        			return;
        		}else{
                	var mainCudVal = gridMain.setCells(rId, gridMain.getColIndexById('cudKey')).getValue();
            		var matrNameIdxM = gridMain.getColIndexById("matrName");
            		var matrSpecIdxM = gridMain.getColIndexById("matrSpec");
            		var matrUnitIdxM = gridMain.getColIndexById("matrUnit");
            		var qtyIdxM = gridMain.getColIndexById("qty");
            		var costIdxM = gridMain.getColIndexById("cost");
            		var amtIdxM = gridMain.getColIndexById("amt");
            		var deliDateIdxM = gridMain.getColIndexById("deliDate");
            		var deliPlaceIdxM = gridMain.getColIndexById("deliPlace");
            		var purcConsultKeyIdxM = gridMain.getColIndexById("purcConsultKey");
            		
            		var matrNameIdxS = gridSub.getColIndexById("matrName");
            		var matrSpecIdxS = gridSub.getColIndexById("matrSpec");
            		var matrUnitIdxS = gridSub.getColIndexById("matrUnit");
            		var qtyIdxS = gridSub.getColIndexById("qty");
            		var costIdxS = gridSub.getColIndexById("cost");
            		var amtIdxS = gridSub.getColIndexById("amt");
            		var deliDateIdxS = gridSub.getColIndexById("deliDate");
            		var deliPlaceIdxS = gridSub.getColIndexById("deliPlace");             		
            		var purcConsultKeyIdxS = gridSub.getColIndexById("purcConsultKey");  

            		var totalColNum = gridSub.getColumnCount();
                   	var data = new Array(totalColNum);
               		data[matrNameIdxS] = gridMain.setCells(rId, matrNameIdxM).getValue();
               		data[matrSpecIdxS] = gridMain.setCells(rId, matrSpecIdxM).getValue();
               		data[matrUnitIdxS] = gridMain.setCells(rId, matrUnitIdxM).getValue();
               		data[qtyIdxS] = gridMain.setCells(rId, qtyIdxM).getValue();
               		data[costIdxS] = gridMain.setCells(rId, costIdxM).getValue();
               		data[amtIdxS] = gridMain.setCells(rId, amtIdxM).getValue();
               		data[deliDateIdxS] = gridMain.setCells(rId, deliDateIdxM).getValue();
               		data[deliPlaceIdxS] = gridMain.setCells(rId, deliPlaceIdxM).getValue();
               		data[purcConsultKeyIdxS] = gridMain.setCells(rId, purcConsultKeyIdxM).getValue();
                    gridSub.addRow(data);
                    gridMain.cs_deleteRow(rId);
        		}
            };
            
            function doOnRowSubDblClicked(rId, cInd){
            	/* var gridMainId = null;
            	var gridMainIdx = null;
            	var subPurcConsultKey = gridSub.setCells(rId, gridSub.getColIndexById("purcConsultKey")).getValue();
            	
            	for(var i=0;i<gridMain.getRowsNum();i++){
            		var mainPurcConsultKey = gridMain.setCells2(i, gridMain.getColIndexById("purcConsultKey")).getValue();
            		if(subPurcConsultKey == mainPurcConsultKey){
            			gridMainId = gridMain.getRowId(i);
            		}
            	}
            	gridSub.deleteRow(rId);
            	gridMain.setCells(gridMainId, gridMain.getColIndexById('cudKey')).setValue('UPDATE');
            	gridMain.cs_addRow(gridMainId); */
            	
            	gridSub.selectRow(totalRowNum);
            	
            };               
            
		    function leadingZeros(n, digits) {
		   	  	var zero = '';
		   	  	n = n.toString();
		
				if (n.length < digits) {
					for (var i = 0; i < digits - n.length; i++)
				    	zero += '0';
				}
		   		return zero + n;
		    };              
            
		    function fn_new(){
		    	byId("frmSearch").reset();
		    	$("#setSeq").val("");
		    	$("#seqNo").val("");
		        var t = dateformat(new Date());
		        byId("stDate").value = t;
		        $('#stDate').keyup();
		    	gridMain.clearAll();    
		    	gridSub.clearAll();
		    };		    
		    
		    function fn_add() {
		      	/* var totalRowNum = gridSub.getRowsNum();
		        var selRowIdx = gridSub.getSelectedRowIndex();  
		        var setNoIdx = gridSub.getColIndexById('setNo');
		        gridSub.addRow();
		        gridSub.selectRow(totalRowNum);
		        gridSub.setCells2(totalRowNum, setNoIdx).setValue(leadingZeros(totalRowNum+1, 3)); */
		    	gridSub.addRow();
			};
			
		    function fn_delete(){
		    	var rodid = gridSub.getSelectedRowId();
		    	gridSub.cs_deleteRow(rodid); 
		    };			
			
		    function fn_remove(){
		    	/* for(var i=0; i<gridSub.getRowsNum();i++){
		    		gridSub.cs_deleteRow(gridSub.getRowId(i));	 
		    	} */
		    	gridSub.clearAll();
		    };          		    
		    
		    function fn_save(){
		    	
		    };
		    
		    function fn_search(){
		    	fn_loadMain();		    		
		    };
		    
		    function fn_loadMain(){
		    	if($("#custName").val() == ""){
		    		alert("공급업체를 선택해주세요.");
		    		return false;
		    	}else{
			        $("input[name=setDate]").val($("#stDate").val().split("/").join(""));
			        var param = gfn_getFormElemntsData('frmSearch');
			        gfn_callAjaxForGrid(gridMain, param, "/erp/plan/purc/orderS/topMainSel", subLayout.cells("a"));  
		    	}
		    };
		    
		    function fn_gridMainSelCallbckFunc(data){
		        if($("#empNo").val() == "%"){
		        	$("#empNo").val("");
		        };
		        $("#stDate").keyup();		    	
		    }

        </script>
        <style>

        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer">
        <div class="container">
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
	        	<input type="hidden" name="setDate" id="setDate">
	        	<input type="hidden" name="custCode" id="custCode">            
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                            <div class="col-sm-2 col-md-2">
                                
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                    <input type="hidden" name="setSeq" id="setSeq" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 등록자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="empName" id="empName" type="text" value="${empName}" placeholder="" class="form-control input-xs" >
                                <input name="empNo" id="empNo" type="hidden" value="${empNo}">
                            </div>
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">공급업체 </label>
                            <div class="col-sm-2 col-md-2" id="custNameZone">
                                <input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>                            
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>