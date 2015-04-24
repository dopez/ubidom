<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst, gridDtl;
            var calStDate
            $(document)
                .ready(
                    function() {

                        Ubi.setContainer(1, [1,8,9], "1C"); //진공증착기준조회

                        layout = Ubi.getLayout();
                        toolbar = Ubi.getToolbar();
                        subLayout = Ubi.getSubLayout();
                    	
                        layout.cells("b").attachObject("bootContainer");
                    	
                    	gridMain = subLayout.cells("a").attachGrid(); 
                    	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
                    	gridMain.setHeader("No,설비코드,설비명,적용일자,모재,"+
                    						"약품명,온도,진공도,에칭,어시스트,"+
                    						"두께,Rate,에칭,방식");
                    	gridMain.setInitWidths("100,100,100,100,100,"+
                    							"100,100,100,100,100,"+
                    							"100,100,100,100");       
                    	gridMain.setColAlign("center,left,left,center,left,"+
                    							"left,right,right,center,center,"+
                    							"right,right,center,center");     
                    	gridMain.setColTypes("ron,ro,ro,ro,ro,"+
                    							"ro,ron,ron,ro,ro,"+
                    							"ron,ron,ro,ro"); 
                    	gridMain.setColSorting("int,str,str,date,str,"+
                    							"str,int,int,str,str,"+
                    							"int,int,str,str");
                    	gridMain.init(); 
                        
                    })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer">
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="container">
                    <div class="row">
                        <div class="form-group form-group-sm">

                            <label class="col-sm-2 col-md-2 control-label" for="textinput"> 모재코드 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('모재코드','common/metalCodePOP')">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>