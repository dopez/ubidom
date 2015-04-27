<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst, gridDtl01, gridDtl02;
            $(document).ready(function() {

                Ubi.setContainer(1, [1,2,3,4,5,6], "3L"); //      결산자료입력

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer");
                

                subLayout.cells("a").setWidth(702);
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //7
                gridMst.setHeader("No,출력순서,출력명,그룹,식,Chk,DSP");
                gridMst.setInitWidths("100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,left,center,center,center,center");
                gridMst.setColTypes("ron,edn,ed,coro,ed,coro,edn");
                gridMst.setColSorting("int,int,str,str,str,str,int");
                gridMst.init();

                gridDtl01 = subLayout.cells("c").attachGrid();
                gridDtl01.setImagePath("/component/dhtmlxGrid/imgs/"); //
                gridDtl01.setHeader("대분류명,중분류명,소분류명,계정,계정명,세목,세목명,계정코드");
                gridDtl01.setInitWidths("100,100,100,100,100,100,100,100");
                gridDtl01.setColAlign("center,center,center,center,center,center,center,center,center");
                gridDtl01.setColTypes("ro,ro,ro,ro,ro,ro,ro,ron");
                gridDtl01.setColSorting("str,str,str,str,str,str,str,int");
                gridDtl01.init();
                
                gridDtl02 = subLayout.cells("b").attachGrid();
                gridDtl02.setImagePath("/component/dhtmlxGrid/imgs/"); //6
                gridDtl02.setHeader("No,계정명,세목명,식,공식,계정코드");
                gridDtl02.setInitWidths("100,100,100,100,100,100");
                gridDtl02.setColAlign("center,left,left,center,center,left");
                gridDtl02.setColTypes("ron,ro,ro,coro,coro,ed");
                gridDtl02.setColSorting("int,str,str,na,na,str");
                gridDtl02.init();
                
                subToolbar(subLayout.cells("b"),[5,6]);
            })
		                //tool bar//
            	var subToolbar = function(sublo, btn_id_array) {

                tbar = sublo.attachToolbar();

                var size = 18;

                tbar.clearAll();
                tbar.setIconSize(18);
                tbar.setIconsPath("/images/button/dhtmlx/");
                tbar.loadStruct("/common/json/button.json", fn_onLoad);

                function fn_onLoad() {

                    var item_id_set_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

                    for (var i = 0; i < btn_id_array.length; i++) {
                        var index = item_id_set_arr.indexOf(btn_id_array[i]);
                        if (index > -1) {
                            item_id_set_arr.splice(index, 1);
                        }
                    }

                    for (var i = 0; i < item_id_set_arr.length; i++) {

                        tbar.removeItem("btn" + item_id_set_arr[i]); // item
                        tbar.removeItem("sep" + item_id_set_arr[i]); // seperator
                    }
                }
            }
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer">
			<div class="container">
				<form class="form-horizontal" id="frmMain" name="frmMain"
					style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
					<div class="row">
						<div class="col-sm-8 col-md-8">
							<div class="form-group form-group-sm">
								<label class=" col-sm-2 col-md-2 control-label" for="textinput">
									결산구분 </label>
								<div class="col-sm-2 col-md-2">
									<select class="form-control input-xs">
	                                    <option>대차대조표</option>
	                                    <option>손익계산서</option>
	                                    <option>제조원가명세서</option>
	                                </select>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>