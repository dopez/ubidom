<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMst, gridDtl;
$(document).ready(function() {
   Ubi.setContainer(1, [1, 2, 3, 4, 5, 6], "2U");

   layout = Ubi.getLayout();
   toolbar = Ubi.getToolbar();
   subLayout = Ubi.getSubLayout();

  layout.cells("b").attachObject("bootContainer2");

  gridMst = new dxGrid(subLayout.cells("a"), false);
                        
  gridMst.addHeader({name:"품목코드", 	colId:"itemCode", 		width:"15", align:"center", type:"ed"});
  gridMst.addHeader({name:"품목명", 		colId:"itemName", 	width:"15", align:"center", type:"ed"});
  gridMst.addHeader({name:"규격", 		colId:"itemSize", 	width:"15", align:"center", type:"ed"});
  gridMst.setColSort("str");	
  gridMst.setColSort("str,str,str");	
  gridMst.setUserData("","pk","itemCode");
  gridMst.init();

  //한줄추가
  toolbar.attachEvent("onClick", function(id) {
      if (id == "btn5") {
          var totalColNum = gridMst.getColumnCount();
          var data = new Array(totalColNum);
                gridMst.addRow(data, 0, 2);
          }
});
                    	
//저장 - 수정
 toolbar.attachEvent("onClick", function(id) {
     if (id == "btn3") {
       var jsonStr = gridMst.getJsonUpdated();
       if (jsonStr == null || jsonStr.length <= 0){
    	   return;
          }            		
       $("#jsonData").val(jsonStr);               
       $.ajax({
               url : "/erp/gTest/grid_test",
               type : "POST",
               data : $("#pform").serialize(),
               async : true,
               success : function(data) {
                          MsgManager.alertMsg("INF001");
                          fn_loadGridList();
                        }
            });
     }
});

	//전체삭제
	toolbar.attachEvent("onClick", function(id) {
	     if (id == "btn4") {
	        if(!MsgManager.confirmMsg("INF002")){
	           var jsonStr = gridMst.getJsonMultiRowDelete();
		       if (jsonStr == null || jsonStr.length <= 0){
		        	 return;
		           }
		       $("#jsonData").val(jsonStr);
		       $.ajax({
		               url : "/erp/gTest/grid_test",
		               type : "POST",
		               data : $("#pform").serialize(),
		               async : true,
		               success : function(data) {
		                        MsgManager.alertMsg("INF003");
		                        fn_loadGridList();
		                  }
		                }); 
	        }else{
	        	MsgManager.alertMsg("WRN004");
	        }        			   	        
	   }
});
	                       
	//한줄삭제
	toolbar.attachEvent("onClick", function(id) {
	     if (id == "btn6") {
	         var rodIdx = gridMst.getSelectedRowId();
	         if(gridMst.isDelRows(rodIdx)) {
	             if(!MsgManager.confirmMsg("INF002")) {
	                return;
	                } else {
	                   if(!mygrid.chkUnsavedRows()) {
	                       return;
	                     }
	                 }
	                        			
	           var jsonStr = gridMst.getJsonRowDelete(rodIdx);
	           if (jsonStr == null || jsonStr.length <= 0){
	        	   return;
	             }
	
	           $("#jsonData").val(jsonStr);
	           $.ajax({
	                   url : "/erp/gTest/grid_test",
	                   type : "POST",
	                   data : $("#pform").serialize(),
	                   async : true,
	                   success : function(data) {
	                            MsgManager.alertMsg("INF003");
	                        	fn_loadGridList();
	                        	}
	                   });       	        
	              }else {
	                    MsgManager.alertMsg("WRN002");
	                }
	        }
	 });
	                                   
	 //조회
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	           fn_loadGridList();
	         }
	});
	//실제 조회로직
	function fn_loadGridList() {
	    gfn_gridLoad("/erp/gTest", {}, gridMst, fn_setCount);
	};
   //callback 함수
   function fn_setCount() {
  };
})
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer2">
      <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
          <div class="container">
             <div class="row">
                 <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                         <label class="col-sm-2 col-md-2 control-label" for="textinput">
                          품목코드
                         </label>
                         <div class="col-sm-2 col-md-2">
                               <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                         </div>
                          <div class="col-sm-3 col-md-3">
                                <div class="col-md-offset-1 col-sm-offset-1 col-sm-11 col-md-11">
                                    <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                          </div>
                          <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
                            구분 
                          </label>
                          <div class="col-sm-2 col-md-2">
                              <select class="form-control input-xs">
                                <option>품목</option>
                                <option>품목2</option>
                                <option>품목3</option>
                              </select>
                          </div>
                     </div>
                  </div>
              </div>
          </div>
     </form>
</div>
