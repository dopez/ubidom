<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        	var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

            	Ubi.setContainer(3, [1, 8, 9], "1C"); //재료출고의뢰조회

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //19
                gridMain.setHeader("PO No,공급사,대표품목,통화,금액,결제조건,#cspan,#cspan,인도조건,선적요구일자,선적구분,선적일자,입항일자,BL No,Invoice No,신고일자,면정번호,입고,#cspan", null, []);
                gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,종류,L/C No,결제일자,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,일자,장소", []);
                gridMain.attachFooter("합계,#cspan,#cspan,#cspan,0,&nbsp;", []);
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,right,center,center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,int,str,str,str,date,str,date,str,date,date,str,str,date,str,date,str");
                gridMain.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "edDate",
                    button: "calpicker2"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
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
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						기간 </label>

					<div class="col-sm-6 col-md-6">
						<div class="col-sm-4 col-md-4">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="stDate"
										id="stDate" value="">
								</div>
								<div class="col-sm-2 col-md-2">
									<input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
								</div>
						</div>
						<label class="col-sm-1 col-md-1 control-label" for="textinput"
							style="margin-right: 15px;">~</label>
						<div class="col-sm-4 col-md-4">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="edDate"
										id="edDate" value="">
								</div>
								<div class="col-sm-2 col-md-2">
									<input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
								</div>
						</div>
					</div>

				</div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                공급사
                            </label>
                            <div class="col-sm-3 col-md-3">
                                <div class="col-sm-9 col-md-9">
                                    <input name="suplCompName" id="suplCompName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-3 col-md-3">
                                    <button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('공급업체','common/supplyCompCodePOP')">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                품목
                            </label>
                            <div class="col-sm-3 col-md-3">
                                <div class="col-sm-9 col-md-9">
                                    <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-3 col-md-3">
                                    <button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('품목','common/itemCodePOP')">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>