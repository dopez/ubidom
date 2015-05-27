<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C"); 
	//설비사용예약현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,설비코드,사용일자,사용자,8시,#cspan,9시,#cspan,10시,#cspan,"+
			            "11시,#cspan,12시,#cspan,13시,#cspan,14시,#cspan,15시,#cspan,"+
		            	"16시,#cspan,17시,#cspan,18시,#cspan,19시,#cspan,20시,#cspan,"+
			            "21시,#cspan,22시,#cspan,23시,#cspan,24시,#cspan,1시,#cspan,"+
			            "2시,#cspan,3시,#cspan,4시,#cspan,5시,#cspan,6시,#cspan,"+
			            "7시,#cspan",null,
			           ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,30,30,30,30,30,30,,"+
			                "30,30,30,30,30,30,30,30,30,30,"+
			                "30,30,30,30,30,30,30,30,30,30,"+
			                "30,30,30,30,30,30,30,30,30,30,"+
			                "30,30,30,30,30,30,30,30,30,30,"+
			                "30,30");
	gridMain.setColAlign("center,left,center,left,right,right,right,right,right,right,"+
			              "right,right,right,right,right,right,right,right,right,right,"+
			              "right,right,right,right,right,right,right,right,right,right,"+
			              "right,right,right,right,right,right,right,right,right,right,"+
			              "right,right,right,right,right,right,right,right,right,right,"+
			              "right,right");
	gridMain.setColTypes("ron,ro,ro,ro,ch,ch,ch,ch,ch,ch,"+
			              "ch,ch,ch,ch,ch,ch,ch,ch,ch,ch,"+
			              "ch,ch,ch,ch,ch,ch,ch,ch,ch,ch,"+
			              "ch,ch,ch,ch,ch,ch,ch,ch,ch,ch,"+
			              "ch,ch,ch,ch,ch,ch,ch,ch,ch,ch,"+
			              "ch,ch");
	gridMain.setColSorting("int,str,date,str,na,na,na,na,na,na,"+
			                "na,na,na,na,na,na,na,na,na,na,"+
			                "na,na,na,na,na,na,na,na,na,na,"+
			                "na,na,na,na,na,na,na,na,na,na,"+
			                "na,na,na,na,na,na,na,na,na,na,"+
			                "na,na");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
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
				 기간 
				</label>
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
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  설비코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('설비코드','common/equiCodePOP')">
			</div>
		  </div>
	  </div>
	</div>
  </form>
  </div>
</div>