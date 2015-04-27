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
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //2col
                gridMst.setHeader("고객코드,고객명", null, []);
                gridMst.setInitWidths("100,100");
                gridMst.setColAlign("left,center");
                gridMst.setColTypes("ed,ed");
                gridMst.setColSorting("str,str");
                gridMst.init();

                //right grid
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //17col
                gridDtl.setHeader("품목코드,품명,규격,단위,통화단위,단가,적용일자", null, []);
                gridDtl.setInitWidths("100,100,100,100,100,100,100");
                gridDtl.setColAlign("left,left,left,center,right,right,center");
                gridDtl.setColTypes("ro,ro,ed,ed,coro,edn,dhxCalendar");
                gridDtl.setColSorting("str,str,str,str,str,int,date");
                gridDtl.init();
                
                gridDtl.attachEvent("onRowSelect", function(id,ind){
                 	gridDtl.editCell();
                 	});
              //항목삽입
                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn5"){
        				fn_insert();
        			}
        		});
                //popUp
                gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			if(colId==0 || colId==1){
        				gfn_load_popup('품목코드','common/itemCodePOP');
        			}
        		}
            })
                
            function fn_insert() {
            		gridDtl.addRow(gridDtl.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
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