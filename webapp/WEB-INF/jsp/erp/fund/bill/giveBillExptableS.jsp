<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1],"1C");
	//지급어음만기상환전표생성
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	layout.cells("b").setHeight(174);
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("선택,발행일,발행은행,어음번호,어음금액,만기일,비고,거래처,계정명,전표일자(발행일),"+
			           "전표No(발행일),전표일자(만기일),전표No(만기일),결제계좌번호",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100,100,100,100");
	gridMain.setColAlign("center,center,left,left,right,center,left,left,left,center,"+
	                     "center,center,center,left");
	gridMain.setColTypes("ra,ro,ro,ro,ron,ro,ro,ro,ro,ro,"+
	                     "ro,ro,ro,ro");
	gridMain.setColSorting("na,date,str,str,int,date,str,str,str,date,"+
	                       "date,date,date,str");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"biDate",button:"calpicker1"},{input:"jpDate",button:"calpicker2"},
	                                    {input:"stDate",button:"calpicker3"},{input:"edDate",button:"calpicker4"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
	byId("stDate2").value = t;
	byId("edDate2").value = t;
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
			    조회구분
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <div class="col-sm-6 col-md-6">
	               <input type="radio" name="sgubn" id="sgubn" value="1" checked="checked">발행일	     
 			     </div>
 			     <div class="col-sm-6 col-md-6">
	               <input type="radio" name="sgubn" id="sgubn" value="2">만기일	     
 			     </div>
			   </div>
		    </div>
	     </div>
	  </div> 
      <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
			      <label class="col-sm-2 col-md-2 control-label" for="textinput">
				    기간 
				  </label>	
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker3" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-2 col-md-2 control-label" for="textinput" style="text-align: center;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker4" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
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
			     발의일자 
			</label>
		    <div class="col-sm-2 col-md-2">
                <div class="col-sm-10 col-md-10">
                     <input name="biDate" id="biDate" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
                <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker1" class="calicon form-control">
                </div>              
            </div>
		 </div>
	  </div>
	</div>
	 <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		    <label class="col-sm-2 col-md-2 control-label" for="textinput">
			     전표일자 
			</label>
		    <div class="col-sm-2 col-md-2">
               <div class="col-sm-10 col-md-10">
                     <input name="jpDate" id="jpDate" type="text" value="" placeholder="" class="form-control input-xs">
               </div>
               <div class="col-sm-2 col-md-2">
                      <input type="button" id="calpicker2" class="calicon form-control">
               </div>              
             </div>
		 </div>
	  </div>
	</div>
     <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 생성여부
			 </label>
            <div class="col-sm-3 col-md-3">
			     <div class="col-sm-6 col-md-6">
	               <input type="radio" name="ssgubn" id="sㄴgubn" value="1" checked="checked">미생성	     
 			     </div>
 			     <div class="col-sm-6 col-md-6">
	               <input type="radio" name="ssgubn" id="ssgubn" value="2">생성	     
 			     </div>
			</div>
			<div class="col-sm-2 col-md-2">
			   <input type="button" name="jbsave" id="jbsave" value="발행전표생성" class="form-control btn btn-default btn-xs">
			</div>
			<div class="col-sm-2 col-md-2">
			   <input type="button" name="jbcancel" id="jbcancel" value="발행전표취소" class="form-control btn btn-default btn-xs">
			</div>
		 </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>