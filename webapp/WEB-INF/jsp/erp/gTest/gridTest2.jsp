<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMst, gridDtl;
var combo;
$(document).ready(function() {
   Ubi.setContainer(1, [1, 2, 3, 4, 5, 6,9], "2U");

   layout = Ubi.getLayout();
   toolbar = Ubi.getToolbar();
   subLayout = Ubi.getSubLayout();

  layout.cells("b").attachObject("bootContainer2");

  gridMst = new dxGrid(subLayout.cells("a"), false);
       
  gridMst.addHeader({name:"품목별현황", colId:"itemCode", 		width:"15", align:"center", type:"combo"});
  gridMst.addHeader({name:"#cspan", 	colId:"itemName", 	width:"15", align:"center", type:"ro"});
  gridMst.addHeader({name:"#cspan", 	colId:"itemSize", 	width:"15", align:"center", type:"ed"});
  gridMst.setColSort("str");	
  gridMst.setUserData("","pk","itemCode");
  
  gridMst.atchHeader();
  gridMst.addAtchHeader({atchHeaderName:"품목코드"});
  gridMst.addAtchHeader({atchHeaderName:"품목명"});
  gridMst.addAtchHeader({atchHeaderName:"규격"});
  gridMst.atchHeaderInit();
  
  gridMst.atchFooter();
  gridMst.addAtchFooter({atchFooterName:"합계"});
  gridMst.addAtchFooter({atchFooterName:"0"});
  gridMst.addAtchFooter({atchFooterName:"0"});
  gridMst.atchFooterInit();
  gridMst.init();

  gridMst.attachEvent("onRowSelect",doOnRowSelect);
  function doOnRowSelect(id,ind){
	   if(ind==0){
		 var pop =   gfn_load_popup("품목코드","common/testCodePOP");
	
		var ifr=pop.getFrame();

		//console.log(ifr.contentWindow.frameElement.contentDocument);
		//ifr.myFunc();
	
		console.log(ifr.contentWindow);
		
		//console.log(ifr.contentWindow.frameElement.contentDocument.activeElement);
	   }
  }
	function myFunc(){
		alert("부모");
	}
/*  combo=gridMst.getColumnCombo(0);
   combo.load({
	  template: {
		columns: [
		   {header: "품목코드", width: 100, option: "#itemCode#"},
		   {header: "품목명", width: 100, option: "#itemName#"},
		   ]
	   },
	   options: [
			{value: "0", text:
			  {itemCode: "품목코드", itemName: "품명"}
			}
		  ]
  }); 
   
   gridMst.attachEvent("onRowSelect",doOnRowSelect);
   function doOnRowSelect(id,ind){
	   if(ind==0){
		   doOnOpen();
	   }
   }
  combo.enableFilteringMode(true);
  combo.attachEvent("onOpen",doOnOpen);
		 
  
  function doOnOpen(){
	  $.ajax({
			"url":"/erp/subTest",
			"type":"get",
			"data":{}
		    }).done(function(jsonData) {
				if(jsonData!="") {
				
					for(var i=0;i<=jsonData.length;i++){
			        	combo.addOption([
		                  {value: i, text:
		                  {"itemCode": jsonData[i].itemCode,
		                  "itemName":jsonData[i].itemName}}   
			            ]);
		           }
					
		        }else {
		          alert("No Data");
		        }
			});	
  }
  
    combo.attachEvent("onClose", doOnClose);
	  
	function doOnClose(){
		gridMst.setCells2(gridMst.getSelectedRowIndex(),0).setValue(combo.getSelectedText().itemCode);
		gridMst.setCells2(gridMst.getSelectedRowIndex(),1).setValue(combo.getSelectedText().itemName);
	} */  
   
  //조회
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	           fn_loadGridList();
	         }
	});
	//실제 조회로직
	function fn_loadGridList() {
	    gfn_gridLoad("/erp/subTest", {}, gridMst, fn_setCount);
	};
    //callback 함수
   function fn_setCount() {
   };
  
  //한줄추가
   toolbar.attachEvent("onClick", function(id) {
      if (id == "btn5") {
          var totalColNum = gridMst.getColumnCount();
          var data = new Array(totalColNum);
                gridMst.addRow(data, 0, 2);
       }
   });
  
 //전체삭제 - pk값만으로 삭제하기
	toolbar.attachEvent("onClick", function(id) {
		var str = "삭제하시겠습니까?";
	     if (id == "btn4") {
	        if(confirm(str)){
	           var jsonStr = gridMst.getJsonMultiRowDel(gridMst.getUserData());
		       if (jsonStr == null || jsonStr.length <= 0){
		        	 return;
		           }
		       $("#jsonData").val(jsonStr);
		       $.ajax({
		               url : "/erp/subTest/delTest",
		               type : "POST",
		               data : $("#pform").serialize(),
		               async : true,
		               success : function(data) {
		                        MsgManager.alertMsg("INF003");
		                        fn_loadGridList();
		                  }
		                }); 
	        }else{
	        	alert("변경된내역이 없습니다.");
	        }        			   	        
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
                                    <input name="iName" id="iName" type="text" value="" placeholder="" class="form-control input-xs">
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
