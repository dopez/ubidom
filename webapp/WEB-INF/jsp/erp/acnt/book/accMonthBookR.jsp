<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            var t;
            $(document).ready(function() {

                Ubi.setContainer(3, [1,8], "1C"); //이월작업입력

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer");
                
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //
                gridMain.setHeader("No,회계기간,차변금액,대변금액,차인잔액");
                gridMain.attachFooter(",계,0,0,0");
                gridMain.setInitWidths("100,100,100,100,100");
                gridMain.setColAlign("center,center,right,right,right");
                gridMain.setColTypes("ro,ro,ron,ron,ron");
                gridMain.setColSorting("str,str,int,int,int");
                gridMain.init();
                

                calMain = new dhtmlXCalendarObject([{input:"stDate"}]); 
                calMain.loadUserLanguage("ko");
                calMain.setDateFormat("%Y");
                calMain.hideTime();	   
                t = new Date().getFullYear();
            	byId("stDate").value = t;
            	//combo
            	/* var z=dhtmlXComboFromSelect("combo_zone1");
            	z.enableAutocomplete();
            	z.setTemplate({
            	    input: "#combo_zone1#",
            	    columns: [
            	        {header: "세목코드", width: 110, css: "", option: "#c1#"},
            	        {header: "세목명", width: 250, css: "", option: "#c2#"}
            	    ]
            	});
            	z.addOption([
            	             {value: "1", text:
            	             {c1: "1110500", c2: "받을어음"}
            	         },
            	         {value: "2", text:
            	             {c1: "1110700", c2: "선급금"}
            	         },
            	     ]); */
            })
            
            function calYearAdder(n) {
				if(n==1){
					byId("stDate").value++;
				}else{
					byId("stDate").value--;
				}
			}
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer">
			<div class="container">
				<form class="form-horizontal" id="frmMain" name="frmMain"
					style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
					<div class="row">
						<div class="col-sm-8 col-md-8">
							<div class="form-group form-group-sm">
								<label class=" col-sm-2 col-md-2 control-label" for="textinput">
									회계년도 </label>
								<div class="col-sm-2 col-md-2">
										<div class="col-sm-6 col-md-6">
											<input name="stDate" id="stDate" type="text" value=""
												placeholder="" class="form-control input-xs">
										</div>
										<div class="col-sm-3 col-md-3">
											<input type="button" id="" class="form-control btn btn-default btn-xs" value="▲" onclick="calYearAdder(1)">
										</div>
										<div class="col-sm-3 col-md-3">
											<input type="button" id="" class="form-control btn btn-default btn-xs" value="▼" onclick="calYearAdder(2)">
										</div>
								</div>
								<div class="col-sm-offset-1 col-md-offset-1 col-sm-2 col-md-2">
									<div class="col-sm-6 col-md-6">
										<input type="button" id="" class="form-control btn btn-default btn-xs" value="◀ 이전" onclick="">
									</div>
									<div class="col-sm-6 col-md-6">
										<input type="button" id="" class="form-control btn btn-default btn-xs" value="이후 ▶" onclick="">
									</div>
								</div>
							</div>
							<div class="form-group form-group-sm">
								<label class=" col-sm-2 col-md-2 control-label" for="textinput">
									세목명 </label>
								<div class="col-sm-2 col-md-2">
									<!-- <select id="combo_zone1" name="cb1">
									    <option value="1"></option>
									    <option value="2"></option>
									</select> -->
									<input name="cb1" id="combo_zone1" type="text" value=""
												placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('','common/accDtlCodePOP')">
								</div>
								<div class="col-sm-3 col-md-3">
									<input name="" id="" type="text" value=""
												placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('','common/accDtlCodePOP')">
								</div>
							</div>
							<div class="form-group form-group-sm">
								<label class=" col-sm-2 col-md-2 control-label" for="textinput">
									구분 </label>
								<div class="col-sm-2 col-md-2">
									<input name="gbn" id="" type="radio" value="1" placeholder="" class="">계정
									<input name="gbn" id="" type="radio" value="1" placeholder="" class="">세목
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>