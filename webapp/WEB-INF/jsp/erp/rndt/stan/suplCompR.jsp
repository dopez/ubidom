<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        	var layout,toolbar,subLayout;
            var gridMain;
            $(document).ready(function() {

            	Ubi.setContainer(1, [1, 8, 9], "1C"); /*공급업체조회 */

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //17col
                gridMain.setHeader("코드,공급업체명,대표자명,사업자번호,법인번호,업태,종목,주소,전화번호,팩스번호,이름,직책,소속,HP번호,전화,이메일,거래여부", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                gridMain.setInitWidths("50,150,60,100,100,100,50,50,150,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str");
                gridMain.init();
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                            <input type="checkbox" name="empGbn_group1" value="1" checked="checked">매출
                            <input type="checkbox" name="empGbn_group1" value="2">매입
                            <input type="checkbox" name="empGbn_group1" value="3">외주
                            <input type="checkbox" name="empGbn_group1" value="4">금융
                            <input type="checkbox" name="empGbn_group1" value="5">품질
                            <input type="checkbox" name="empGbn_group1" value="6">총무
                            <input type="checkbox" name="empGbn_group1" value="7">Buyer
                        </div>
                    </div>
                </div>
            </form>
			</div>
        </div>