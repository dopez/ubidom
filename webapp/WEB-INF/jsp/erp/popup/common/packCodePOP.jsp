<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8],"1C");
	//포장코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	subLayout.cells("a").setHeight(1);
	
	gridMain = layout.cells("b").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("포장코드,포장명",null,
			["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();
	layout.cells("b").setHeight(400); 

	/* layout = new dhtmlXLayoutObject("container","2E");
	layout.cells("a").hideHeader();
	layout.cells("b").hideHeader();
	
	toolbar = layout.cells("a").attachToolbar();
	initToolbar([1,8]);
	layout.cells("a").setHeight(32);

	gridMain = layout.cells("b").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("포장코드,포장명",null,
			["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();
	layout.cells("b").setHeight(400); */
});

/* var initToolbar = function(btn_id_array){
	toolbar.setIconSize(18);
	toolbar.setIconsPath("/images/button/dhtmlx/");
	toolbar.loadStruct("/common/json/button.json",fn_onLoad);

	function fn_onLoad(){
	  var item_id_set_arr = [1,2,3,4,5,6,7,8,9,10];
	    	
	  for(var i=0; i< btn_id_array.length; i++){
	       var index = item_id_set_arr.indexOf(btn_id_array[i]);
	       if (index > -1){
	             item_id_set_arr.splice(index, 1);
	          }
	      }
	  for(var i=0; i<item_id_set_arr.length; i++){
	      toolbar.removeItem("btn"+item_id_set_arr[i]);	
	      toolbar.removeItem("sep"+item_id_set_arr[i]);
	     }	
	 } 
}  */
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>