<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
	        var layout, toolbar, subLayout	
            var gridMain, gridSub;
            var calMain;
            var combo01;
            $(document).ready(function() {

            	Ubi.setContainer(2,[1,2,3,4,5,6], "2E"); //발주등록

            	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();             	
            	
                layout.cells("b").attachObject("bootContainer");
				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("품의내역");

                gridMain = new dxGrid(subLayout.cells("a"),false);
                gridMain.addHeader({name:"선택",colId:"radio",width:"100",align:"center",type:"ra_str"});
                gridMain.addHeader({name:"No",colId:"setNo",width:"50",align:"center",type:"cntr"});
                gridMain.addHeader({name:"품의일자",colId:"setDate",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"품의자",colId:"empName",width:"100",align:"center",type:"ro"});
                gridMain.addHeader({name:"공급업체",colId:"custName",width:"100",align:"left",type:"ro"});
                gridMain.addHeader({name:"품목코드",colId:"itemCode",width:"100",align:"right",type:"ro"});
                gridMain.addHeader({name:"품명",colId:"matrName",width:"100",align:"right",type:"ro"});
                gridMain.addHeader({name:"규격",colId:"matrSpec",width:"100",align:"right",type:"ro"});
                gridMain.addHeader({name:"단위",colId:"matrUnit",width:"100",align:"right",type:"ro"});
                gridMain.addHeader({name:"수량",colId:"qty",width:"100",align:"right",type:"ron"});
                gridMain.addHeader({name:"단가",colId:"cost",width:"100",align:"right",type:"ron"});
                gridMain.addHeader({name:"금액",colId:"amt",width:"100",align:"right",type:"ron"});
                gridMain.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"right",type:"ro"});
                gridMain.addHeader({name:"납기장소",colId:"deliPlace",width:"100",align:"right",type:"ro"});                
                gridMain.setUserData("","pk","no");
                gridMain.setColSort("str");
                gridMain.dxObj.setUserData("", "@setDate","format_date");
                gridMain.dxObj.setUserData("", "@deliDate","format_date");
                gridMain.init();
                gridMain.enableMultiselect(true);
                gridMain.cs_setNumberFormat(["amt", "qty", "cost"], "0,000");
                gridMain.cs_setColumnHidden(["compId", "setSeq", "purcConsultKey"]);                
                //gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                gridMain.attachEvent("onCheck", function(rId,cInd,state){
                	if(state){
                		doOnRowDblClicked(rId,cInd);
                	}else{
                		doOnRowSubDblClicked(rId,cInd);
                	}
                });
                
  				subLayout.cells("b").showHeader();
				subLayout.cells("b").setText("발주상세내역");
                gridSub = new dxGrid(subLayout.cells("b"),false);
                gridSub.addHeader({name:"No",colId:"setNo",width:"50",align:"center",type:"cntr"});
                /* gridSub.addHeader({name:"품목코드",colId:"matrCode",width:"100",align:"center",type:"ro"}); */
                gridSub.addHeader({name:"품명",colId:"matrName",width:"100",align:"center",type:"combo"});
                gridSub.addHeader({name:"규격",colId:"matrSpec",width:"100",align:"center",type:"ro"});
                gridSub.addHeader({name:"단위",colId:"matrUnit",width:"100",align:"left",type:"ro"});
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
                gridSub.cs_setColumnHidden(["compId", "setSeq", "purcConsultKey", "setDateTemp", "setSeqTemp", "itemCode", "empNo", "custCode"]);
                gridSub.attachEvent("onRowSelect",doOnRowSelect);
                //gridSub.attachEvent("onRowDblClicked",doOnRowSubDblClicked);
                gridSub.attachEvent("onCellChanged",doOnCellChanged);
                gridSub.attachEvent("onRowDblClicked",selectedItem);
                
            	g_dxRules = {
            			/* matrCode : [r_notEmpty], */
            			matrName : [r_notEmpty],
            			matrSpec : [r_notEmpty],
            			matrUnit : [r_notEmpty],
            			qty : [r_notEmpty, r_onlyNumber, r_maxLen+"|16"],
            			cost : [r_notEmpty, r_onlyNumber, r_maxLen+"|16"],
            			amt : [r_notEmpty, r_onlyNumber, r_maxLen+"|16"],
            			deliDate : [r_notEmpty]
            	};                 
                
            	combo01 = gridSub.getColumnCombo(1);
            	fn_comboLoad(combo01, "");
            	
            	combo01.attachEvent("onChange", function(){
            		var rowIdx = gridSub.getSelectedRowIndex();
            		gridSub.setCells2(rowIdx,1).setValue(combo01.getSelectedText().matrName);
            		gridSub.setCells2(rowIdx,2).setValue(combo01.getSelectedText().matrSpec);
            		gridSub.setCells2(rowIdx,3).setValue(combo01.getSelectedText().matrUnit);
            		gridSub.setCells2(rowIdx, gridSub.getColIndexById('itemCode')).setValue(combo01.getSelectedText().matrCode);
            	});              	
            	
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
                    if (pName == "matrCode"){ 
                        for (i = 0; i < data.length; i++) {
                        	obj.matrName = data[i].matrCode;
                            obj.matrName = data[i].matrName;
                            obj.matrSpec = data[i].matrSpec;
                            obj.matrUnit = data[i].matrUnit;
                            
                            var selRowIdx = gridSub.getSelectedRowIndex();
                            var itemCodeIdx = gridSub.getColIndexById('itemCode');
                            var matrNameIdx = gridSub.getColIndexById('matrName');
                            var matrSpecIdx = gridSub.getColIndexById('matrSpec');
                            var matrUnitIdx = gridSub.getColIndexById('matrUnit');
                            gridSub.setCells2(selRowIdx, itemCodeIdx).setValue(obj.matrCode);
                            gridSub.setCells2(selRowIdx, matrNameIdx).setValue(obj.matrName);
                            gridSub.setCells2(selRowIdx, matrSpecIdx).setValue(obj.matrSpec);
                            gridSub.setCells2(selRowIdx, matrUnitIdx).setValue(obj.matrUnit);
                        }                     
                    }else if(pName == "custCode"){
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
                
                if($("#setSeq").val() != ""){
                	fn_loadMain();
                	fn_loadSub();
                }
                
                
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
            	var totalRowNum = gridSub.getRowsNum();
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
            		var itemCodeM = gridMain.getColIndexById("itemCode");
            		var empNoM = $("#empNo").val();
            		var custCodeM = $("#custCode").val();
            		
            		var matrNameIdxS = gridSub.getColIndexById("matrName");
            		var matrSpecIdxS = gridSub.getColIndexById("matrSpec");
            		var matrUnitIdxS = gridSub.getColIndexById("matrUnit");
            		var qtyIdxS = gridSub.getColIndexById("qty");
            		var costIdxS = gridSub.getColIndexById("cost");
            		var amtIdxS = gridSub.getColIndexById("amt");
            		var deliDateIdxS = gridSub.getColIndexById("deliDate");
            		var deliPlaceIdxS = gridSub.getColIndexById("deliPlace");             		
            		var purcConsultKeyIdxS = gridSub.getColIndexById("purcConsultKey");  
            		var itemCodeS = gridSub.getColIndexById("itemCode");
            		var empNoS = gridSub.getColIndexById("empNo");
            		var custCodeS = gridSub.getColIndexById("custCode");
            		
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
                   	data[itemCodeS] = gridMain.setCells(rId, itemCodeM).getValue();
               		data[empNoS] = empNoM;
               		data[custCodeS] = custCodeM;
                    gridSub.addRow(data, totalRowNum);
                    gridMain.cs_deleteRow(rId);
        		}
            };
            
            function doOnRowSubDblClicked(rId, cInd){
            	var gridSubId = null;
            	var mainPurcConsultKey = gridMain.setCells(rId, gridMain.getColIndexById("purcConsultKey")).getValue();
            	for(var i=0;i<gridSub.getRowsNum();i++){
            		var subPurcConsultKey = gridSub.setCells2(i, gridSub.getColIndexById("purcConsultKey")).getValue();
            		if(mainPurcConsultKey == subPurcConsultKey){
            			gridSubId = gridSub.getRowId(i);
            		}
            	}
            	gridSub.parse("", "js");
            	gridSub.deleteRow(gridSubId);
            	gridMain.setCells(rId, gridMain.getColIndexById('cudKey')).setValue('UPDATE');
            	gridMain.cs_addRow(rId);
            };               
            
            function doOnRowSubDblClicked2(rId, cInd){
            	var gridMainId = null;
            	var subPurcConsultKey = gridSub.setCells(rId, gridSub.getColIndexById('purcConsultKey')).getValue();
            	for(var i=0;i<gridMain.getRowsNum();i++){
            		var mainPurcConsultKey = gridMain.setCells2(i, gridMain.getColIndexById('purcConsultKey')).getValue();
            		if(mainPurcConsultKey == subPurcConsultKey){
            			gridMainId = gridMain.getRowId(i);
            		}
            	}
            	
            	gridSub.parse("", "js");
            	gridSub.deleteRow(rId);
            	gridMain.setCells(gridMainId, gridMain.getColIndexById('cudKey')).setValue('UPDATE');
            	gridMain.cs_addRow(gridMainId);	
            	gridMain.setCells(gridMainId, gridMain.getColIndexById('radio')).setValue("0");
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
		    	var totalRowNum = gridMain.getRowsNum();
        		var totalColNum = gridSub.getColumnCount();
               	var data = new Array(totalColNum);		    	
		    	gridSub.addRow(data, totalRowNum);
		    	gridSub.selectRow(totalRowNum);
		    	gridSub.setColumnExcellType(4, "ro")
			};
			
		    function fn_delete(){
		    	var rodid = gridSub.getSelectedRowId();
		    	//gridSub.cs_deleteRow(rodid); 
		    	doOnRowSubDblClicked2(rodid, "");
		    };			
			
		    function fn_remove(){
		    	/* for(var i=0; i<gridSub.getRowsNum();i++){
		    		gridSub.cs_deleteRow(gridSub.getRowId(i));	 
		    	} */
		    	gridSub.clearAll();
		    };          		    
		    
		    function fn_save(){
		    	var mstCudKey = "";
		    	
		    	if($("#custName").val() == ""){
		    		alert("공급업체를 선택하세요.");
		    		$("#custName").focus();
		    		return false;
		    	}            	
		    	
		    	if($("#seqNo").val()==null||$("#seqNo").val()=="" ||typeof $("#seqNo").val()=="undefined"){
		    		mstCudKey = "INSERT";
		    		fn_getSeqReturn();
		    	}else{
		    		mstCudKey = "UPDATE";
		    	}

		      	var totalRowNum = gridSub.getRowsNum();
		        var selRowIdx = gridSub.getSelectedRowIndex();       
		        var setSeqTemp = gridSub.getColIndexById('setSeqTemp');
		        var setDateTemp = gridSub.getColIndexById('setDateTemp');
		        var empNo = gridSub.getColIndexById('empNo');
		        var custCode = gridSub.getColIndexById('custCode');
		        
		        for(var i=0; i<totalRowNum; i++){
		        	gridSub.setCells2(i, setSeqTemp).setValue($("#setSeq").val());
		        	gridSub.setCells2(i, setDateTemp).setValue($("#setDate").val());
		        	gridSub.setCells2(i, empNo).setValue($("#empNo").val());
		        	gridSub.setCells2(i, custCode).setValue($("#custCode").val());		        	
		        }              	
		        
		        var jsonStr = gridSub.getJsonUpdated2();
		        $("#jsonData").val(jsonStr);
		        var frmParam = $("#frmServer").serialize();
		        
		        if (jsonStr == null || jsonStr.length <= 0){
		        	return false;
		        }else{
		            $.ajax({
		                url: "/erp/plan/purc/orderS/gridMainSave",
		                type: "POST",
		                data: frmParam,
		                async: true,
		                success: function(data) {
		                    //fn_gridMainSaveCallbckFunc(data);
		                    MsgManager.alertMsg("INF001");
		                	fn_search();
		                	gridSub.clearAll();
		                }
		            });                    	
		        }		    	
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
			        gfn_callAjaxForGrid(gridMain, param, "/erp/plan/purc/orderS/topMainSel", subLayout.cells("a"), fn_gridMainSelCallbckFunc);  
		    	}
		    };
		    
		    function fn_loadSub(){
		        $("input[name=setDate]").val($("#stDate").val().split("/").join(""));
		        var param = gfn_getFormElemntsData('frmSearch');
		        gfn_callAjaxForGrid(gridSub, param, "/erp/plan/purc/orderS/gridMainSel", subLayout.cells("b"), fn_gridMainSelCallbckFunc2);		    	
		    }
		    
		    
		    function fn_gridMainSelCallbckFunc(data){
		        if($("#empNo").val() == "%"){
		        	$("#empNo").val("");
		        };
		        $("#stDate").keyup();		    	
		    }
		    
		    function fn_gridMainSelCallbckFunc2(data){
	        	var gridMainId = null;
	        	var subPurcConsultKey = "${purcConsultKey}";
	        	for(var i=0;i<gridMain.getRowsNum();i++){
	        		var mainPurcConsultKey = gridMain.setCells2(i, gridMain.getColIndexById('purcConsultKey')).getValue();
	        		if(mainPurcConsultKey == subPurcConsultKey){
	        			gridMainId = gridMain.getRowId(i);
	        			gridMain.cs_deleteRow(gridMainId);
		            	gridMain.setCells(gridMainId, gridMain.getColIndexById('radio')).setValue("1");			            			
	        		}
	        	}    	
		    }		    
		    
			function fn_getSeqReturn(){
			     var obj = {};
			     obj.tableName = 'TBL_PURC_FORDER';
			     obj.seqColumn = 'SET_SEQ';
			     obj.dateColumn1 = 'SET_DATE';
			     obj.columnData1 = $("#stDate").val().split("/").join("");
			     obj.dateColumn2 = "COMP_ID";
			     obj.columnData2 = "${compId}";
			     obj.returnLen = 3;
			     gfn_callAjaxComm(obj, "/erp/plan/purc/orderS/seqReturn", fn_SetSeq);
			};		    
		    
			function fn_SetSeq(data) {
				$("#setSeq").val(data[0].seq);
				$("#seqNo").val(data[0].seq);
			}    		   
		   
	        function selectedItem(rowId, colIdx) {
	            var param = ""
	            if (colIdx == 1) {
	                gfn_load_pop('w1', 'common/matrCodePOP', true, {
	                    "matrCode": param
	                }); 
	            }
	        } 
	        
	    	function fn_comboLoad(comboId, val){
    			comboId.setTemplate({
    			    input: "#matrName#", 
    			    columns: [
					  /* {header: "품목코드", width: 100, option: "#matrCode#"}, */
    			      {header: "품목명",   width: 100, option: "#matrName#"},
    		          {header: "규격", width: 100, option: "#matrSpec#"},
    			      {header: "단위", width: 100, option: "#matrUnit#"}
    			    ]
    			});
    			
    			$.ajax({
    				url: "/erp/rndt/stan/bomS/matrCodePop",
    				type: "post",
    				data: {matrName : val},
    				success : function(data){
    				  	var list = data;
    				  	for(var i=0;i<list.length;i++){
    			 		  	comboId.addOption(i,{matrCode:list[i].matrCode, matrName:list[i].matrName, matrSpec:list[i].matrSpec, matrUnit:list[i].matrUnit});
    					} 
    				}
    			});
	        }	        
			
        </script>
        <style>

        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer">
        <div class="container">
			<form id="frmServer">
				<input type="hidden" id="jsonData" name="jsonData">
			</form>                    
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
	        	<input type="hidden" name="setDate" id="setDate" value="${setDate}">
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
                                    <input name="seqNo" id="seqNo" type="text" value="${setSeq}" placeholder="" class="form-control input-xs" disabled="disabled">
                                    <input type="hidden" name="setSeq" id="setSeq" value="${setSeq}">
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
                            	<input type="hidden" name="custCode" id="custCode" value="${custCode}"> 
                                <input name="custName" id="custName" type="text" value="${custName}" placeholder="" class="form-control input-xs">
                            </div>                            
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>