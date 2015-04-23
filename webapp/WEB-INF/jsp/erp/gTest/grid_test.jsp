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
                    	mygrid.setUserData("","pk","itemCode");
                    	mygrid.init();

                        //조회
                        toolbar.attachEvent("onClick", function(id) {
                                if (id == "btn1") {
                                	fn_loadGridList();
                                }
                            })

                    })
            function fn_loadGridList() {
                gfn_gridLoad("/erp/gTest", {}, mygrid, fn_setCount);
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