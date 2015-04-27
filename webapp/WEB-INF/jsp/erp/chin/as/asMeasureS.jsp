<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
			var layout, toolbar, subLayout;
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

	            	Ubi.setContainer(2, [1, 2, 3, 4,5,6], "1C"); //조치등록
	
	                layout = Ubi.getLayout();
	                toolbar = Ubi.getToolbar();
	                subLayout = Ubi.getSubLayout();

                    //form//
                    layout.cells("b").attachObject("bootContainer2");

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
                    var devPlanTabbar = subLayout.cells("a").attachTabbar({
                        tabs: [{
                            id: "a1",
                            text: "일반조치",
                            active: true
                        }, {
                            id: "a2",
                            text: "코팅작업"
                        }, {
                            id: "a3",
                            text: "시험의뢰"
                        }]

                    });

                    var tab1 = devPlanTabbar.tabs("a1").attachLayout("2E");
                    var tab2 = devPlanTabbar.tabs("a2").attachLayout("2E");
                    var tab3 = devPlanTabbar.tabs("a3").attachLayout("2E");
                    
					//일반조치
                    tab1.cells("a").setText("접수내용");
                    tab1.cells("b").setText("조치내용");

                    //1st grid
                    var tab1GridMst = tab1.cells("a").attachGrid();
                    
                    tab1GridMst.setImagePath("/component/dhtmlxGrid/imgs/");//col 9
                    tab1GridMst.setHeader("No,일자,고객,장비,모재,약품,상태,첨부,선택");
                    tab1GridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
                    tab1GridMst.setColAlign("center,dhxCalendar,left,left,left,left,center,center,center");
                    tab1GridMst.setColTypes("ron,ed,ed,ed,ed,ed,ed,ed,ra");
                    tab1GridMst.setColSorting("int,date,str,str,str,str,str,str,str");
                    tab1GridMst.init();
                    
                    //2nd grid
                    var tab1GridDtl = tab1.cells("b").attachGrid();
                    tab1GridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab1GridDtl.setHeader("No,조치내용,첨부");
                    tab1GridDtl.setInitWidths("100,700,100");
                    tab1GridDtl.setColAlign("center,left,center");
                    tab1GridDtl.setColTypes("ron,txt,ed");
                    tab1GridDtl.setColSorting("int,str,str");
                    tab1GridDtl.init();
                    
					//코팅작업
                    tab2.cells("a").setText("접수내용");
                    tab2.cells("b").setText("조치내용");

                    //1st grid
                    var tab2GridMst = tab2.cells("a").attachGrid();
                    
                    tab2GridMst.setImagePath("/component/dhtmlxGrid/imgs/");//col 9
                    tab2GridMst.setHeader("No,일자,고객,장비,모재,약품,상태,첨부,선택");
                    tab2GridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
                    tab2GridMst.setColAlign("center,dhxCalendar,left,left,left,left,center,center,center");
                    tab2GridMst.setColTypes("ron,ed,ed,ed,ed,ed,ed,ed,ra");
                    tab2GridMst.setColSorting("int,date,str,str,str,str,str,str,str");
                    tab2GridMst.init();
                    
                    //2nd grid
                    var tab2GridDtl = tab2.cells("b").attachGrid(); //col 15
                    tab2GridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab2GridDtl.setHeader("No,설비,모재코드,모재명,약품,조건,온도,진공도,에칭,어시스트,두께,Rate,에칭,방식,비고");
                    tab2GridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                    tab2GridDtl.setColAlign("center,center,left,left,left,center,right,right,right,right,right,right,right,right,center,center");
                    tab2GridDtl.setColTypes("ro,ed,ed,ed,ed,ed,edn,edn,edn,edn,edn,edn,edn,edn,ed,ed");
                    tab2GridDtl.setColSorting("int,str,str,str,str,str,int,int,int,int,int,int,int,str,str");
                    tab2GridDtl.init();
                    
                  //일반조치
                    tab3.cells("a").setText("접수내용");
                    tab3.cells("b").setText("조치내용");

                    //1st grid
                    var tab3GridMst = tab3.cells("a").attachGrid();
                    
                    tab3GridMst.setImagePath("/component/dhtmlxGrid/imgs/");//col 9
                    tab3GridMst.setHeader("No,일자,고객,장비,모재,약품,상태,첨부,선택");
                    tab3GridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
                    tab3GridMst.setColAlign("center,dhxCalendar,left,left,left,left,center,center,center");
                    tab3GridMst.setColTypes("ron,ed,ed,ed,ed,ed,ed,ed,ra");
                    tab3GridMst.setColSorting("int,date,str,str,str,str,str,str,str");
                    tab3GridMst.init();
                    
                    //2nd grid
                    var tab3GridDtl = tab3.cells("b").attachGrid();
                    tab3GridDtl.setImagePath("/component/dhtmlxGrid/imgs/");// col 19
                    tab3GridDtl.setHeader("No,고객,소속,성명,목적/용도,완료일,설비,위치,약품,시료명,시료수량,시료처리,결과공유,요구사항,시험종류 및 시험수량,#cspan,#cspan,#cspan,시료특이사항");
                    tab3GridDtl.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,종류,항목,시험수량,세부내역,#rspan");
                    tab3GridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                    tab3GridDtl.setColAlign("center,left,left,center,center,center,center,center,center,center,right,center,center,center,center,center,right,center,left");
                    tab3GridDtl.setColTypes("ron,ed,ed,ed,ed,dhxCalendar,ed,ed,ed,ed,edn,ed,ed,ed,ed,ed,ed,edn,ed,ed");
                    tab3GridDtl.setColSorting("int,str,str,str,str,date,str,str,str,str,int,str,str,str,str,str,str,str,int,str,str");
                    tab3GridDtl.init();
                    
                    
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
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                            <div class="col-sm-2 col-md-2">
                                
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
									       <input type="button" id="calpicker1" class="calicon form-control">
									     </span>
                                    </div>
                                
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 등록자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>