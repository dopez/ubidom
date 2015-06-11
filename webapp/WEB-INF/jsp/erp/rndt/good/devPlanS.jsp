<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout,subToolbar;
var calMain;
var subTabbar,tab1,tab2,tab3,tab4,tab5,tab6,tab7,tab8;
var tbar1,tbar2,tbar3,tbar4,tbar5,tbar6,tbar7,tbar8;
var tabId = "a1";
var tbar;//추후 삭제
var combo01;
$(document).ready(function() {


		Ubi.setContainer(4, [1, 2, 3, 4,5,6], "1C"); //개발계획등록

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        //form//
        layout.cells("b").attachObject("bootContainer2");
        layout.cells("b").setHeight(180);


        //setDate//
        calMain = new dhtmlXCalendarObject([{input: "stDate",button: "calpicker1"}]);
        calMain.loadUserLanguage("ko");
        calMain.hideTime();
        var t = dateformat(new Date());
        byId("stDate").value = t;
        
        //tabbar//	
        subTabbar = subLayout.cells("a").attachTabbar({
            tabs: [{id: "a1",text: "목적/배경",active: true}, 
                   {id: "a2",text: "기술/시장/경쟁사동향"}, 
                   {id: "a3",text: "개발일정"}, 
                   {id: "a4",text: "인원계획"}, 
                   {id: "a5",text: "개발목표(수준)"}, 
                   {id: "a6",text: "성과활용계획"}, 
                   {id: "a7",text: "투자계획"}, 
                   {id: "a8",text: "시장규모"}]
        });
        subTabbar.setArrowsMode("auto");
        subTabbar.attachEvent("onTabClick", function(id, lastId){
			tabId = id;
		});
        
        var tab6 = subTabbar.tabs("a6").attachLayout("2E");
        var tab7 = subTabbar.tabs("a7").attachGrid();
        var tab8 = subTabbar.tabs("a8").attachGrid();

        //1번탭 "목적/배경"
        	tab1 = subTabbar.tabs("a1").attachObject("tab1");
        	tab2 = subTabbar.tabs("a2").attachObject("tab2");
        	
        	fn_setTabColor(tabId);
        	
        	fn_setTab3();
        	fn_setTab4();
        	fn_setTab5();

        //6번탭 "성과활용계획"
        tab6.cells("a").setHeight(150);
        tab6.cells("a").setText("1. 특허출원 및 논문발표");
        tab6.cells("b").setText("2. 주요개발기술 및 활용계획");
        tab6.cells("a").attachObject("devPerfoPlan");
        var tab6Grid = tab6.cells("b").attachGrid();
        tab6Grid.setImagePath("/component/dhtmlxGrid/imgs/");
        tab6Grid.setHeader("No, 주요개발기술 및 활용계획", null, ["text-align:center;", "text-align:center;"]);
        tab6Grid.setInitWidths("50,800");
        tab6Grid.setColAlign("left,left");
        tab6Grid.setColTypes("ro,ed");
        tab6Grid.setColSorting("str,str");
        tab6Grid.init();

        //7번탭 "투자계획"
        tab7.setImagePath("/component/dhtmlxGrid/imgs/");
        tab7.setHeader("구분,당해년도(천원),Total(천원),비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
        tab7.setInitWidths("100,100,100,506");
        tab7.setColAlign("center,right,right,center,left");
        tab7.setColTypes("coro,price,price,txt");
        tab7.setColSorting("str,str,str,str");
        tab7.attachFooter("계,0,0,", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
        tab7.init();

        //8번탭 "시장규모"
        /* 	tab8.cells("a").hideHeader();
        	
        	tab8.cells("a").attachObject("devMarketSize"); */

        tab8.setImagePath("/component/dhtmlxGrid/imgs/");
        tab8.setHeader("구분,국내(백만원),해외(천원),비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
        tab8.setInitWidths("100,100,100,506");
        tab8.setColAlign("center,right,right,center,left");
        tab8.setColTypes("coro,price,price,txt");
        tab8.setColSorting("str,str,str,str");
        tab8.attachFooter("적용제품,,#cspan,#cspan", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
        tab8.init();
        
})

function fn_add(){
	if(tabId=="a3"){
		fn_addTab3();
	}
	if(tabId=="a4"){
		fn_addTab4();
	}
}
function fn_save(){
	if(tabId=="a1"){
		alert("1번째 탭 입니다.");
	}
	if(tabId=="a2"){
		alert("2번째 탭 입니다.");
	}
}


function fn_textAreaSetbg(color)
{
	document.getElementById("tab1Note").style.background=color
	document.getElementById("tab2Note").style.background=color
	document.getElementById("tab5Note").style.background=color
}
function fn_setTabColor(tabId){
	if(tabId=="a1"||tabId=="a2"){
		$(".dhx_cell_cont_tabbar",".dhx_cell_tabbar").css("background-color","#f9f9f8");
	}
}
</script>
<script type="text/javascript" src="/js/erp/rndt/devPlanSTab3.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanSTab4.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanSTab5.js"></script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="tab1" class="container">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmTab1">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="tab1Note" id="tab1Note"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="this.value=''; fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')">
                        </textarea>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab2" class="container">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmTab2">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="tab2Note" id="tab2Note"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="this.value=''; fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')">
                        </textarea>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab5_1" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab5_1">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제품 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 기술 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 목표재료 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab5_2" class="container">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmTab5_2">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="tab5Note" id="tab5Note"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="this.value=''; fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')">
                        </textarea>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
							<input name="stDate" id="stDate" type="text" value=""
								placeholder="" class="form-control input-xs">
						</div>
						<div class="col-sm-2 col-md-2">
							<input type="button" id="calpicker1" class="calicon form-control">
						</div>
					
				</div>
                          <div class="col-sm-1 col-md-1">
                              <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                  <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                              </div>
                          </div>
                      <div class="col-sm-offset-4 col-md-offset-4 col-sm-3 col-md-3">
                              <input type="button" class="btn btn-default btn-xs form-control" id="btnReportPrint" name="btnReportPrint" value="개발계획보고서인쇄">
                      </div>
                      </div>
                  </div>
              </div>

              <div class="row">
                  <div class="form-group form-group-sm">
                      <div class="col-sm-8 col-md-8">
                          <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 작성자 </label>
                          <div class="col-sm-2 col-md-2">
                              <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                          </div>
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="form-group form-group-sm">
                      <div class="col-sm-8 col-md-8">
                          <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제안자 </label>
                          <div class="col-sm-2 col-md-2">
                              <input name="propsName" id="propsName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('제안자','common/empPOP')">
                          </div>
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="form-group form-group-sm">
                      <div class="col-sm-8 col-md-8">
                          <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제안부서 </label>
                          <div class="col-sm-2 col-md-2">
                              <input name="propsDeptName" id="propsDeptName" type="text" value="" placeholder="" class="form-control input-xs">
                          </div>
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="form-group form-group-sm">
                      <div class="col-sm-8 col-md-8">
                          <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 과제명 </label>
                          <div class="col-sm-10 col-md-10">
                              <input name="propsDeptName" id="propsDeptName" type="text" value="" placeholder="" class="form-control input-xs">
                          </div>
                      </div>
                  </div>
              </div>
          </form>
          </div>
      </div>
      <div id="devPerfoPlan" class="container">
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