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

                    	mygrid.addHeader({name:"품목코드", 	colId:"item_code", 		width:"15", align:"center", type:"ed"});
                    	mygrid.addHeader({name:"품목명", 		colId:"item_name", 	width:"15", align:"center", type:"ed"});
                    	mygrid.addHeader({name:"규격", 		colId:"item_size", 	width:"15", align:"center", type:"ed"});
/*                     	mygrid.addHeader({name:"편집", 		colId:"editStat", 	width:"5", 	align:"center", type:"ro"});
                    	mygrid.addHeader({name:"삭제", 		colId:"chk", 		width:"5", 	align:"center", type:"ch"});
                    	mygrid.addHeader({name:"시스템코드", 	colId:"sysCd", 		width:"10", align:"center", type:"ed"});
                    	mygrid.addHeader({name:"시스템명", 	colId:"sysNm", 		width:"*", 	align:"center", type:"ed"});
                    	mygrid.addHeader({name:"표시순서", 	colId:"viewIdx", 	width:"10", align:"center", type:"ed"});
                    	mygrid.addHeader({name:"사용여부", 	colId:"useYn", 		width:"10", align:"center", type:"coro"});
                    	mygrid.addHeader({name:"생성일", 		colId:"strCdate", 	width:"15", align:"center", type:"ro"});
                    	mygrid.addHeader({name:"생성자", 		colId:"strCuser", 	width:"15", align:"center", type:"ro"}); */
                    	mygrid.setColSort("str");	
                    	mygrid.setUserData("","pk","item_code");
                    	mygrid.init();
                        /* 
                        gridMain = subLayout.cells("a").attachGrid();
                        gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //col 9
                        gridMain.setHeader("구분,대분류,중분류,소분류,품목코드,품목명,규격,단위,포장단위", null, []);
                        gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
                        gridMain.setColAlign("center,center,center,center,left,left,left,center,center");
                        gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
                        gridMain.setColSorting("str,str,str,str,str,str,str,str,str");
                        gridMain.init(); */
                        
                        
                        //항목추가
                        toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn5") {
                            	var totalColNum = mygrid.getColumnCount();
                        		var item_code = mygrid.getColIndexById('item_code');
                        		var data = new Array(totalColNum);
                        		data[item_code] = 'TE5T';

                        		
                        		mygrid.addRow(data, 0, 2);
                            }
                        })
                        
                        //항목삭제
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
                        })
                        
                        //조회
                        toolbar.attachEvent("onClick", function(id) {
                                if (id == "btn1") {
                                	fn_loadGridList();
                                }
                            })
                            
                        //저장
                        toolbar.attachEvent("onClick", function(id) {
                            if (id == "btn3") {
                            	var jsonStr = mygrid.getJsonUpdated();
                        		if (jsonStr == null || jsonStr.length <= 0) return;
                        		
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
                        })
                        
                        
                        
                    })
            function fn_loadGridList() {
                gfn_gridLoad("/erp/gTest/grid_test", {}, mygrid, fn_setCount);
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