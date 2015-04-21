<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst, gridDtl;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(4, [1, 3], "2E"); //      전표(일괄)승인

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9
                gridMst.setHeader("전표일자,No,발의부서,발행자,전표구분,승인여부,승인일자,승인No,결재구분");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,left,center,center,center,center,center,center");
                gridMst.setColTypes("ro,ron,ro,ro,ro,ra,ro,ron,ro");
                gridMst.setColSorting("date,int,str,str,str,na,date,int,str");
                gridMst.init();

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //8
                gridDtl.setHeader("No,계정,세목,귀속부서,차변금액,대변금액,거래처,적요,번호(어음·계좌·L/C)");
                gridDtl.attachFooter(",전표합계,#cspan,#cspan,0,0,(차액)");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,right,right,left,left,left");
                gridDtl.setColTypes("ron,ro,ro,ro,ron,ron,ro,ro,ro");
                gridDtl.setColSorting("int,str,str,str,int,int,str,str,str");
                gridDtl.init();
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

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    기간 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2">
								<input name="" id="" type="button" value="전체승인"
										placeholder="" class="form-control btn btn-default btn-xs">
								</div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    발의부서 </label>
                                <div class="col-sm-2 col-md-2">
                                	<input type="text" class="form-control input-xs" name="" id="" value="">
                                </div>    
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    거래처 </label>
                                <div class="col-sm-4 col-md-4">
                                	<input type="text" class="form-control input-xs" name="" id="" value="">
                                </div>    
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    구분 </label>
                                <div class="col-sm-2 col-md-2">
									<select class="form-control input-xs">
	                                    <option>전체</option>
	                                    <option>일반</option>
	                                    <option>상품매출</option>
	                                    <option>원자재매출</option>
	                                    <option>기타매출</option>
	                                    <option>상품매입</option>
	                                    <option>외주매입</option>
	                                    <option>원자재매입</option>
	                                    <option>기타매입(정기)</option>
	                                    <option>기타매입(비정기)</option>
	                                </select>
								</div>
								<label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    전표구분 </label>
                                <div class="col-sm-2 col-md-2">
									<select class="form-control input-xs">
	                                    <option>전체</option>
	                                    <option>입금</option>
	                                    <option>출금</option>
	                                    <option>대체</option>
	                                </select>
								</div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    승인구분 </label>
                                <div class="col-sm-8 col-md-8">
                                	<input type="radio" class="" name="appvGbn" id="" value="1" checked="checked">전체 
                                	<input type="radio" class="" name="appvGbn" id="" value="2">승인
                                	<input type="radio" class="" name="appvGbn" id="" value="3">미승인
                                </div>    
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>