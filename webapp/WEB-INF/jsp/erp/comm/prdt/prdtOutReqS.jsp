<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C"); //제품출고의뢰등록
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	//up
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");     
	gridMain.setHeader("No,제품코드,제품명,단위,수량,사용일자,용도", null,[]);
	gridMain.setInitWidths("50,150,200,100,100,100,200");       
	gridMain.setColAlign("center,left,left,center,right,center,center");     
	gridMain.setColTypes("ro,ro,ro,ed,edn,dhxCalendarA,ed"); 
	gridMain.setColSorting("str,str,str,str,int,date,str");
	gridMain.init();
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
		
		//항목삽입
        toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				fn_insert();
			}
		});
        //popUp
        gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
        function doOnRowDblClicked(rowId,colId){
			if(colId==1){
				gfn_load_popup('제품코드','common/goodsCodePOP');
			}
		}
      
    })
        
    function fn_insert() {
    		gridMain.addRow(gridMain.getUID(),"1,,TEST,TEST,100,2,TEST,Test",1);
	}

</script>
        <div id="container" style="position: relative; widtd: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">일자</label>
                                    <div class="col-sm-2 col-md-2">

                                        <div class="col-sm-10 col-md-10">
                                            <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
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

                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                        의뢰자 </label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="rqstName" id="rqstName" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group form-group-sm">
                                <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/erp/common/appvTable.jsp"></jsp:include>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>