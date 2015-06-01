<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
        var gridMain;
        var calMain;
        $(document).ready(function() {

            Ubi.setContainer(1, [1,2,3,4,5,6,7,8,9,10], "1C"); //계정코드입력

            layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();

            //form//
            layout.cells("b").attachObject("bootContainer2");
            gridMain = new dxGrid(subLayout.cells("a"), false);
            gridMain.addHeader({name:"대분류명",     colId:"acNm1",  width:"10", align:"left", type:"tree"});
            gridMain.addHeader({name:"중분류명",   colId:"acNm2",   width:"7",  align:"left", type:"ro"});
            gridMain.addHeader({name:"소분류명",   colId:"acNm3", width:"7",  align:"center", type:"ro"});
            gridMain.addHeader({name:"계정",   colId:"acCd4",   width:"7",  align:"center", type:"ro"});
            gridMain.addHeader({name:"계정명",   colId:"postCode", width:"7",  align:"center", type:"ed"});
        	gridMain.addHeader({name:"세목",   colId:"postName", width:"7",  align:"center", type:"ed"});
        	gridMain.addHeader({name:"세목명",   colId:"jikgun",   width:"7",  align:"center", type:"ed"});
        	gridMain.addHeader({name:"계정코드",   colId:"jikmu",    width:"7",  align:"center", type:"ro"});
        	gridMain.addHeader({name:"타계정",   colId:"jikwee",   width:"7",  align:"center", type:"ed"});
        	gridMain.addHeader({name:"차대구분",   colId:"jikchak",  width:"7",  align:"center", type:"combo"});
        	gridMain.addHeader({name:"사용구분", colId:"codeChk",   width:"7",  align:"center", type:"dblRdo"});
        	gridMain.setColSort("str");
            gridMain.init();
        })
         function fn_search(){

   		  gfn_callAjaxComm($("#frmSearch").serialize(),"search",test)

   		}
        function test(data){
        	console.log('data',data);
        	gridMain.dxObj.addRow(gridMain.dxObj.uid(),"");
        	gridMain.dxObj.addRow(gridMain.dxObj.uid(),"");
        }
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
               <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">계정분류</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="acCd1" id="" type="text" value="%" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('계정분류','common/accCodePOP')">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>