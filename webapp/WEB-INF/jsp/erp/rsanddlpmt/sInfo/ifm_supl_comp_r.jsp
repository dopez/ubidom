<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            $(document).ready(function() {

                ubi.init(1, [1, 8, 9], "1C"); /*공급업체조회 */

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //17col
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
        	
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-9">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                            <div class="col-sm-10 col-md-10">
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="1" checked="checked">매출
					</div>
					<div class="col-sm-1 col-md-1">
					    <input type="checkbox" name="empGbn_group1" value="2">매입
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="3">외주
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="4">금융
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="5">품질
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="6">총무
					</div>
					<div class="col-sm-2 col-md-2">
						<input type="checkbox" name="empGbn_group1" value="7">Buyer
					</div>
				</div>
                        </div>
                    </div>
                </div>
            </form>
            
        </div>