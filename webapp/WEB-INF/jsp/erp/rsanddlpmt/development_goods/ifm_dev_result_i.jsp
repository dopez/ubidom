<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var o; 
var gridMst;
var gridDtl;
var calMain;
$( document ).ready(function() {
	
	ubi.init(4,[1,2,3,4],"1C"); //개발결과등록
	
	o = ubi.getDataSet();
	
	//form//
	o.layout.cells("b").attachObject("bootContainer2");
	o.layout.cells("b").setHeight(180);
	
//tabbar//	
	var devPlanTabbar = o.slayout.cells("a").attachTabbar({
		tabs: [
				{id: "a1", text: "개발완료개요", active: true},
				{id: "a2", text: "Output 활용계획"},
				{id: "a3", text: "개발성과"},
				{id: "a4", text: "개발목표(수준)"},
				{id: "a5", text: "특허출원 등"},
				{id: "a6", text: "투자관련사항"},
				{id: "a7", text: "보고자의견"},
				
			]
		
	});

	var tab1 = devPlanTabbar.tabs("a1").attachGrid();
	var tab2 = devPlanTabbar.tabs("a2").attachGrid();
	var tab3 = devPlanTabbar.tabs("a3").attachGrid();
	var tab4 = devPlanTabbar.tabs("a4").attachLayout("2E");
	var tab5 = devPlanTabbar.tabs("a5").attachLayout("2E");
	var tab6 = devPlanTabbar.tabs("a6").attachGrid();
	var tab7 = devPlanTabbar.tabs("a7").attachGrid();
	
	
	//1번탭
	tab1.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab1.setHeader("No,내  용", null, 
					["text-align:center;","text-align:center;","text-align:center;"]);
	tab1.setInitWidths("50,656");       
	tab1.setColAlign("left,left");     
	tab1.setColTypes("ro,ed"); 
	tab1.setColSorting("str,str");
	tab1.init();   

	//2번탭
	tab2.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab2.setHeader("No, 내  용", null, 
					["text-align:center;","text-align:center;"]);
	tab2.setInitWidths("50,656");       
	tab2.setColAlign("left,left");     
	tab2.setColTypes("ro,ed"); 
	tab2.setColSorting("str,str");
	tab2.init();   

	//3번탭
	tab3.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab3.setHeader("No, 내  용", null, 
					["text-align:center;","text-align:center;"]);
	tab3.setInitWidths("50,656");       
	tab3.setColAlign("left,left");     
	tab3.setColTypes("ro,ed"); 
	tab3.setColSorting("str,str");
	tab3.init();   

	//4번탭
	tab4.cells("a").setHeight(200);
	tab4.cells("a").setText("1.수준");
	tab4.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
	var tab4Grid1 =tab4.cells("a").attachGrid();
	tab4Grid1.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab4Grid1.setHeader("구분, 계획(변경),변경", null, 
			["text-align:center;","text-align:center;","text-align:center;"]);
	tab4Grid1.setInitWidths("100,300,300");       
	tab4Grid1.setColAlign("left,left,left");     
	tab4Grid1.setColTypes("ro,ed,ed"); 
	tab4Grid1.setColSorting("str,str,str");
	tab4Grid1.init(); 
	var tab4Grid = tab4.cells("b").attachGrid();
	tab4Grid.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab4Grid.setHeader("No, 주요 Spec 및 차별화 Point", null, 
			["text-align:center;","text-align:center;"]);
	tab4Grid.setInitWidths("50,800");       
	tab4Grid.setColAlign("left,left");     
	tab4Grid.setColTypes("ro,ed"); 
	tab4Grid.setColSorting("str,str");
	tab4Grid.init(); 
	
	
	//5번탭
	tab5.cells("a").setHeight(80);
	tab5.cells("a").hideHeader();
	tab5.cells("b").hideHeader();
	
	var tab5Grid1 =tab5.cells("a").attachObject("patentInfo");

	var tab5Grid = tab5.cells("b").attachGrid();
	tab5Grid.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab5Grid.setHeader("구분,특허,#cspan,논문,#cspan", null, 
			[]);
	tab5Grid.attachHeader("#rspan,국내,해외,국내,해외")
	tab5Grid.setInitWidths("100,100,100,100,100");       
	tab5Grid.setColAlign("center,left,left,left,left");     
	tab5Grid.setColTypes("coro,ed,ed,ed,ed"); 
	tab5Grid.setColSorting("str,str,str,str,str");
	tab5Grid.init(); 
	
	
	
	//6번탭
	tab6.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab6.setHeader("항목,계획,실적",null,[]);
	tab6.attachFooter("계, , ,",
			   ["text-align:center;font-weight:bold;","text-align:right;font-weight:bold;","text-align:right;font-weight:bold;"]);
	tab6.attachFooter("투임MM, , ,",
			   ["text-align:center;font-weight:bold;","text-align:right;font-weight:bold;","text-align:right;font-weight:bold;"]);
	tab6.setInitWidths("100,200,200");       
	tab6.setColAlign("center,right,right");     
	tab6.setColTypes("coro,ed,ed"); 
	tab6.setColSorting("str,str,str");
	tab6.init();  
	
	//7번탭
	tab7.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	tab7.setHeader("No, 내  용", null, 
					["text-align:center;","text-align:center;"]);
	tab7.setInitWidths("50,756");       
	tab7.setColAlign("left,left");     
	tab7.setColTypes("ro,ed"); 
	tab7.setColSorting("str,str");
	tab7.init();   
	//tab end
	
	
	
	
	//setDate//
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"dueDate",button:"calpicker2"}]);
    calMain.loadUserLanguage("ko");
    calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;	
	
	  //set tool bar//
    for (var i = 1; i < 9; i++) {
        var a = toolbar
            subToolbar(a + i, devPlanTabbar.tabs("a" + i), [3, 4, 5, 6]);
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
<div id="container"
	style="position: relative; width: 100%; height: 100%; overflow: auto;">
	</div>
<div id="bootContainer2">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;"
		id="frmMain01">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 일자 </label>
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
						<input name="seqNo" id="seqNo" type="text"
									value="" placeholder="" class="form-control input-xs" disabled="disabled"></div>
					</div>
				<div class="col-sm-offset-5 col-md-offset-5 col-sm-2 col-md-2">
						<input type="button" class="btn btn-default btn-xs"id="btnReportPrint" name="btnReportPrint" value="개발결과보고서인쇄">
				</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 보고자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="rptName" id="rptName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 개발번호 </label>
					<div class="col-sm-2 col-md-2">
						<input name="devNo" id="devNo" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 과제명 </label>
					<div class="col-sm-10 col-md-10">
						<input name="prjtName" id="prjtName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 출시예정일 </label>
					<div class="col-sm-2 col-md-2">
						
							<div class="col-sm-10 col-md-10">
								<input name="dueDate" id="dueDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-2 col-md-2">
								<span>
						       <img id="calpicker2" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
							</div>
						
					</div>
				</div>
			</div>
		</div>

	</form>
</div>
<!-- <div id="devGoalChange">
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
								<th>계획</th>
								<th>변경</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>제품</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>기술</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>목표재료비</td>
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
<div id="patentInfo">
	<form action="" class="form-horizontal"
		style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;"
		id="frmMain02">
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-1 control-label" for="textinput">
					적용제품 </label>
				<div class="col-sm-6 col-md-6">
					<input name="prjtName" id="prjtName" type="text" value=""
						placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-1 control-label" for="textinput">
					개발선행도 </label>
				<div class="col-sm-10 col-md-10">
					<input type="radio" name="foregoDegree" value="1" checked="checked">국내경쟁사 후행 
					<input type="radio" name="foregoDegree" value="2">국내경쟁사 동일시점 
					<input type="radio" name="foregoDegree" value="3">국내최초
					<input type="radio" name="foregoDegree" value="4">해외선진 Master 동일시점 
					<input type="radio" name="foregoDegree" value="5">세계최초
				</div>
			</div>
		</div>
		
	</form>
</div>