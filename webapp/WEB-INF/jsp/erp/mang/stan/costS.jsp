<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridFst,gridThd,gridScd;

            $(document).ready(function() {

                Ubi.setContainer(2, [1, 2, 3, 4, 5, 6], "3L"); /*매출단가등록 */

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                layout.cells("b").attachObject("bootContainer");


                subLayout.cells("a").setWidth(303);
            	gridFst = new dxGrid(subLayout.cells("a"), false);
            	gridFst.addHeader({name:"품목코드", colId:"itemCode", width:"30", align:"left", type:"ro"});
            	gridFst.addHeader({name:"품목명", 	colId:"itemName", width:"35", align:"left", type:"ro"});
            	gridFst.addHeader({name:"품목규격", 	colId:"itemSpec", width:"35", align:"left", type:"ro"});
            	gridFst.setUserData("","pk","itemCode");
            	gridFst.setColSort("str");
                gridFst.init();

                gridFst.attachEvent("onRowSelect",doOnRowSelectFst);

                gridScd = new dxGrid(subLayout.cells("b"), false);
				gridScd.addHeader({name:"거래처코드", colId:"custCode", width:"80", align:"left", type:"ro"});
				gridScd.addHeader({name:"거래처명", colId:"custName", width:"80", align:"left", type:"ro"});
				gridScd.addHeader({name:"통화단위", colId:"mnyEa", width:"80", align:"left", type:"combo"});
				gridScd.addHeader({name:"단가", 	colId:"prc", width:"80", align:"left", type:"ed"});
				gridScd.addHeader({name:"적용일자", 	colId:"pstDate", width:"80", align:"left", type:"dhxCalendarA"});
				gridScd.setUserData("","pk","custCode");
				gridScd.setColSort("str");
                gridScd.init();
                gridScd.cs_setColumnHidden(["ioChk","bigo","pendDate","itemCode"]);

                gridScd.attachEvent("onRowSelect",doOnRowSelectScd);

                gridThd = new dxGrid(subLayout.cells("c"), false);
                gridThd.addHeader({name:"통화단위", colId:"mnyEa", width:"10", align:"center", type:"ro"});
                gridThd.addHeader({name:"단가", colId:"prc", width:"10", align:"center", type:"ro"});
                gridThd.addHeader({name:"시작일자", colId:"pstDate", width:"10", align:"center", type:"ro"});
                gridThd.addHeader({name:"종료일자", 	colId:"pendDate", width:"19", align:"center", type:"ro"});
                gridScd.setUserData("","pk","mnyEa");
                gridThd.setColSort("str");
                gridThd.init();

                fn_search();
                fn_startSetCombo();

                $('input[name=itemDiv],input[name=ioChk]', '#frmSearch').change(function() {
                	fn_search();
                });
            })

			function fn_search(){
				gridScd.dxObj.clearAll();
				gridThd.dxObj.clearAll();
				if(!$("input[name='itemName2'], #frmSearch ").val().length){
					$("input[name='itemName'], #frmSearch ").val("%");
				}else{
					$("input[name='itemName'], #frmSearch ").val($("#frmSearch input[name='itemName2']").val());
				}
				gfn_callAjaxForGrid(gridFst,$("#frmSearch").serialize(),"searchA",subLayout.cells("a"));
				gridFst.dxObj.selectRow(0,true,true,true);
			}

			function doOnRowSelectFst(id,ind){
				gridThd.dxObj.clearAll();
				var obj = {};
				obj.itemDiv =  $('input[name=itemDiv]:checked', '#frmSearch').val();
				obj.ioChk =  $('input[name=ioChk]:checked', '#frmSearch').val();
				obj.itemCode= gridFst.setCells(id,0).getValue();
				gfn_callAjaxForGrid(gridScd,obj,"searchB",subLayout.cells("b"));

			}

			function doOnRowSelectScd(id,ind){
				var obj = {};
				if(ind == 0 || ind == 1){
					gfn_load_pop('w1','common/customPOP',true,{});
				}else{
					var fstSelectedId = gridFst.dxObj.getSelectedRowId();
					var itemCodeColIdx = gridFst.getColIndexById('itemCode');
					var cudKeyColIdx = gridFst.getColIndexById('cudKey');
					var custCodeColIdx = gridScd.getColIndexById('custCode');
					var mnyEaColIdx = gridScd.getColIndexById('mnyEa');
					var cudKeyVal= gridScd.setCells(id,cudKeyColIdx).getValue();
					obj.itemDiv =  $('input[name=itemDiv]:checked', '#frmSearch').val();
					obj.ioChk =  $('input[name=ioChk]:checked', '#frmSearch').val();
					obj.itemCode= gridFst.setCells(fstSelectedId,itemCodeColIdx).getValue();
					obj.custCode= gridScd.setCells(id,custCodeColIdx).getValue();
					obj.mnyEa= gridScd.setCells(id,mnyEaColIdx).getValue();
	 				if(!cudKeyVal.length){
						gfn_callAjaxForGrid(gridThd,obj,"searchC",subLayout.cells("c"));

	 				}
				}
			}

			function fn_add(){
				var totalColNum = gridScd.getColumnCount();
			    var data = new Array(totalColNum);
			    var psdDateColIdx = gridScd.getColIndexById('pstDate');
			    var date = dateformat(new Date());
				data[psdDateColIdx] = date;
			    gridScd.addRow(data);
			}

			function fn_delete(){
				gridScd.cs_deleteRow(gridScd.getSelectedRowId());
			}
			function fn_save(){
				 var fstSelectedId = gridFst.dxObj.getSelectedRowId();
				 var fstItemCodeColIdx = gridFst.getColIndexById('itemCode');
				 var ioChkColIdx = gridScd.getColIndexById('ioChk');
				 var itemCodeColIdx = gridScd.getColIndexById('itemCode');
				 var fstItemCodeVal = gridFst.setCells(fstSelectedId,fstItemCodeColIdx).getValue();
				 gridScd.setCells(gridScd.getSelectedRowId(),itemCodeColIdx).setValue(fstItemCodeVal);
				 gridScd.setCells(gridScd.getSelectedRowId(),ioChkColIdx).setValue($('input[name=ioChk]:checked', '#frmSearch').val());
				 var jsonStr = gridScd.getJsonUpdated2();
				 $("#jsonData").val(jsonStr);
	        	 $.ajax({
				    	url:  "/erp/mang/stan/costS/saveB",
				        type: "POST",
				        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				        data: $("#pform").serialize(),
				        async: true,
				        dataType: "json"
				 });
			}

	        function fn_onClosePop(pName,data){
	        	if(pName == "custCode"){
	        		var custCodeColIndex = gridScd.dxObj.getColIndexById("custCode");
	        		var custNameColIndex = gridScd.dxObj.getColIndexById("custName");
	        		var cudKeyColIndex = gridScd.dxObj.getColIndexById("cudKey");
	        		var selectedId = gridScd.dxObj.getSelectedRowId();
	        		var cudKeyVal = gridScd.setCells(selectedId,cudKeyColIndex).getValue();
	        		gridScd.setCells(selectedId,custCodeColIndex).setValue(data[0].custCode);
	        		gridScd.setCells(selectedId,custNameColIndex).setValue(data[0].custKorName);
	        		if(!cudKeyVal.length){
	        			gridScd.setCells(selectedId,cudKeyColIndex).setValue("UPDATE");
	        		}
	        	};
	         }
	        function fn_comboLoad(comboId,inputName,params,colIndx){
	        	comboId.setTemplate({
	        	    input: "#interName#",
	        	    columns: [
	        		   {header: "구 분",   width: 100,  option: "#interName#"}
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
	        function fn_startSetCombo(){
	        	var mnyEaColIdx = gridScd.getColIndexById('mnyEa');
	        	var combo01 = gridScd.getColumnCombo(mnyEaColIdx);
	        	fn_comboLoad(combo01,gridScd.getColumnId(mnyEaColIdx),"C01",mnyEaColIdx);
	        }

        </script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<form id="pform" name="pform" method="post">
  		<input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="bootContainer" style="position: relative; width: 100%; height: 100%;">
    <div class="container">
        <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            구분
                        </label>
                        <div class="col-sm-3 col-md-3">
                            <div class="col-sm-6 col-md-6">
                                <input type="radio" name="itemDiv" id="itemDiv1" value="M" checked>제상품
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <input type="radio" name="itemDiv" id="itemDiv2" value="P">자제
                            </div>
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            구분
                        </label>
                        <div class="col-sm-3 col-md-3">
                            <div class="col-sm-6 col-md-6">
                                <input type="radio" name="ioChk" id="ioChk1" value="1" checked="checked">매입
                            </div>
                            <div class="col-sm-6 0col-md-6">
                                <input type="radio" name="ioChk" id="ioChk2" value="2">매출
                            </div>
                        </div>
                </div>
            </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            품목명
                        </label>
                        <div class="col-sm-4 col-md-4">
                            <div class="col-sm-10 col-md-10">
                                <input name="itemName2" type="text" value="" placeholder="" class="form-control input-xs">
                                <input type="hidden" name="itemName">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('품목코드','common/itemCodePOP');">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>