<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
//입고마감내역조회


var grid,layout,toolbar,subLayout;

$(document).ready(function(){

    Ubi.setContainer(1,[1,3,4,5,6,7],"1C");
    
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
    layout.cells("b").attachObject("bootContainer2");
   
    grid = subLayout.cells("a").attachGrid();
	grid.setImagePath("/component/dhtmlxGrid/imgs/");      
	grid.setHeader("입고번호,프로젝트번호,도번코드,품목명,규격,단위,입고수량,입고중량,불량수량,불량중량");
	grid.setColumnIds("chkCol,setDate,pjNo,itemCode,dobunCode,itemName,itemSize,materialName,itemUnit");
	grid.setInitWidths("50,80,100,150,100,100,100,100,100,100");       
	grid.setColAlign("center,left,left,left,left,left,center,center,right,right");     
	grid.setColTypes("ch,ed,ro,ro,ro,ro,ro,ro,ro,ro");               
	grid.setColSorting("str,str,str,str,str,str,str,str,str,str");         
	grid.init();   
    
});
function fn_serach() {	
	
	$.ajax({
		url:"/erp/scm/wareEndSrh/search",
	    type :"POST",
	    data : $("#searchConditionForm").serialize(),
	    async : true,
	    success : function(data) {
	
			$.each(data,function(key,value){
					$.each(value,function(k,v){
						if(v==null){
							value[k]="";
						}
					});
			});
	
			grid1.clearAll();
			grid1.parse(data, "js");

	    }
	});
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer2" style="background-color:#EAEAEA">
       <form class="form-horizontal" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;" id="searchConditionForm">
            <div class="row">
                <div class="col-sm-5 col-md-2">
                    <div class="form-group form-group-sm ">
                        <label class="col-sm-4 control-label" for="textinput">품명</label>
                        <div class="col-sm-8 ">
                            <input id="i3" name="itemName" type="text" placeholder="" value="고정기브" class="form-control " required>
                        </div>
                    </div>
               </div>
          </div>
       </form>
</div>