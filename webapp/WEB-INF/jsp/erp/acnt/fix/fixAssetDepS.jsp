<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 3], "1C"); //고정자산상각

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();


                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("모든자산에 대해 상각을 합니다.(전표자동생성)  월상각은 년상각의 1/12에 해당하는 값으로 처리됩니다.");
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
                gridMain.setHeader("No,자산코드,자산명,취득일,취득부서,"+
                					"수량,취득금액,상각율,전기말상각누계액,전기말미상각잔액,"+
                					"당기증가,당기감소,당기말금액,당월상각액,당기상각액,"+
                					"당기말상각누계액,기말잔액,재평가금액,비용구분");
                gridMain.setInitWidths("100,100,100,100,100,"+
                						"100,100,100,110,110,"+
                						"100,100,100,100,100,"+
                						"110,100,100,100");
                gridMain.setColAlign("center,left,left,center,left,"+
                						"right,right,right,right,right,"+
                						"right,right,right,right,right,"+
                						"right,right,right,center");
                gridMain.setColTypes("ron,ro,ro,dhxCalendarA,ed,"+
                						"edn,edn,edn,edn,edn,"+
                						"edn,edn,edn,edn,edn,"+
                						"edn,edn,edn,ed");
                gridMain.setColSorting("int,str,str,date,str,"+
                						"int,int,int,int,int,"+
                						"int,int,int,int,int,"+
                						"int,int,int,str");
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
            })
            function fn_popup_asset() {
            	gfn_load_popup('자산분류','acnt/assetCodePOP');
            }
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                        	<div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 상각연월 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2">
                                	<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    	<input type="button" id="" class="form-control btn btn-default btn-xs" name="" value="상각생성">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 자산분류 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input type="text" class="form-control input-xs" name="" id="" value="" ondblclick="fn_popup_asset()">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                	<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    	<input type="button" id="" class="form-control btn btn-default btn-xs" name="" value="상각취소">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>