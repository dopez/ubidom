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
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,설비코드,설비명,사용공정",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100");
	gridMain.setColAlign("center,left,left,left");
	gridMain.setColTypes("ron,ro,ro,ro");
	gridMain.setColSorting("int,str,str,str");
	gridMain.init();	
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	subLayout.cells("a").setWidth(400);
	subLayout.cells("b").attachObject("bootContainer2");
	
	calMain = new dhtmlXCalendarObject([{input:"buyDate",button:"calpicker1"},{input:"regDate",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("buyDate").value = t;
	byId("regDate").value = t;
		
	toolbar.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			gridMain.addRow(gridMain.getUID(),"1,,,",1);
		   }
		});
		
	function doOnRowDblClicked(rowId,colId){
		if(colId==1){
			gfn_big_load_popup(423,400,'점검항목','prod1/inspPOP');
		}
		if(colId==2){
			gfn_big_load_popup(503,400,'소모성부품이력등록','prod1/compHistoryPOP');
		}
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">      
         <div class="row">
	        <div class="form-group form-group-sm">
		       <div class="col-sm-8 col-md-8">
			      <label class="col-sm-2 col-md-2 control-label" for="textinput">
			       설비코드
			      </label>
			      <div class="col-sm-2 col-md-2">
			        <input name="code" id="code" type="text" value="" placeholder="" class="form-control input-xs">
			      </div>
			      <label class="col-sm-2 col-md-2 control-label" for="textinput">
			       거래처
			      </label>
			      <div class="col-sm-2 col-md-2">
			         <input name="customer" id="customer" type="text" value="" placeholder="" class="form-control input-xs">
			      </div>
			      <div class="col-sm-2 col-md-2" style="margin-left: 5px;">
		           <button type="button"  class="btn btn-default form-control" name="btnImage" id="btnImage">설비 이미지정보</button>
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
          <div class="row">
	         <div class="form-group form-group-sm">
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         설비코드
		        </label>
		        <div class="col-sm-2 col-md-2">
			       <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		          설비명
		        </label>
		        <div class="col-sm-2 col-md-2">
			      <input name="equiName" id="equiName" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
	         </div>
	      </div>
          <div class="row">
	         <div class="form-group form-group-sm">
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         규격
		        </label>
		        <div class="col-sm-6 col-md-6">
			      <input name="standard" id="standard" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
	        </div>
	     </div>
	     <div class="row">
	         <div class="form-group form-group-sm">
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		          전화번호
		        </label>
		        <div class="col-sm-2 col-md-2">
			      <input name="phone" id="phone" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         이미지첨부
		        </label>
		        <div class="col-sm-2 col-md-2">
			      <input name="imageFile" id="imageFile" type="file" value="" placeholder="" >
		        </div>
	         </div>
	     </div>
	     <div class="row">
	        <div class="form-group form-group-sm">
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         용량
		       </label>
		       <div class="col-sm-2 col-md-2">
			      <input name="capacity" id="capacity" type="text" value="" placeholder="" class="form-control input-xs">
		       </div>
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        HP번호
		      </label>
		      <div class="col-sm-2 col-md-2">
			     <input name="handPhone" id="handPhone" type="text" value="" placeholder="" class="form-control input-xs">
		     </div>
	       </div>
	    </div>
	    <div class="row">
	       <div class="form-group form-group-sm">
		      <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       구입금액
		      </label>
		      <div class="col-sm-2 col-md-2">
			     <input name="buyMoney" id="buyMoney" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
		      <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        담당자
		      </label>
		      <div class="col-sm-2 col-md-2">
			    <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
	       </div>
	    </div>
	    <div class="row">
	       <div class="form-group form-group-sm">
		      <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        사용공정
		      </label>
		      <div class="col-sm-2 col-md-2">
			     <input name="useProcess" id="useProcess" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
		      <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        구입일자
		      </label>
		       <div class="col-sm-2 col-md-2">
                  <div class="col-sm-11 col-md-11">
                     <input name="buyDate" id="buyDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-1 col-md-1">
                      <input type="button" id="calpicker1" class="calicon form-control input-xs">
                  </div>              
               </div> 
	       </div>
	   </div>
	   <div class="row">
	       <div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       공급업체
		     </label>
		     <div class="col-sm-2 col-md-2">
			    <input name="supplyCom" id="supplyCom" type="text" value="" placeholder="" class="form-control input-xs">
		     </div>
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       등록일자
		     </label>
		     <div class="col-sm-2 col-md-2">
                  <div class="col-sm-11 col-md-11">
                     <input name="regDate" id="regDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                   <div class="col-sm-1 col-md-1">
                       <input type="button" id="calpicker2" class="calicon form-control input-xs">
                  </div>              
             </div> 
	     </div>
	  </div>
	  <div class="row">
	     <div class="form-group form-group-sm">
		    <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       제작업체
		     </label>
		     <div class="col-sm-2 col-md-2">
			    <input name="makeCom" id="makeCom" type="text" value="" placeholder="" class="form-control input-xs">
		     </div>
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        사용유무
		     </label>
		     <div class="col-sm-2 col-md-2">
		        <select name="useCheck" id="useCheck" class="form-control input-xs">
		          <option value="Y">Y</option>
		          <option value="N">N</option>
		        </select>
		     </div>
	     </div>
	 </div>
	 <div class="row">
	     <div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       사용중지사유
		     </label>
		     <div class="col-sm-6 col-md-6">
			   <input name="useStop" id="useStop" type="text" value="" placeholder="" class="form-control input-xs">
		    </div>
	     </div>
	  </div>
    </form>
  </div>  
</div>