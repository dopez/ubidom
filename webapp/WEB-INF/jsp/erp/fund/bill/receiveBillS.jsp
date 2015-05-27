<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,2,3,5,6],"1C");
	//받을어음등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,발행일,수금업체,발행인,발행은행,어음번호,어음종류,만기일,금액,어음잔액,"+
			           "배서금액계,할인금액계,만기금액,수금번호",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
                           "100,100,100,100");
	gridMain.setColAlign("center,center,left,left,left,left,left,center,right,right,"+
                         "right,right,right,right");
	gridMain.setColTypes("ron,dhxCalendarA,ed,ed,ed,ed,ed,dhxCalendarA,edn,edn,"+
                         "edn,edn,edn,edn");
	gridMain.setColSorting("int,date,str,str,str,str,str,date,int,int,"+
                           "int,int,int,int");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"},
	                                    {input:"stDate2",button:"calpicker3"},{input:"edDate2",button:"calpicker4"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
	byId("stDate2").value = t;
	byId("edDate2").value = t;
	
	checkStatus('chk1');
	checkStatus('chk2');
	
});
function checkStatus(name){
  if(name == 'chk1'){
	if($("input[name="+name+"]:checked").is(":checked")){
		$("#stDate").attr("disabled", false);
		$("#calpicker1").attr("disabled", false);
		$("#edDate").attr("disabled",false);
		$("#calpicker2").attr("disabled", false);
	}else{
		$("#stDate").attr("disabled", true);
		$("#calpicker1").attr("disabled", true);
		$("#edDate").attr("disabled",true);
		$("#calpicker2").attr("disabled", true);
	}
  }
  if(name == 'chk2'){	
		if($("input[name="+name+"]:checked").is(":checked")){
			$("#stDate2").attr("disabled", false);
			$("#calpicker3").attr("disabled", false);
			$("#edDate2").attr("disabled",false);
			$("#calpicker4").attr("disabled", false);
		}else{
			$("#stDate2").attr("disabled", true);
			$("#calpicker3").attr("disabled", true);
			$("#edDate2").attr("disabled",true);
			$("#calpicker4").attr("disabled", true);
		}
	  } 
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
			    <div class="col-sm-2 col-md-2">
			      <label class="col-sm-8 col-md-8 control-label" for="textinput">
				    발행기간 
				  </label>
				  <div class="col-sm-2 col-md-2">
				     <input type="checkbox" name="chk1" id="chk1" value="y" onclick="checkStatus('chk1')">
				  </div>
			    </div>		
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                          </div>
                       </div> 
                 </div>              
			</div>
		</div>
	  </div>
	  <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
			   <div class="col-sm-2 col-md-2">
			      <label class="col-sm-8 col-md-8 control-label" for="textinput">
				    만기기간 
				  </label>
				  <div class="col-sm-2 col-md-2">
				     <input type="checkbox" name="chk2" id="chk2" value="y" onclick="checkStatus('chk2')">
				  </div>
			    </div>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate2" id="stDate2" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker3" class="calicon form-control" onclick="setSens(1,'edDate2', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate2" id="edDate2" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker4" class="calicon form-control" onclick="setSens(1,'stDate2', 'min')">
                          </div>
                       </div> 
                 </div>              
			</div>
		</div>
	  </div>
     <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 어음번호
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="uNum" id="uNum" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div> 
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 수금번호
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="sNum" id="sNum" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>