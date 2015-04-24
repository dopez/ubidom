<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout,toolbar,subLayout;
            var gridMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1, 8, 9], "1C"); /*시험장비이력조회 */

            	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();
            	
            	

                    //form//
                    layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //12col
                gridMain.setHeader("No,장비코드,장비명,규격,사용용도,구입일자,구입처,전화번호,구입금액,제작일자,사용기간,사용유무");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,left,left,left,center,center,center,center,right,center,center,center");
                gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ron,ro,ro,ro");
                gridMain.setColSorting("int,str,str,str,str,date,str,str,int,date,date,str");
                gridMain.init();

                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn1"){
        				fn_insert();
        			}
        		});
                
                //popUp
                function fn_popup_bigsize(subject,view_path){
                	var w2;
                	var eleId = "container";
                	dhxWins = new dhtmlXWindows();
                	dhxWins.attachViewportTo(eleId);
                		
                	w2 = dhxWins.createWindow(eleId, 50, 80, 620, 500);
                	     dhxWins.window(eleId).setText(subject);
                	// iframe, get
                	w2.attachURL("/erp/popup/"+view_path+".do");
                	return w2;
                }
                
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			if(colId==1){
        				fn_popup_bigsize('장비상세내역','qual/equiHistoryPOP');
        			}
        		}
            })
                
            function fn_insert() {
            		gridMain.addRow(gridMain.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
        	}

        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; ">
        </div>
        <div id="bootContainer2">
        <div class="container">
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                시험장비코드
                            </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('시험장비','common/testEquiPOP')">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>