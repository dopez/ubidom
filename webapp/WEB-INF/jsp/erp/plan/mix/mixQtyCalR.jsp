<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(3,[1,8,9],"1C"); //배합수량계산조회
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");      //12 col
	gridMst.setHeader("No,일자,작업자,제품코드,제품명,제품재고,재공재고,적정재고,미출하수량,과부족수량,배합중량,생산예정수량", null, 
					["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.attachFooter("일계,#cspan,#cspan,#cspan,#cspan,0,0,0,0,0,0,0", 
					["text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;"]);
	gridMst.attachFooter("합계,#cspan,#cspan,#cspan,#cspan,0,0,0,0,0,0,0", 
					["text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;"]);
	
	gridMst.setInitWidths("50,100,100,100,200,100,100,100,100,100,100,100");       
	gridMst.setColAlign("center,center,left,left,left,right,right,right,right,right,right,right");     
	gridMst.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro"); 
	gridMst.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
	gridMst.init();

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

<div id="container"
	style="position: relative; width: 100%; height: 100%;">
	</div>
<div id="bootContainer2">
<div class="container">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmSearch">
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
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 등록자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="regEmpName" id="regEmpName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 제품군 </label>
					<div class="col-sm-4 col-md-4">
					  <input type="radio"
						name="productStringGbn" value="1" checked="checked">1군
					  <input type="radio"
						name="productStringGbn" value="2">2군
					  <input type="radio"
						name="productStringGbn" value="3">3군
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>