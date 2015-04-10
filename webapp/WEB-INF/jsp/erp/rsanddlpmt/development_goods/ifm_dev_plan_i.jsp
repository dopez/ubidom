<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

                    ubi.init(4, [1, 2, 3, 4], "1C"); //개발계획등록

                    o = ubi.getDataSet();

                    //form//
                    o.layout.cells("b").attachObject("bootContainer2");
                    o.layout.cells("b").setHeight(180);


                    //setDate//
                    calMain = new dhtmlXCalendarObject([{
                        input: "stDate",
                        button: "calpicker1"
                    }]);
                    calMain.loadUserLanguage("ko");
                    calMain.hideTime();
                    var t = dateformat(new Date());
                    byId("stDate").value = t;
                    //tabbar//	
                    var devPlanTabbar = o.slayout.cells("a").attachTabbar({
                        tabs: [{
                            id: "a1",
                            text: "목적/배경",
                            active: true
                        }, {
                            id: "a2",
                            text: "기술/시장/경쟁사동향"
                        }, {
                            id: "a3",
                            text: "개발일정"
                        }, {
                            id: "a4",
                            text: "인원계획"
                        }, {
                            id: "a5",
                            text: "개발목표(수준)"
                        }, {
                            id: "a6",
                            text: "성과활용계획"
                        }, {
                            id: "a7",
                            text: "투자계획"
                        }, {
                            id: "a8",
                            text: "시장규모"
                        }, ]

                    });

                    var tab1 = devPlanTabbar.tabs("a1").attachGrid();
                    var tab2 = devPlanTabbar.tabs("a2").attachGrid();
                    var tab3 = devPlanTabbar.tabs("a3").attachGrid();
                    var tab4 = devPlanTabbar.tabs("a4").attachGrid();
                    var tab5 = devPlanTabbar.tabs("a5").attachLayout("2E");
                    var tab6 = devPlanTabbar.tabs("a6").attachLayout("2E");
                    var tab7 = devPlanTabbar.tabs("a7").attachGrid();
                    var tab8 = devPlanTabbar.tabs("a8").attachGrid();

                    //1번탭
                    tab1.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab1.setHeader("No, 내  용", null, ["text-align:center;", "text-align:center;"]);
                    tab1.setInitWidths("50,756");
                    tab1.setColAlign("left,left");
                    tab1.setColTypes("ro,ed");
                    tab1.setColSorting("str,str");
                    tab1.init();

                    //2번탭
                    tab2.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab2.setHeader("No, 내  용", null, ["text-align:center;", "text-align:center;"]);
                    tab2.setInitWidths("50,756");
                    tab2.setColAlign("left,left");
                    tab2.setColTypes("ro,ed");
                    tab2.setColSorting("str,str");
                    tab2.init();

                    //3번탭
                    tab3.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab3.setHeader("개발일정,#cspan,#cspan,주관부서,#cspan,관련부서선행Role(제조/생산/마케팅),OutSourcing 계획", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                    tab3.attachHeader("구분,일자,일수,주,부,#rspan,#rspan", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                    tab3.setInitWidths("100,100,100,100,100,300,300");
                    tab3.setColAlign("center,center,center,center,center,left,left");
                    tab3.setColTypes("coro,ed,ed,ed,ed,ed,ed");
                    tab3.setColSorting("str,str,str,str,str,str,str");
                    tab3.init();

                    //4번탭
                    tab4.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab4.setHeader("구분,당해년도,#cspan,Total(MM),비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                    tab4.attachHeader("#rspan,인원,MM,#rspan,#rspan", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                    tab4.attachFooter("합계, , , , ", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
                    tab4.setInitWidths("100,50,50,150,500");
                    tab4.setColAlign("center,center,center,center,left");
                    tab4.setColTypes("coro,ed,ed,ed,txt");
                    tab4.setColSorting("str,str,str,str,str");
                    tab4.init();

                    //5번탭
                    tab5.cells("a").setHeight(65);
                    tab5.cells("a").setText("1.수준");
                    tab5.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
                    tab5.cells("a").attachObject("devGoal");
                    var tab5Grid = tab5.cells("b").attachGrid();
                    tab5Grid.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab5Grid.setHeader("No, 주요 Spec 및 차별화 Point", null, ["text-align:center;", "text-align:center;"]);
                    tab5Grid.setInitWidths("50,800");
                    tab5Grid.setColAlign("left,left");
                    tab5Grid.setColTypes("ro,ed");
                    tab5Grid.setColSorting("str,str");
                    tab5Grid.init();

                    //6번탭
                    tab6.cells("a").setHeight(150);
                    tab6.cells("a").setText("1. 특허출원 및 논문발표");
                    tab6.cells("b").setText("2. 주요개발기술 및 활용계획");
                    tab6.cells("a").attachObject("devPerfoPlan");
                    var tab6Grid = tab6.cells("b").attachGrid();
                    tab6Grid.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab6Grid.setHeader("No, 주요개발기술 및 활용계획", null, ["text-align:center;", "text-align:center;"]);
                    tab6Grid.setInitWidths("50,800");
                    tab6Grid.setColAlign("left,left");
                    tab6Grid.setColTypes("ro,ed");
                    tab6Grid.setColSorting("str,str");
                    tab6Grid.init();

                    //7번탭
                    tab7.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab7.setHeader("구분,당해년도(천원),Total(천원),비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                    tab7.setInitWidths("100,100,100,506");
                    tab7.setColAlign("center,right,right,center,left");
                    tab7.setColTypes("coro,price,price,txt");
                    tab7.setColSorting("str,str,str,str");
                    tab7.attachFooter("계,0,0,", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
                    tab7.init();

                    //8번탭
                    /* 	tab8.cells("a").hideHeader();
                    	
                    	tab8.cells("a").attachObject("devMarketSize"); */

                    tab8.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                    tab8.setHeader("구분,국내(백만원),해외(천원),비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                    tab8.setInitWidths("100,100,100,506");
                    tab8.setColAlign("center,right,right,center,left");
                    tab8.setColTypes("coro,price,price,txt");
                    tab8.setColSorting("str,str,str,str");
                    tab8.attachFooter("적용제품,,#cspan,#cspan", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
                    tab8.init();

                    //set tool bar//
                    for (var i = 1; i < 9; i++) {
                        var a = toolbar
                        if (i < 7) {
                            subToolbar(a + i, devPlanTabbar.tabs("a" + i), [3, 4, 5, 6]);
                        } else {
                            subToolbar(a + i, devPlanTabbar.tabs("a" + i), [3, 4]);
                        }
                    }
                })
                //tool bar//
            var subToolbar = function(toolbar, sublayout, btn_id_array) {

                toolbar = sublayout.attachToolbar();

                /* var size = 18; */
                toolbar.clearAll();
                toolbar.setIconSize(18);
                toolbar.setIconsPath("/images/button/dhtmlx/");
                toolbar.loadStruct("/common/json/button.json", fn_onLoad);

                function fn_onLoad() {
                    var item_id_set_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

                    for (var i = 0; i < btn_id_array.length; i++) {
                        var index = item_id_set_arr.indexOf(btn_id_array[i]);
                        if (index > -1) {
                            item_id_set_arr.splice(index, 1);
                        }
                    }
                    for (var i = 0; i < item_id_set_arr.length; i++) {

                        toolbar.removeItem("btn" + item_id_set_arr[i]); // item
                        toolbar.removeItem("sep" + item_id_set_arr[i]); // seperator
                    }
                }
            }
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">

                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                            <div class="col-sm-2 col-md-2">
							
								<div class="col-sm-10 col-md-10">
									<input name="stDate" id="stDate" type="text" value=""
										placeholder="" class="form-control input-xs">
								</div>
								<div class="col-sm-2 col-md-2">
									<span> <img id="calpicker1"
										style="margin-top: 1px; widtd: 27px; height: 27px;"
										class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
									</span>
								</div>
							
						</div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                            </div>
                        <div class="col-sm-offset-5 col-md-offset-5 col-sm-2 col-md-2">
                                <input type="button" class="btn btn-default btn-xs" id="btnReportPrint" name="btnReportPrint" value="개발계획보고서인쇄">
                        </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 작성자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제안자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="propsName" id="propsName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제안부서 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="propsDeptName" id="propsDeptName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 과제명 </label>
                            <div class="col-sm-10 col-md-10">
                                <input name="propsDeptName" id="propsDeptName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="devGoal">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-6">
                        <label for="textinput" class="col-xs-1 col-sm-1 col-md-1 control-label">제품</label>
                        <div class="col-xs-3 col-sm-3 col-md-3">
                            <input type="text" class="form-control input-xs" id="devProduct" name="devProduct" value="">
                        </div>
                        <label for="textinput" class="col-xs-1 col-sm-1 col-md-1 control-label">기술</label>
                        <div class="col-xs-3 col-sm-3 col-md-3">
                            <input type="text" class="form-control input-xs" id="devTech" name="devTech" value="">
                        </div>
                        <label for="textinput" class="col-xs-1 col-sm-1 col-md-1 control-label">목표
                            <br>재료비
                        </label>
                        <div class="col-xs-3 col-sm-3 col-md-3">
                            <input type="text" class="form-control input-xs" id="devMtrlCost" name="devMtrlCost" value="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="devPerfoPlan">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-4">
                        <div class="row">
                            <label for="devProduct" class="col-sm-4 control-label">1)특허출원</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-offset-1 col-sm-11">
                                <label for="gbn" class="col-sm-2 control-label" style="text-align: right;">국내</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control input-xs" id="devProduct" name="devProduct" value="">
                                </div>
                                <label for="cnt" class="col-sm-1 control-label">건</label>
                                <label for="gbn" class="col-sm-2 control-label" style="text-align: right;">해외</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control input-xs" id="devProduct" name="devProduct" value="">
                                </div>
                                <label for="cnt" class="col-sm-1">건</label>
                            </div>
                        </div>

                        <div class="row">
                            <label for="devProduct" class="col-sm-4 control-label">2)논문발표</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-offset-1 col-sm-11">
                                <label for="gbn" class="col-sm-2 control-label" style="text-align: right;">국내</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control input-xs col-sm-6" id="devProduct" name="devProduct" value="">
                                </div>
                                <label for="cnt" class="col-sm-1 control-label">건</label>
                                <label for="gbn" class="col-sm-2 control-label" style="text-align: right;">해외</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control input-xs" id="devProduct" name="devProduct" value="">
                                </div>
                                <label for="cnt" class="col-sm-1 control-label">건</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </div>

        <!-- <div id="devMarketSize">
	<div class="col-sm-6">
		<div class="row">
			<label for="" class="col-sm-offset-1">&nbsp;</label>
		</div>
		<div class="row">
			<div class="col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-xs-10 col-sm-10 col-md-10">
				<div class="table">
					<table class="table table-striped table-bordered"
						style="text-align: center;">
						<thead>
							<tr>
								<th style="width: 100px;">구분</th>
								<th>국내(백만원)</th>
								<th>해외(천원)</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Market Size</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>예상매출액</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>예상경상익율</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Target Market</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>적용제품</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div> -->