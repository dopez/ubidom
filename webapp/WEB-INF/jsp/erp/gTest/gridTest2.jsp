<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMst, gridDtl;
var combo;
var value;
$(function() {
   Ubi.setContainer(1, [1, 2, 3, 4, 5, 6, 9], "2U");

   layout = Ubi.getLayout();
   toolbar = Ubi.getToolbar();
   subLayout = Ubi.getSubLayout();

  layout.cells("b").attachObject("bootContainer");
  subLayout.cells("b").attachObject("bootContainer2");
  subLayout.cells("a").setWidth(600);
  gridMst = new dxGrid(subLayout.cells("a"), false);
       
  gridMst.addHeader({name:"품목별현황", colId:"itemCode", 	width:"33", align:"center", type:"ro"});
  gridMst.addHeader({name:"#cspan", 	colId:"itemName", 	width:"33", align:"center", type:"ro"});
  gridMst.addHeader({name:"#cspan", 	colId:"itemSize", 	width:"33", align:"center", type:"ed"});
  gridMst.setColSort("str");	
  gridMst.setUserData("","pk","itemCode");
  gridMst.enableSmartRendering(true,5);
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
  gridMst.attachEvent("onRowSelect",doOnRowDblClicked);

  function doOnRowDblClicked(id,ind){
	   if(ind==0){
		// var pop =  gfn_load_popup("품목코드","common/testCodePOP");
		value =   gridMst.setCells2(gridMst.getSelectedRowIndex(),0).getValue();
	    gfn_load_pop("w1","common/testCodeExtendPOP",true); 
	   }
   }

	//pdf
	toolbar.attachEvent("onClick",function(id){
		if(id == "btn9"){
			//pdf 로직
			window.open('/erp/subTest/report/reportTest.do','rpt','');
			
			//해당 Grid 프린트뷰
			//gridMst.printView();
		}
	});
	
  //조회
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	    	  fn_loadGridList();
	         }
	});
  
   //신규
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn2") {
	           gridMst.clearAll();
	           document.getElementById("frmMain").reset();
	         }
	});
  
  
  //한줄추가
   toolbar.attachEvent("onClick", function(id) {
      if (id == "btn5") {
          var totalColNum = gridMst.getColumnCount();
          var data = new Array(totalColNum);
                gridMst.addRow(data, 0, 2);
       }
   });
  
 //전체삭제
   toolbar.attachEvent("onClick", function(id) {
     if (id == "btn4") {
        if(MsgManager.confirmMsg("INF002")) { //삭제하시겠습니까?	
        	 var jsonStr = gridMst.getJsonMultiRowDelete();

             if (jsonStr == null || jsonStr.length <= 0) return;
              $("#jsonData").val(jsonStr);
                $.ajax({
                  url : "/erp/subTest/prcsTest",
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
 
 //저장 - 수정
   toolbar.attachEvent("onClick", function(id) {
     if (id == "btn3") {
      var jsonStr = gridMst.getJsonUpdated2();
      if (jsonStr == null || jsonStr.length <= 0) return;        		
         $("#jsonData").val(jsonStr);                      
         $.ajax({
            url : "/erp/subTest/prcsTest",
            type : "POST",
            data : $("#pform").serialize(),
            async : true,
            success : function(data) {
            MsgManager.alertMsg("INF001");
            }
       });
      }
   });  

 //한줄삭제
   toolbar.attachEvent("onClick", function(id) {
    if (id == "btn6") {
       var rodIdx = gridMst.getSelectedRowId();
       if(gridMst.isDelRows(rodIdx)) {
          if(MsgManager.confirmMsg("INF002")) {
        	  if(gridMst.chkUnsavedRow()) {
        		  var jsonStr = gridMst.getJsonRowDel(rodIdx);
                  if (jsonStr == null || jsonStr.length <= 0) return;
                  $("#jsonData").val(jsonStr);
                      $.ajax({
                       url : "/erp/subTest/prcsTest",
                       type : "POST",
                       data : $("#pform").serialize(),
                       async : true,
                       success : function(data) {
                       MsgManager.alertMsg("INF003");
                       fn_loadGridList();
                        }
                  });
        	  }
        	 
           } else {
            	 MsgManager.alertMsg("WRN004");
             } 
        }else {
            MsgManager.alertMsg("WRN002");
         }
     }
  });
 
})

 function fn_onOpenPop(){
	return value;
};

  function fn_onClosePop(pName,data){
	if(pName=="itemCode"){
		var i;
		for(i=0;i<data.length;i++){
			 gridMst.setCells2(gridMst.getSelectedRowIndex(),0).setValue(data[i].itemCode);
			 gridMst.setCells2(gridMst.getSelectedRowIndex(),1).setValue(data[i].itemName);
			}
				  
	}	  
 };
 //실제 조회로직
 function fn_loadGridList() {
	 var params = "itemName=" + $("#itemName").val();
	    gfn_gridLoad("/erp/subTest",params, gridMst, fn_setCount);
	};
  //callback 함수
 function fn_setCount() {
 };
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer">
      <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
          <div class="container">
             <div class="row">
                 <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                         <label class="col-sm-2 col-md-2 control-label" for="textinput">
                          품목코드
                         </label>
                         <div class="col-sm-2 col-md-2">
                               <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                         </div>
                          <div class="col-sm-3 col-md-3">
                                <div class="col-md-offset-1 col-sm-offset-1 col-sm-11 col-md-11">
                                    <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
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
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%;">
  <div class="container">	
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
	   <div class="col-sm-10 col-md-10">
		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 사원번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				성명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 성명(한자) 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="nameHan" id="nameHan" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				성명(영문) 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="nameEng" id="nameEng" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 주민등록번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="jumin" id="jumin" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				부서명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="deptName" id="deptName" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 전화번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="phone" id="phone" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직무명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="job" id="job" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 휴대번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="handPhone" id="handPhone" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직책명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="positionName" id="positionName" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 이메일 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				세콤ID 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="cecom" id="cecom" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>	   
	   </div>
	</form>
  </div>	
</div>