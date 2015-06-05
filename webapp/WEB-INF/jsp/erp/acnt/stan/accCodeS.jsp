<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
        var gridMain;
        var combo01;
		var combo02;

        $(document).ready(function() {

            Ubi.setContainer(1, [1,2,3,4,5,6,7,8,9,10], "1C"); //계정코드입력

            layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();

            layout.cells("b").attachObject("bootContainer2");
            gridMain = new dxGrid(subLayout.cells("a"), false);
            gridMain.addHeader({name:"대분류명",     colId:"acNm1",  width:"7", align:"center", type:"ro"});
            gridMain.addHeader({name:"중분류명",   colId:"acNm2",   width:"7",  align:"left", type:"ro"});
            gridMain.addHeader({name:"소분류명",   colId:"acNm3", width:"7",  align:"left", type:"ro"});
            gridMain.addHeader({name:"계정",   colId:"acCd4",   width:"4",  align:"left", type:"ed"});
            gridMain.addHeader({name:"계정명",   colId:"acNm4", width:"7",  align:"left", type:"ed"});
        	gridMain.addHeader({name:"세목",   colId:"acSeq", width:"4",  align:"left", type:"ed"});
        	gridMain.addHeader({name:"세목명",   colId:"acName",   width:"7",  align:"left", type:"ed"});
        	gridMain.addHeader({name:"계정코드",   colId:"acCode",    width:"7",  align:"left", type:"ro"});
        	gridMain.addHeader({name:"타계정",   colId:"cAcCode",   width:"7",  align:"left", type:"ed"});
        	gridMain.addHeader({name:"차대구분",   colId:"crDrChk",  width:"7",  align:"center", type:"combo"});
        	gridMain.addHeader({name:"사용구분", colId:"codeChk",   width:"7",  align:"center", type:"combo"});
        	gridMain.setColSort("str");
            gridMain.init();
            gridMain.cs_setColumnHidden(["acCodeOld","acCd1","acCd2","acCd3","acCd4"]);
            gridMain.attachEvent("onRowSelect",doOnRowSelect);
            gridMain.dxObj.enableSmartRendering(false);
        	combo01 = gridMain.getColumnCombo(9);
        	fn_comboSet(combo01,0);
        	combo02 = gridMain.getColumnCombo(10);
        	fn_comboSet(combo02,1);

        	fn_search();

        })

		function doOnRowSelect(id,ind){
			var acCodeColIdx = gridMain.getColIndexById('acCode');
			var acCodeOldColIdx = gridMain.getColIndexById('acCodeOld');
			var val = gridMain.setCells(id,acCodeColIdx).getValue();
			gridMain.setCells(id,acCodeOldColIdx).setValue(val);

		}
		function fn_delete(){
		    var rowId = gridMain.getSelectedRowId();
		    gridMain.cs_deleteRow(rowId);
		}
        function fn_add(){
        	var selectedRow = gridMain.getSelectedRowId();
        	if(selectedRow == null){
        		return false;
        	}else{
        	    var totalColNum = gridMain.getColumnCount();
        	    var data = new Array(totalColNum);
        		var acCd1ColIdx = gridMain.getColIndexById('acCd1');
        		var acCd2ColIdx = gridMain.getColIndexById('acCd2');
        		var acCd3ColIdx = gridMain.getColIndexById('acCd3');
        		var acNm1ColIdx = gridMain.getColIndexById('acNm1');
        		var acNm2ColIdx = gridMain.getColIndexById('acNm2');
        		var acNm3ColIdx = gridMain.getColIndexById('acNm3');
        		var values=gridMain.dxObj.collectValues(acNm1ColIdx);
        		var rowIndex=gridMain.dxObj.getRowIndex(selectedRow);
        		var idx = values.indexOf(gridMain.setCells(selectedRow,acNm1ColIdx).getValue())
        		data[acNm1ColIdx] = gridMain.setCells(selectedRow,acNm1ColIdx).getValue();
        		data[acNm2ColIdx] = gridMain.setCells(selectedRow,acNm2ColIdx).getValue();
        		data[acNm3ColIdx] = gridMain.setCells(selectedRow,acNm3ColIdx).getValue();
        		data[acCd1ColIdx] = gridMain.setCells(selectedRow,acCd1ColIdx).getValue();
        	    data[acCd2ColIdx] = gridMain.setCells(selectedRow,acCd2ColIdx).getValue();
        	    data[acCd3ColIdx] = gridMain.setCells(selectedRow,acCd3ColIdx).getValue();
        	    gridMain.addRow(data,idx+1);
        	}
         }
         function fn_search(){
        	 	$.ajax({
			    	url:  "/erp/acnt/stan/accCodeS/search",
			        type: "POST",
			        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
			        data: $("#frmSearch").serialize(),
			        async: true,
			        dataType: "json",
			        beforeSend: function() {
			            layout.progressOn();
			        },
			        success: function(data, status) {
			        	gridMain.clearAll();
			        	gridMain.parse(data,"js");
			        	gridMain.dxObj.groupBy(0);
			        },
			        complete: function() {
			        	 subLayout.cells("a").progressOff();
			        }
			    });
// 			 gfn_callAjaxForGrid(gridMain,$("#frmSearch").serialize(),"search", subLayout.cells("a"))
         }

		 function fn_save(){

			 var jsonStr = gridMain.getJsonUpdated2();

			 $("#jsonData").val(jsonStr);

        	 $.ajax({
			    	url:  "/erp/acnt/stan/accCodeS/save",
			        type: "POST",
			        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
			        data: $("#pform").serialize(),
			        async: true,
			        dataType: "json",
			        success: function(data, status) {
						if(data.rtnCode == "1"){
							MsgManager.alertMsg("INF001");
						}else{
							return;
						}
			        }
			 });
// 			 gfn_callAjaxForGrid(gridMain,$("#pform").serialize(),"save", subLayout.cells("a"))
		 }
		 function fn_print(){
				gridMain.getDxObj().printView();
		 };
		 function fn_excel(){
				gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
		 };
         function fn_comboSet(comboId,id) {

             if(id == 0){
            	 comboId.setTemplate({
                     input: "#interName#",
                     columns: [{
                         header: "구분",
                         width: 100,
                         option: "#interName#"
                     }]
                 });

                 comboId.addOption("1", "차변");
                 comboId.addOption("2", "대변");
             }
             if(id == 1){
            	 comboId.setTemplate({
                     input: "#interName#",
                     columns: [{
                         header: "구분",
                         width: 80,
                         option: "#interName#"
                     }]
                 });

                 comboId.addOption("Y", "사용");
                 comboId.addOption("N", "미사용");
             }
             comboId.enableFilteringMode(true);
             comboId.enableAutocomplete(true);
             comboId.allowFreeText(true);
        }
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <form id="pform" name="pform" method="post">
    		<input type="hidden" id="jsonData" name="jsonData" />
		</form>
        <div id="bootContainer2">
            <div class="container">
               <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">계정분류</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="acCd1" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('계정분류','common/accCodePOP')">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>