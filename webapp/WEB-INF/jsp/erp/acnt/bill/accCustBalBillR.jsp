<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(2, [1,8,9], "1C"); //계정거래처잔액명세서

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //3
                gridMain.setHeader("코드,거래처,금액");
                gridMain.attachFooter("&nbsp;,합계,0");
                gridMain.setInitWidths("100,100,100");
                gridMain.setColAlign("center,left,right");
                gridMain.setColTypes("ro,ro,ron");
                gridMain.setColSorting("str,str,int");
                gridMain.init();

                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                
                $("#forHide02").hide();
            })
            function chkbox_onclick() {
			    if (dtlChk.checked) {
			        $("#forHide01").hide();
			        $("#forHide02").show();
			    }
			    else {
			    	$("#forHide02").hide();
			    	$("#forHide01").show();
			    } 
			}
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
	                        <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 기준일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
								       <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                            </div>
	                        <div class="form-group form-group-sm">
	                        	<div id="forHide01">
	                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 계정과목 </label>
	                                <div class="col-sm-2 col-md-2">
	                                   <input name="acc" id="acc" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('계정코드','common/accCodePOP')">
	                                </div>
	                            </div>
	                            <div id="forHide02">
	                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 세목명 </label>
	                                <div class="col-sm-2 col-md-2">
	                                   <input name="dtl" id="dtl" type="text" value="" class="form-control input-xs" ondblclick="gfn_load_popup('세목코드','common/accDtlCodePOP')">
	                                </div>
                            	</div>
                                <div class="col-sm-2 col-md-2">
                                   <input name="dtlChk" id="dtlChk" type="checkbox" value="" placeholder="" class="" onclick="chkbox_onclick()"> 세목
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>