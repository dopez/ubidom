<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            var t;
            $(document).ready(function() {

                Ubi.setContainer(1, [1,3,8], "1C"); //      계정별배부기준

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer");
                

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //
                gridMain.setHeader("중분류,소분류,계정,세목,제품별배부기준");
                gridMain.setInitWidths("100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,left");
                gridMain.setColTypes("ro,ro,ro,ro,ed");
                gridMain.setColSorting("str,str,str,str,str");
                gridMain.init();

                calMain = new dhtmlXCalendarObject([{input:"stDate"}]); 
                calMain.loadUserLanguage("ko");
                calMain.setDateFormat("%Y");
                calMain.hideTime();	   
                t = new Date().getFullYear();
            	byId("stDate").value = t;
            })
            
/*             function calYearAdder(n) {
				if(n==1){
					byId("stDate").value++;
				}else{
					byId("stDate").value--;
				}
			} */
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
									기준년도 </label>
								<div class="col-sm-2 col-md-2">
									<div class="col-sm-10 col-md-10">
										<input name="stDate" id="stDate" type="text" value=""
											placeholder="" class="form-control input-xs">
									</div>
									<div class="col-sm-2 col-md-2">
										<input type="button" id="calpicker1" class="calicon form-control">
									</div>
								</div>
								<!-- <div class="col-sm-2 col-md-2">
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
								</div> -->
								<label class=" col-sm-2 col-md-2 control-label" for="textinput">계정분류</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('계정분류','common/accCodePOP')">
                            </div>
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-2 col-md-2">
								<input name="" id="" type="button" value="년도증가"
										placeholder="" class="form-control btn btn-default btn-xs">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>