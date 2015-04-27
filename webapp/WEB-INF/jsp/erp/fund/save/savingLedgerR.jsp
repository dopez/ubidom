<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"1C");
	//적금원장조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("가입일,만기일,예금종류,은행,계좌번호,월불입액,만기금액,이율,납입일,결제계좌번호,"+
			           "예금주",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100");
	gridMain.setColAlign("center,center,left,left,left,right,left,right,center,left,"+
	                     "left");
	gridMain.setColTypes("ro,ro,ro,ro,ro,ron,ron,ron,ro,ro,"+
	                     "ro");
	gridMain.setColSorting("date,date,str,str,str,int,int,int,date,str,"+
	                       "str");
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
				    1.가입기간 
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
				    2.만기기간 
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
			  3. 예금종류
			 </label>
			  <div class="col-sm-2 col-md-2">
			    <select name="ygBranch" id="ygBranch" class="form-control input-xs">
			      <option value="1">일반예금</option>
			      <option value="2">적금</option>
			      <option value="3">장기예금</option>
			      <option value="4">차입금</option>
			    </select>
			 </div>
		   </div>
	    </div>
	  </div>
	  <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 4.은행
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="bank" id="bank" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('은행','common/bankPOP')">
			</div>
			 <div class="col-sm-3 col-md-3">
			    <label class="col-sm-10 col-md-10 control-label" for="textinput">
			      미사용통장보기
			    </label>
			    <div class="col-sm-2 col-md-2">
			      <input name="nusebank" id="nusebank" type="checkbox" value="y">
			    </div>
			 </div>
			 <div class="col-sm-3 col-md-3">
				  <label class="col-sm-7 col-md-7 control-label" for="textinput">
				   조회순서
				 </label>
				 <div class="col-sm-5 col-md-5">
				  <input name="jhsun" id="jhsun" type="text" value="1-2-3-4"  disabled="disabled" class="form-control input-xs">
				  </div>
			 </div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>