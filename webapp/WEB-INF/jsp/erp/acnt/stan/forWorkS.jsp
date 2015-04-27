<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            var t;
            $(document).ready(function() {

                Ubi.setContainer(3, [1,2,3,6,5,9], "2E"); //이월작업입력

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer");
                

                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //
                gridMst.setHeader("대분류명,중분류명,소분류명,계정,계정명,세목,세목명,계정코드");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,center,center,center,center,center");
                gridMst.setColTypes("ro,ro,ro,ro,ro,ro,ro,ron");
                gridMst.setColSorting("str,str,str,str,str,str,str,int");
                gridMst.init();
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //17
                gridDtl.setHeader("No,계정코드,계정명,세목명,차변금액,대변금액,거래처,L/C·계좌·어음번호,시작일,종료일,과표,수량단위,수량,화폐단위,환율,이율,원가구분");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,110,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,left,left,left,right,right,left,left,center,center,right,center,right,center,right,right,center");
                gridDtl.setColTypes("ron,ron,ro,ro,edn,edn,ed,ed,dhxCalendarA,dhxCalendarA,edn,ed,edn,ed,edn,edn,ed");
                gridDtl.setColSorting("int,str,str,str,int,int,str,str,date,date,int,str,int,str,int,int,str");
                gridDtl.init();

                calMain = new dhtmlXCalendarObject([{input:"stDate"}]); 
                calMain.loadUserLanguage("ko");
                calMain.setDateFormat("%Y");
                calMain.hideTime();	   
                t = new Date().getFullYear();
            	byId("stDate").value = t;
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
									기준년도 </label>
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
							</div>
							<div class="form-group form-group-sm">
								<div class="col-sm-offset-2 col-md-offset-2 col-sm-2 col-md-2">
								<input name="" id="" type="button" value="마&nbsp;&nbsp;감"
										placeholder="" class="form-control btn btn-default btn-xs">
								</div>
							</div>
							<div class="form-group form-group-sm">
								<label class="col-sm-offset-2 col-md-offset-2 col-sm-10 col-md-10 control-label" id="forDesc" for="textinput">기준년도의 자료를 마감합니다. 계정의 필수항목 별로(거래처별, 번호별) 잔액을 차기로 이월합니다.</label>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>