<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(1, [1,8,9], "1C"); //현금및현금등가물명세서

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //5
                gridMain.setHeader("No,과목,거래처,구좌번호,금액");
                gridMain.attachFooter("&nbsp;,#cspan,#cspan,계,0");
                gridMain.attachFooter("&nbsp;,#cspan,#cspan,합계,0");
                gridMain.setInitWidths("100,100,100,100,100");
                gridMain.setColAlign("center,left,left,left,right");
                gridMain.setColTypes("ron,ro,ro,ro,ron");
                gridMain.setColSorting("int,str,str,str,int");
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
                
                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn1"){
        				mainTabbar.tabs(id).attachURL("/"+uri+".do");
        				fn_insert();
        			}
        		});
                //popUp
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			
        				//gfn_big_load_popup(1120,500,'전표등록내역','acnt/stmtDtlPOP');
                	//mainTabbar.tabs(id).attachURL("/"+uri+".do");
        			
        		}
            })
                
            function fn_insert() {
            		gridMain.addRow(gridMain.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
        	}
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-3 col-md-2 control-label" for="textinput"> 기준일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
								       <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>