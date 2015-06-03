<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"2U");
	//설비이력등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(300);
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"15", align:"center", type:"cntr"});
	gridMain.addHeader({name:"설비코드", colId:"equiCode",   width:"35", align:"center", type:"ro"});
	gridMain.addHeader({name:"설비명",   colId:"equiName",   width:"25", align:"center", type:"ro"});
	gridMain.addHeader({name:"사용공정", colId:"useProcess", width:"25", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.init(); 

	subLayout.cells("a").setWidth(400);
	subLayout.cells("b").attachObject("bootContainer2");
	
	calMain = new dhtmlXCalendarObject([{input:"buyDate",button:"calpicker1"},{input:"regDate",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("buyDate").value = t;
	byId("regDate").value = t;
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">      
         <div class="row">
	        <div class="form-group form-group-sm">
		       <div class="col-sm-8 col-md-8">
			      <label class="col-sm-2 col-md-2 control-label" for="textinput">
			       설비코드
			      </label>
			      <div class="col-sm-2 col-md-2">
			        <input name="eqCode" id="eqCode" type="text" value="" placeholder="" class="form-control input-xs">
			      </div>
			      <label class="col-sm-1 col-md-1 control-label" for="textinput">
			       거래처
			      </label>
			      <div class="col-sm-2 col-md-2">
			         <input name="splyComp" id="splyComp" type="text" value="" placeholder="" class="form-control input-xs">
			      </div>
		       </div>
	       </div>
	     </div>
      </form>
  </div>   
</div>
<div id="bootContainer2" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmMain" name="frmMain" enctype="multipart/form-data" style="padding-top:10px;padding-bottom:5px;margin:0px;">      
          <input type="hidden" id="cudKey" name="cudKey" />
          <input type="hidden" id="empNo" name="empNo" />
          <div class="row">
	         <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput">
		         설비코드
		        </label>
		        <div class="col-sm-1 col-md-1">
			       <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
		        <label class="col-sm-1 col-md-1 control-label" for="textinput">
		          설비명
		        </label>
		        <div class="col-sm-1 col-md-1">
			      <input name="equiName" id="equiName" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
	         </div>
	      </div>
          <div class="row">
	         <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput">
		         규격
		        </label>
		        <div class="col-sm-1 col-md-1">
			      <input name="standard" id="standard" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
		        <label class="col-sm-1 col-md-1 control-label" for="textinput">
		         용량
		       </label>
		       <div class="col-sm-1 col-md-1">
			      <input name="capacity" id="capacity" type="text" value="" placeholder="" class="form-control input-xs">
		       </div>
	        </div>
	     </div>
	    <div class="row">
	       <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput">
		       구입금액
		      </label>
		      <div class="col-sm-1 col-md-1">
			     <input name="buyMoney" id="buyMoney" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
		       <label class="col-sm-1 col-md-1 control-label" for="textinput">
		        구입일자
		      </label>
		       <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11">
                     <input name="buyDate" id="buyDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                  </div>
                  <div class="col-sm-1 col-md-1">
                      <input type="button" id="calpicker1" class="calicon form-control input-xs">
                  </div>              
               </div> 
	       </div>
	    </div>
	    <div class="row">
	       <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput">
		        사용공정
		      </label>
		      <div class="col-sm-1 col-md-1">
			     <input name="useProcess" id="useProcess" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
		      <label class="col-sm-1 col-md-1 control-label" for="textinput">
		        담당자
		      </label>
		      <div class="col-sm-1 col-md-1">
			    <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
	       </div>
	   </div>
	   <div class="row">
	       <div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       공급업체
		     </label>
		     <div class="col-sm-2 col-md-2">
			    <input name="supplyComp" id="supplyComp" type="text" value="" placeholder="" class="form-control input-xs">
		     </div>
		     <label class="col-sm-1 col-md-1 control-label" for="textinput">
		       제작업체
		     </label>
		     <div class="col-sm-1 col-md-1">
			    <input name="makeComp" id="makeComp" type="text" value="" placeholder="" class="form-control input-xs">
		     </div>
	     </div>
	  </div>
	  <div class="row">
	     <div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput">
		       등록일자
		     </label>
		     <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11">
                     <input name="regiDate" id="regiDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                  </div>
                   <div class="col-sm-1 col-md-1">
                       <input type="button" id="calpicker2" class="calicon form-control input-xs">
                  </div>              
             </div> 
		     <label class="col-sm-1 col-md-1 control-label" for="textinput">
		        사용유무
		     </label>
		     <div class="col-sm-1 col-md-1">
		        <select name="useYn" id="useYn" class="form-control input-xs">
		          <option value="Y">Y</option>
		          <option value="N">N</option>
		        </select>
		     </div>
	     </div>
	 </div>
	 <div class="row">
	     <div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput">
		       사용중지사유
		     </label>
		     <div class="col-sm-3 col-md-3">
			   <input name="useStopRemarks" id="useStopRemarks" type="text" value="" placeholder="" class="form-control input-xs">
		    </div>
	     </div>
	  </div>
    </form>
  </div>  
</div>