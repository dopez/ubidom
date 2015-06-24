<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#container{
			width: 100%;
			height: 100%;
			margin: 0px;
			padding: 0px;
			background-color: #ebebeb;
			overflow: hidden;
			position:auto;
}
</style>
<script type="text/javascript">

var mainLayout;
var mainTabbar;
var leftLayout;
var mainMenu;
var leftForm;
var leftToolbar;
var scrnParm;
$( document ).ready(function() {
	mainLayout = new dhtmlXLayoutObject({
			parent: "container",
			pattern: "3T"
		});

	mainLayout.forEachItem(doItemAction);

	leftToolbar = mainLayout.cells("b").attachToolbar();
	leftToolbar.clearAll();
	leftToolbar.setIconSize(18);
	leftToolbar.setIconsPath("/images/size/18/");
	leftToolbar.loadStruct("/common/json/menu_header_bar.json");
	leftToolbar.setAlign("right");
	leftToolbar.attachEvent("onClick", function(id){
		mainLayout.cells("b").collapse();
	});
	$(".dhx_toolbar_dhx_skyblue div.dhx_toolbar_btn input.dhxtoolbar_input").delegate(":input, change keyup",function(e){

	});
	leftToolbar.attachEvent("onEnter", function(id, value){

		mainMenu.getDxObj().findItem(value,0,1);
	});
	leftToolbar.attachEvent("onValueChange", function(id, value){
		mainMenu.getDxObj().findItem(value,0,1);
	});
	//leftToolbar.addInput("input_new",1,"",200);
	mainMenu = mainLayout.cells("b").attachTree();
	mainMenu.enableSmartCheckboxes(true);
	fncMenuConf();

	mainTabbar = mainLayout.cells("c").attachTabbar();
	mainMenu.enableThreeStateCheckboxes(true);
	mainMenu.enableCheckBoxes(true, true);
	mainLayout.cells("a").attachObject("top");
	mainTabbar.enableAutoReSize(true);
	
	mainLayout.cells("b").setWidth(220);
	mainLayout.cells("a").setHeight(25);
	mainLayout.cells("a").fixSize(false, true);

	/* 메뉴 쪽 레이아웃 사이즈 조절 가능*/
	mainLayout.cells("b").fixSize(true, false);
	mainLayout.cells("b").fixSize(false, true);

	/* 메뉴 쪽 레이아웃 사이즈 조절 불가능*/
	//mainLayout.cells("c").fixSize(true, true);
	//mainLayout.cells("b").fixSize(true, true);

	/*cell collapse*/
	//mainLayout.cells("a").collapse();
 	//mainLayout.cells("d").collapse();
    
	mainTabbar.attachEvent("onSelect", function(id, lastId){
		mainMenu.getDxObj().selectItem(id);
		//Tabbar 클릭시 Tree scroll이 해당위치로 이동
		mainMenu.getDxObj().focusItem(id);
		//Tabbar 클릭시 menu path get
		getViewFullPath(id);
		return true;
	});
	
	/* mainTabbar.attachEvent("onTabClose", function(id){
		if(mainTabbar.getNumberOfTabs() <= 1){
 			$("[name=pathbar]").val("");
		}
		return true;
	}); */
	
	mainTabbar.attachEvent("onContentLoaded", function(id){
		getViewFullPath(id);
	});
	$(window).resize(function(){
		mainLayout.setSizes();
	});
	$('#full_screen').click(function(event) {
		event.preventDefault();
	});
	
	$('#log_out').click(function(event) {
		event.preventDefault();
		dhtmlx.confirm({
			title:"확 인",
			ok:"네", cancel:"아니오",
			text:"정말로 로그아웃 하시겠습니까?",
			callback:function(result){
				if(result)
					extLogout();
				else
					return true;
			}
		});
		function extLogout(){
			$.ajax({
				url : "/logout",
		        type : "POST",
		        dataType: "json",
		        success : function(data) {
					if(data.rtnCode=="1") {
						alert("로그아웃되었습니다.");
						location.replace("/login.jsp");
					}
		        }
			});
		}
	})

	$('#home a').click(function(event) {
		event.preventDefault();
		location.replace("/erp/main.do");
	})

})
/*END MAIN DOC READY*/

function doItemAction(cell) {
/*all main cell header remove*/
    	cell.hideHeader();
}

function fncMenuConf() {
	var req = $.ajax({
		url: "/erp/user/menu",
		type: "get",
		dataType: "json"
	});
	req.done(function(jsonData) {
		if("[]"!=JSON.stringify(jsonData)) {

			var data = {menuTree:jsonData};
			fncSetMenuLoad(data);
		} else {
			MsgManager.alertMsg("WRN040");
		}
	});
}

var fncSetMenuLoad = function(param) {
	if(mainMenu!=null) {
		mainMenu.destructor();
	}
	mainMenu = mainLayout.cells("b").attachTree();
	mainMenu = new dxTree(mainMenu);
	mainMenu.setData(param.menuTree);
	mainMenu.click(function(id){
		fncSelectItem(mainMenu, id);
	});

	mainMenu.load("menucd", "pmenucd", "menuname", mainMenu);
}

function chg_selected_tab(id,lastId) {

}
var menuId;
var fncSelectItem = function(tree, id) {

	var exegbn = "";
	try { // folder
		exegbn = tree.getUserData(id, "exegbn");
		if(exegbn=="0" && tree.getDxObj().getOpenState(id)==1) {
			tree.getDxObj().closeItem(id);
		} else {
			tree.getDxObj().openItem(id);
			tree.getDxObj().selectItem(id, false, false);
		}

	} catch(e){
		alert(e);
	}
	if(exegbn=="1") { // item
		var flag = true;
		var uri = tree.getUserData(id, "uri");
		scrnParm = tree.getUserData(id, "scrnParm");
		/*메뉴id 전역변수 처리*/
		menuId = id;

		var menuItemText = tree.getDxObj().getItemText(id);
		mainTabbar.forEachTab(function(tab){
		    var tabId = tab.getId();
		    if(id == tabId){
				flag=false;
				mainTabbar.tabs(tabId).setActive();
				menuId = tabId;
			}

		});

		if(flag){
		 	var src = '&nbsp;&nbsp;<input type="image" src="/images/button/dhtmlx/close.gif" width="12" height="12"'+
			'id="closeBtn" name="closeBtn">'; 
			mainTabbar.addTab(id, menuItemText, null, null, true, true);
            mainTabbar.tabs(id).attachURL("/"+uri+".do");
		}
	}
}
/* function closeEvent(id){
	//console.log(mainTabbar.tabs(id).cell);
	console.log( page.childNodes[0]);
} */
function getViewFullPath(id){
	var finalPath="";
	var path;
	var level;
	var initPath = mainMenu.getDxObj().getItemText(id);

	level = mainMenu.getDxObj().getLevel(id);
	mainMenu.getDxObj().selectItem(id);
	do {

		var parentId = mainMenu.getDxObj().getParentId(id);
		path = " > "+mainMenu.getDxObj().getItemText(parentId);
		finalPath = path+finalPath;
		id = parentId;
		level--;
	}while (level > 1);
	$("#pathbar").val(finalPath.slice(2)+" > "+initPath);
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="scrnParm" name="scrnParm" />
</form>
<div id="top" style="background-color:black ;">
	<div style="float:left;margin-top:5px;margin-left:30px;" id="home" >
<!-- 메뉴경로 넣기 전 -->
<!-- <div style="float:left;margin-top:15px;margin-left:30px;" id="home" > -->
<!-- <a href="#" onclick="window.open('/report/reportPdf.do','rpt','');">PDF</a>&nbsp;&nbsp; -->
<!-- <a href="#" onclick="window.open('/report/reportExcel.do','rpt','');">XLS</a> -->
		<p id="test">
			<input name='pathbar' id='pathbar' readonly style='font-weight:bold; border:0px;background-color:transparent;width:400px;' value=''/>
		</p>
	</div>
	<div style="float:right;margin-top:5px;margin-right:30px;"id="logout">
<!-- 		<a  href="#" id="full_screen">전체화면</a>-->	
		<input name='empNo' id='empNo' readonly style='font-weight:bold; margin-right:0px; border:0px;background-color:transparent; text-align:right' value="사번 : ${empNo}">
		<input name='empNm' id='empNm' readonly style='font-weight:bold; margin-right:50px; border:0px;background-color:transparent; text-align:right' value="이름 : ${empName}">
 		<a  href="#" id="log_out">로그아웃</a></div>
	</div>
<div id="container"></div>
<!-- <div id="statusBar" style="height:20px;">STATUS BAR</div> -->
