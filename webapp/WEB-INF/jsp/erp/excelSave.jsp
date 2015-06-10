<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

    $(document).ready( function() {
    	Ubi.setContainer(1, [3], "1C"); 

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        layout.cells("b").attachObject("bootContainer2");

    	toolbar.attachEvent("onClick", function(id) {
    		if (id == "btn3") {
    			$("#frmMain").submit();
    		}
    	});
    });
</script>


<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer2">
    <form id="frmMain" method="post" action="/file/prcsExcel.sc" enctype="multipart/form-data">
    <div class="container">
        <div class="row">
            <div class="form-group form-group-sm">
                <div class="col-sm-8 col-md-8">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput">파일선택 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="attachFile" type="file">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>