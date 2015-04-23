<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 8, 9], "1C"); /*공급업체조회 */

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9col
                gridMain.setHeader("코드,buyer명,대표자명,주소,담당자,전화번호,팩스번호,이메일,홈페이지");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str");
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
                                <div class="col-sm-10 col-md-10">
                                    <input type="checkbox" name="empGbn_group1" value="1" checked="checked">전체
                                    <input type="checkbox" name="empGbn_group1" value="2">총무
                                    <input type="checkbox" name="empGbn_group1" value="3">매출
                                    <input type="checkbox" name="empGbn_group1" value="4">매입
                                    <input type="checkbox" name="empGbn_group1" value="5">외주
                                    <input type="checkbox" name="empGbn_group1" value="6">금융
                                    <input type="checkbox" name="empGbn_group1" value="7">품질
                                    <input type="checkbox" name="empGbn_group1" value="8">buyer

                                </div>
                            </div>
                            <!--                         <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                            <div class="col-sm-10 col-md-10">
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="1" checked="checked">전체
					</div>
					<div class="col-sm-1 col-md-1">
					    <input type="checkbox" name="empGbn_group1" value="2">총무
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="3">매출
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="4">매입
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="5">외주
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="6">금융
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="7">품질
					</div>
					<div class="col-sm-2 col-md-2">
						<input type="checkbox" name="empGbn_group1" value="8">buyer
					</div>
				</div>
                        </div> -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    Buyer명
                                </label>
                                <div class="col-sm-4 col-md-4">
                                    <input name="buyerName" id="buyerName" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('고객코드','common/customCodePOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>