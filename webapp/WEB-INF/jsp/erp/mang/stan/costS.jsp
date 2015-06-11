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
            	gridFst.addHeader({name:"품목코드", colId:"itemCode", width:"80", align:"left", type:"ro"});
            	gridFst.addHeader({name:"품목명", 	colId:"itemName", width:"80", align:"left", type:"ro"});
            	gridFst.addHeader({name:"품목규격", 	colId:"itemSpec", width:"80", align:"left", type:"ro"});
            	gridFst.setUserData("","pk","itemCode");
            	gridFst.setColSort("str");
                gridFst.init();

                gridFst.attachEvent("onRowSelect",doOnRowSelectFst);

                gridScd = new dxGrid(subLayout.cells("b"), false);
				gridScd.addHeader({name:"거래처코드", colId:"custCode", width:"80", align:"left", type:"ro"});
				gridScd.addHeader({name:"거래처명", colId:"custName", width:"80", align:"left", type:"ro"});
				gridScd.addHeader({name:"통화단위", colId:"mnyEa", width:"80", align:"left", type:"combo"});
				gridScd.addHeader({name:"단가", 	colId:"prc", width:"80", align:"right", type:"edn"});
				gridScd.addHeader({name:"적용일자", 	colId:"pstDate", width:"80", align:"center", type:"dhxCalendarA"});
				gridScd.setUserData("","pk","custName");
				gridScd.setColSort("str");
                gridScd.init();

                gridScd.cs_setColumnHidden(["ioChk","itemCode","pendDate","bigo"]);

                gridScd.attachEvent("onRowSelect",doOnRowSelectScd);
                gridScd.attachEvent("onRowDblClicked",doOnRowDblClicked);

                gridThd = new dxGrid(subLayout.cells("c"), false);
                gridThd.addHeader({name:"통화단위", colId:"mnyEa", width:"80", align:"center", type:"ro"});
                gridThd.addHeader({name:"단가", colId:"prc", width:"80", align:"center", type:"ro"});
                gridThd.addHeader({name:"시작일자", colId:"pstDate", width:"100", align:"center", type:"ro"});
                gridThd.addHeader({name:"종료일자", 	colId:"pendDate", width:"100", align:"center", type:"ro"});
                gridThd.setUserData("","pk","mnyEa");
                gridThd.setColSort("str");
                gridThd.init();

                fn_search();
                fn_comboLoad();

                $('input[name=itemDiv],input[name=ioChk]', '#frmSearch').change(function() {
                	fn_search();
                });
            })

			function fn_search(){
				gridScd.clearAll();
				gridThd.clearAll();
				if(!$("input[name='itemName2'], #frmSearch ").val().length){
					$("input[name='itemName'], #frmSearch ").val("%");
				}else{
					$("input[name='itemName'], #frmSearch ").val($("#frmSearch input[name='itemName2']").val());
				}
				gfn_callAjaxForGrid(gridFst,$("#frmSearch").serialize(),"searchA",subLayout.cells("a"));
				gridFst.dxObj.selectRow(0,true,true,true);
			}

			function doOnRowSelectFst(id,ind){
				gridScd.clearAll();
				gridThd.clearAll();
				var obj = {};
				obj.itemDiv =  $('input[name=itemDiv]:checked', '#frmSearch').val();
				obj.ioChk =  $('input[name=ioChk]:checked', '#frmSearch').val();
				var itemCodeColIdx = gridFst.getColIndexById('itemCode');
				obj.itemCode= gridFst.setCells(id,itemCodeColIdx).getValue();
				gfn_callAjaxForGrid(gridScd,obj,"searchB",subLayout.cells("b"));

			}

			function doOnRowSelectScd(id,ind){
				gridThd.clearAll();
				var obj = {};
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

			function doOnRowDblClicked(id,ind){
				if(ind == 0 || ind == 1){
					gfn_load_pop('w1','common/customPOP',true,{});
				}
			}


			function fn_add(){
				var totalColNum = gridScd.getColumnCount();
			    var data = new Array(totalColNum);
			    var psdDateColIdx = gridScd.getColIndexById('pstDate');
			    var prcColIdx = gridScd.getColIndexById('prc');
			    var date = dateformat(new Date());
				data[psdDateColIdx] = date;
				data[prcColIdx] = "0";
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
	        function fn_comboLoad(){

	        	var mnyEaColIdx = gridScd.getColIndexById('mnyEa');
	        	var combo01 = gridScd.getColumnCombo(mnyEaColIdx);

	        	combo01.setTemplate({
	        	    input: "#interName#",
	        	    columns: [
	        		   {header: "구 분",   width: 100,  option: "#interName#"}
	        	    ]
	        	});

	        	combo01.enableFilteringMode(true);
	        	combo01.enableAutocomplete(true);
	        	combo01.allowFreeText(true);

	        	var obj={};
	        	obj.compId = '100';
	        	obj.code = "C01";

	        	var rtnVal = gfn_callAjaxComm(obj,"/erp/cmm/InterCodeR");
  			    for(var i=0;i<rtnVal.length;i++){
				    combo01.addOption(rtnVal[i].interCode,rtnVal[i].interName);
			    }
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
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            품목명
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-12 col-md-12">
                                <input name="itemName2" type="text" value="" placeholder="" class="form-control input-xs">
                                <input type="hidden" name="itemName">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                                <input type="radio" name="ioChk" id="ioChk1" value="1" checked="checked">매입</div>
                            <div class="col-sm-6 0col-md-6">
                                <input type="radio" name="ioChk" id="ioChk2" value="2">매출
                            </div>
                        </div>
                	</div>
            	</div>
            </div>
        </form>
    </div>
</div>