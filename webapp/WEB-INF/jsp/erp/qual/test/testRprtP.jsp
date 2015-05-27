<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMst,girdDtl;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C"); //시험성적서인쇄
	
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	//수주등록
	

        //form//
        layout.cells("b").attachObject("bootContainer");


	
	
	subLayout.cells("a").attachObject("bootContainer2");
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("시험성적서")
    
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
		
})
		function fn_popup_reqNo(subject,view_path){
        	var w2;
        	var eleId = "container";
        	dhxWins = new dhtmlXWindows();
        	dhxWins.attachViewportTo(eleId);
        		
        	w2 = dhxWins.createWindow(eleId, 50, 80, 1020, 500);
        	     dhxWins.window(eleId).setText(subject);
        	// iframe, get
        	w2.attachURL("/erp/popup/"+view_path+".do");
        	return w2;
        }


</script>
        <div id="container" style="position: relative; width: 100%; height: 100%; ">
        </div>
        <div id="bootContainer">
        <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
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
                </div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						시험자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="" id="" type="text" value="" placeholder=""
							class="form-control input-xs">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						의뢰번호 </label>
					<div class="col-sm-2 col-md-2">
						<input name="" id="" type="text" value="" placeholder=""
							class="form-control input-xs" ondblclick="fn_popup_reqNo('의뢰번호','qual/testReportPOP')">
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>
        <div id="bootContainer2">
        <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                
	</form>
	</div>
</div>