<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 2, 3, 4, 5, 6, 7 ,9], "3E"); //전표등록(상세)

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer");
				subLayout.cells("b").attachObject("bootContainer2");
				subLayout.cells("b").setHeight(50);
				
                //grid	
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //9
                gridMst.setHeader("전표일자,구분,계정번호,계정명,차변금액,대변금액,적요,거래처명,사업부");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,right,right,center,left,left");
                gridMst.setColTypes("dhxCalendarA,coro,ro,ro,edn,edn,ed,ed,ed");
                gridMst.setColSorting("date,str,str,str,int,int,str,str,str");
                gridMst.init();

                gridDtl = subLayout.cells("c").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //13
                gridDtl.setHeader("번호,계정명,세목,차변금액,대변금액,거래처,적요,번호,귀속부서,화폐단위,환율,이율,원가구분,일자,과표,매입구분,매출구분,배서/할인,지급처/은행,전자구분");
                gridDtl.attachFooter("&nbsp;,합계,#cspan,0,0");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,right,right,left,center,center,center,center,right,right,center,center,center,center,center,center,center,center");
                gridDtl.setColTypes("ron,ro,ed,edn,edn,ed,ed,edn,ed,ed,edn,edn,coro,dhxCalendarA,ed,coro,coro,coro,coro,coro");
                gridDtl.setColSorting("int,str,str,int,int,str,str,int,str,str,int,int,str,date,str,str,str,str,str,str");
                gridDtl.init();
                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "setDate",
                    button: "calpicker"
                }, {
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "edDate",
                    button: "calpicker2"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("setDate").value = t;
                byId("stDate").value = t;
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; ">
        </div>
        <div id="bootContainer">
            <div class="container">
                <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
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
                            </div>
                            <div class="col-sm-4 col-md-4">
								<div class="col-sm-4 col-md-4">
									<input name="" id="" type="button" value="거래처추가" placeholder="" class="form-control btn btn-default btn-xs">
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">사업장</label>
								<div class="col-sm-2 col-md-2">
									<input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('사업장코드','common/customPOP')">
								</div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">사업부</label>
								<div class="col-sm-2 col-md-2">
									<input name="" id="" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('부서명','common/deptCodePOP')">
								</div>
                            </div>
                            <div class="col-sm-4 col-md-4">
								<div class="col-sm-4 col-md-4">
									<input name="" id="" type="button" value="계정코드추가" placeholder="" class="form-control btn btn-default btn-xs" >
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">금액으로찾기</label>
								<div class="col-sm-2 col-md-2">
									<input name="" id="" type="text" value="" placeholder="0" class="form-control input-xs">
								</div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">적요로찾기</label>
								<div class="col-sm-2 col-md-2">
									<input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
								</div>
                            </div>
                            <div class="col-sm-4 col-md-4">
								<div class="col-sm-4 col-md-4">
									<input name="" id="" type="button" value="적요등록" placeholder="" class="form-control btn btn-default btn-xs">
								</div>
                            </div>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                    <div class="row">
                        <div class="form-group form-group-sm">
                                <label class=" col-sm-1 col-md-1 control-label" for="textinput">
                                    일자 </label>
                                <div class="col-sm-1 col-md-1">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs" style="font-size: 8pt;">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker" class="calicon form-control">
                                    </div>
                                </div>
                                <label class=" col-sm-1 col-md-1 control-label" for="textinput">
                                    전표번호</label>
                                <div class="col-sm-1 col-md-1">
                                        <input name="seqNo" id="seqNo" type="text" value="" placeholder="0001" class="form-control input-xs" disabled="disabled">
                                </div>
                                <label class=" col-sm-1 col-md-1 control-label" for="textinput">
                                    전표구분</label>
                                <div class="col-sm-1 col-md-1">
                                    <select class="form-control input-xs">
	                                    <option>대체</option>
	                                    <option>입금</option>
	                                    <option>출금</option>
	                                </select>
                                </div>
                                <label class=" col-sm-1 col-md-1 control-label" for="textinput">
                                    담당자</label>
                                <div class="col-sm-1 col-md-1">
                                        <input name="" id="" type="text" value="" placeholder="2200901" class="form-control input-xs" disabled="disabled">
                                </div>
                                <div class="col-sm-1 col-md-1">
                                        <input name="" id="" type="text" value="" placeholder="홍길동" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-1 col-md-1 control-label" for="textinput">
                                    사업부</label>
                                <div class="col-sm-1 col-md-1">
                                        <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>