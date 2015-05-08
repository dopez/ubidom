<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var gridMain, layout, toolbar, subLayout,mygrid;
            $(document)
                .ready(
                    function() {

                        Ubi.setContainer(1, [1, 2, 3, 4, 5, 6], "1C"); //품목코드조회

                        layout = Ubi.getLayout();
                        toolbar = Ubi.getToolbar();
                        subLayout = Ubi.getSubLayout();

                        //form//
                        layout.cells("b").attachObject("bootContainer2");

                        mygrid = new dxGrid(subLayout.cells("a"), false);
                        
                    	mygrid.addHeader({name:"품목코드", 	colId:"itemCode", 		width:"15", align:"center", type:"ed"});
                    	mygrid.addHeader({name:"품목명", 		colId:"itemName", 	width:"15", align:"center", type:"ed"});
                    	mygrid.addHeader({name:"규격", 		colId:"itemSize", 	width:"15", align:"center", type:"ed"});

                    	mygrid.setColSort("str");	
                    	mygrid.setUseYnCol(mygrid.getColIndexById("topMenuYn"));

                    	mygrid.setColSort("str,str,str");	
                    	mygrid.setUserData("","pk","itemCode");
                    	mygrid.init();
                    	
                    	toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn5") {
                            	var totalColNum = mygrid.getColumnCount();
                        		var data = new Array(totalColNum);
                        		mygrid.addRow(data, 0, 2);
                            }
                        })
                    	
                        //저장 - 수정
                        toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn3") {
                            	var jsonStr = mygrid.getJsonUpdated2();
                        		if (jsonStr == null || jsonStr.length <= 0) return;
                        		
                                $("#jsonData").val(jsonStr);
                                
                        		$.ajax({
                        			url : "/erp/subTest/grid_test",
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
                        
                        //한줄씩 멀티삭제
                    /*       toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn4") {
                            	for(var i = mygrid.getRowsNum(); i > 0; i--){
	                            	
	                            	if(mygrid.isDelRows(i)) {
	           		
	                        		    var jsonStr = mygrid.getJsonMultiRowDelete(i);
	                        		    alert(jsonStr);
	                        			if (jsonStr == null || jsonStr.length <= 0) return;
										
	                    				$("#jsonData").val(jsonStr);
	                        	        $.ajax({
	                        				url : "/erp/gTest/grid_test",
	                        		        type : "POST",
	                        		        data : $("#pform").serialize(),
	                        		        async : true,
	                        		        success : function(data) {
	                        		        	//MsgManager.alertMsg("INF003");
	                        					//fn_loadGridList();
	                        		        }
	                        			});
	                        	        
	                        		}else {
	                        			MsgManager.alertMsg("WRN002");
	                        		}
                            	}
                            }
                        }) */
                        
                         //전체삭제
                           toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn4") {
                        			if(!MsgManager.confirmMsg("INF002")) { //삭제하시겠습니까?	
                        				return;
                        			}
                        			
                        		    var jsonStr = mygrid.getJsonMultiRowDelete();
                        			if (jsonStr == null || jsonStr.length <= 0) return;

                    				$("#jsonData").val(jsonStr);
                        	        $.ajax({
                        				url : "/erp/subTest/grid_test",
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
                        })
                       
                        //한줄삭제
                           toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn6") {
                            	var rodIdx = mygrid.getSelectedRowId();
                            	if(mygrid.isDelRows(rodIdx)) {
                        			if(!MsgManager.confirmMsg("INF002")) { //삭제하시겠습니까?	
                        				return;
                        			} else {
                        			
                        				if(!mygrid.chkUnsavedRows()) {
                        					return;
                        				}
                        			}
                        			
                        		    var jsonStr = mygrid.getJsonRowDel(rodIdx);
                        			if (jsonStr == null || jsonStr.length <= 0) return;

                    				$("#jsonData").val(jsonStr);
                        	        $.ajax({
                        				url : "/erp/subTest/grid_test",
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
                        })
                                   
                        //조회
                        toolbar.attachEvent("onClick", function(id) {
                                if (id == "btn1") {
                                	fn_loadGridList();
                                }
                            })
                        
        /*                 //항목삭제
                        toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn6") {

                                if (mygrid.isSelRows(1)) {
                                    if (!MsgManager.confirmMsg("INF002")) { //삭제하시겠습니까?
                                        return;
                                    } else {
                                        if (!mygrid.chkUnsavedRows()) {
                                            return;
                                        }
                                    }
                                    var jsonStr = mygrid.getJsonChecked(1);
                                    if (jsonStr == null || jsonStr.length <= 0) return;

                                    $("#jsonData").val(jsonStr);
                                    $.ajax({
                                        url: "/erp/gTest/grid_test",
                                        type: "POST",
                                        data: $("#pform").serialize(),
                                        async: true,
                                        success: function(data) {
                                            alert(123);
                                        	//MsgManager.alertMsg("INF003");
                                            fn_loadGridList();
                                        }
                                    });
                                } else {
                                    //MsgManager.alertMsg("WRN002");
                                    alert(345);
                                }
                            }
                        }) */

                    })
            function fn_loadGridList() {
                gfn_gridLoad("/erp/subTest/selTest", {}, mygrid, fn_setCount);
            }
            function fn_setCount() {
            	$("#totalCount").text(mygrid.getRowsNum());
            }
        </script>
        <form id="pform" name="pform" method="post">
            <input type="hidden" id="jsonData" name="jsonData" />
        </form>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="container">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    품목코드 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-3 col-md-3">
                                    <div class="col-md-offset-1 col-sm-offset-1 col-sm-11 col-md-11">
                                        <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                </div>
                                <label class="col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
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
