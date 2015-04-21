<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(0, [1,2,3,4,5,6], "2U"); //명세서코드세팅작업

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                subLayout.cells("a").setWidth(302);

                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //
                gridMst.setHeader("No,Seq,명세서명");
                gridMst.setInitWidths("100,100,100");
                gridMst.setColAlign("center,center,center");
                gridMst.setColTypes("ron,edn,ed");
                gridMst.setColSorting("int,int,str");
                gridMst.init();

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //
                gridDtl.setHeader("계정명,세목명,코드");
                gridDtl.setInitWidths("100,100,100");
                gridDtl.setColAlign("center,center,center");
                gridDtl.setColTypes("ro,ed,edn");
                gridDtl.setColSorting("str,str,int");
                gridDtl.init();
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>