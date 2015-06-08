<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMst;
            var gridDtl;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 2, 3, 4, 5, 6], "2U"); /*매출단가등록 */

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer");

                //left grid
                subLayout.cells("a").setWidth(203);
            	gridMst = new dxGrid(subLayout.cells("a"), false);
            	gridMst.addHeader({name:"고객코드", colId:"custCode", width:"45", align:"center", type:"ro"});
            	gridMst.addHeader({name:"고객명", 	colId:"custKorName", width:"45", align:"center", type:"ro"});
            	gridMst.setUserData("","pk","custCode");
            	gridMst.setColSort("str");
                gridMst.init();

                gridMst.attachEvent("onRowSelect",doOnRowSelectMst);
                //right grid
                gridDtl = new dxGrid(subLayout.cells("b"), false);
				gridDtl.addHeader({name:"품목코드", colId:"custCode", width:"10", align:"center", type:"ro"});
				gridDtl.addHeader({name:"품명", colId:"empNo", width:"10", align:"center", type:"ro"});
				gridDtl.addHeader({name:"규격", colId:"empName", width:"10", align:"center", type:"ro"});
				gridDtl.addHeader({name:"단위", 	colId:"jobPosition", width:"19", align:"center", type:"ed"});
				gridDtl.addHeader({name:"통화단위", 	colId:"deptName", width:"10", align:"center", type:"ed"});
				gridDtl.addHeader({name:"단가", 	colId:"hpNo", width:"10", align:"center", type:"ed"});
				gridDtl.addHeader({name:"적용일자", 	colId:"telNo", width:"10", align:"center", type:"ed"});
				gridDtl.setUserData("","pk","custCode");
				gridDtl.setColSort("str");
                gridDtl.init();

                fn_search();
                //popUp
                gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			if(colId==0 || colId==1){
        				gfn_load_popup('품목코드','common/itemCodePOP');
        			}
        		}
            })

			function fn_search(){
				gridDtl.clearAll();
				$("#frmMain").exClearForm();
				var obj={};
				if(!$("#frmSearch input[name='custCode']").val().length){
					obj.custCode="%";
					obj.custName="%";
				}
				gfn_callAjaxForGrid(gridMst,obj,"mst",subLayout.cells("a"));
				gridMst.dxObj.selectRow(0,true,true,true);

			};
			function doOnRowSelectMst(id,ind){
				$("#frmMain").exClearForm();
				$("#cudKey").val("UPDATE");
				var obj = {};
				obj.custCode= gridMst.setCells(id,0).getValue();
				obj.custName= gridMst.setCells(id,1).getValue();
				gfn_callAjaxForForm("frmMain",obj,"mst");
				gfn_callAjaxForGrid(gridDtl,obj,"dtl",subLayout.cells("b"));

			};
			function fn_add(){
				var custCode = $("#frmMain input[name='custCode']").val();

				var totalColNum = gridDtl.getColumnCount();
			    var data = new Array(totalColNum);

			    var custCodeColIdx = gridDtl.getColIndexById("custCode");
			    var startDateColIdx = gridDtl.getColIndexById('startDate');
			    var stopDateColIdx = gridDtl.getColIndexById('stopDate');

			    data[custCodeColIdx] = custCode;
			    var date = dateformat(new Date());
				data[startDateColIdx] = date;
				data[stopDateColIdx] = date;

			    gridDtl.addRow(data);
			};

			function fn_delete(){
				var selectedId = gridDtl.getSelectedRowId();
				gridDtl.cs_deleteRow(selectedId);
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
        <div id="bootContainer" style="position: relative; width: 100%; height: 100%;">
            <div class="container">
                <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
					고객
					 </label>
					<div class="col-sm-4 col-md-4">
					<div class="col-sm-10 col-md-10">
						<input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<div class="col-sm-2 col-md-2">
							<button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('고객코드','common/customCodePOP');">
							  <span class="glyphicon glyphicon-search"></span>
							</button>
					  </div>
			    </div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
					품목코드
					 </label>
					<div class="col-sm-4 col-md-4">
					<div class="col-sm-10 col-md-10">
						<input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs">
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