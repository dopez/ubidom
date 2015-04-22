<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(2,[3,4,8],"1C");
	//퇴직정산
	layout = Ubi.getLayout(); 
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
   	subLayout.cells("a").attachObject("bootContainer2");
});
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_excel(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
	     <div class="form-group form-group-sm">
		    <div class="col-sm-8 col-md-8">
			   <div class="col-sm-2 col-md-2">
			     <input type="button" name="tiriR" id="tiriR" class="form-control btn btn-default btn-xs" value="퇴직금자료조회">
			   </div>
			   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			    퇴직사원번호
			   </label>
			   <div class="col-sm-2 col-md-2">
			       <input name="tiriNo" id="tiriNo" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('사원','common/seqNoPOP')">
			   </div>
			   <div class="col-sm-2 col-md-2">
			     <input type="button" name="tiriR" id="tiriR" class="form-control btn btn-default btn-xs" value="과세이연자료적용">
			   </div>
		    </div>
	     </div>
	 </div>
	 <div class="row">
	     <div class="form-group form-group-sm">
		    <div class="col-sm-8 col-md-8">
			   <div class="col-sm-2 col-md-2">
			     <input type="button" name="tsdt" id="tsdt" class="form-control btn btn-default btn-xs" value="퇴직금산출자료">
			   </div>
			   <div class="col-sm-2 col-md-2">
			     <input type="button" name="syif" id="syif" class="form-control btn btn-default btn-xs" value="상여상세정보">
			   </div>
			   <label class="col-sm-6 col-md-6 control-label" for="textinput">
			    *퇴직정산일을 변경하시면 퇴지금 계산이 됩니다.
			   </label>
		    </div>
	     </div>
	 </div>
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%;">
  <div class="container">	
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
		<div class="row">
			<div class="form-group form-group-sm">
			    <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				  사원명 
				</label>
				<div class="col-sm-1 col-md-1">
				    <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<div class="col-sm-2 col-md-2">
				  <label class="col-sm-7 col-md-7 control-label" for="textinput"> 
			 	   작업기준일 
				  </label>
				  <div class="col-sm-5 col-md-5">
					<input name="jdate" id="jdate" type="text" value="" placeholder="" class="form-control input-xs">
				  </div>
				</div>
				<label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				퇴직구분 
				</label>
				<div class="col-sm-1 col-md-1">
					<select name="tgubn" id="tgubn" class="form-control input-xs">
					 <option value="중간정산">중간정산</option>
					 <option value="퇴직">퇴직</option>
					</select>
				</div>
				<div class="col-sm-3 col-md-3">
				   <label class="col-sm-4 col-md-4 control-label" for="textinput"> 
				   정산기간 
				   </label>
				   <div class="col-sm-8 col-md-8">
					  <div class="col-sm-3 col-md-3">
					    <input type="text" name="mjdate" id="mjdate" class="form-control input-xs" value="">
					  </div>
					  <label class="col-sm-5 col-md-5 control-label" for="textinput" style="text-align: left;"> 
				      (개월) 
				     </label>
				     <div class="col-sm-4 col-md-4">
					     <input type="text" name="mjhc" id="mjhc" class="form-control input-xs" value="">
				     </div>
				   </div>
				</div>
			</div>
	   </div>
	   <div class="row">
			<div class="form-group form-group-sm">
			    <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				  입사일자 
				</label>
				<div class="col-sm-1 col-md-1">
				    <input name="isdate" id="isdate" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<div class="col-sm-2 col-md-2">
				  <label class="col-sm-7 col-md-7 control-label" for="textinput"> 
				   퇴직정산일 
				  </label>
				  <div class="col-sm-5 col-md-5">
					<input name="tjdate" id="tjdate" type="text" value="" placeholder="" class="form-control input-xs">
				  </div>
				</div>
				<div class="col-sm-3 col-md-3 col-sm-offset-2 col-md-offset-2">
				   <label class="col-sm-4 col-md-4 control-label" for="textinput"> 
				   재직기간 
				   </label>
				   <div class="col-sm-8 col-md-8">
					  <div class="col-sm-3 col-md-3">
					    <input type="text" name="jjdate" id="jjdate" class="form-control input-xs" value="">
					  </div>
					  <label class="col-sm-9 col-md-9 control-label" for="textinput" style="text-align: left;"> 
				      (개월) 
				     </label>
				   </div>
				</div>
			</div>
	   </div>
	   <div class="col-sm-6 col-md-6">
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				   급여 
				 </label>
				 <label class="col-sm-2 col-md-2 control-label" for="textinput" style="text-align: center;"> 
				  1개월 
				 </label>
				 <label class="col-sm-2 col-md-2 control-label" for="textinput" style="text-align: center;"> 
				  2개월
				 </label>
				 <label class="col-sm-2 col-md-2 control-label" for="textinput" style="text-align: center;"> 
				  3개월
				 </label>
				 <label class="col-sm-2 col-md-2 control-label" for="textinput" style="text-align: center;"> 
				  4개월 
				 </label>
			 </div>
	      </div>
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				   시작일 
				 </label>
				 <div class="col-sm-2 col-md-2">
					<input name="onest" id="onest" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="twst" id="twst" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="thst" id="thst" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="frst" id="frst" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>
	      </div>
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				   종료일 
				 </label>
				 <div class="col-sm-2 col-md-2">
					<input name="oneet" id="oneet" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="twet" id="twet" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="thet" id="thet" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="fret" id="fret" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>
	      </div>
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				   기본급 
				 </label>
				 <div class="col-sm-2 col-md-2">
					<input name="oneetn" id="oneetn" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="twetn" id="twetn" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="thetn" id="thetn" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="fretn" id="fretn" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>
	      </div>
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				   제수당 
				 </label>
				 <div class="col-sm-2 col-md-2">
					<input name="onejs" id="onejs" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="twjs" id="twjs" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="thjs" id="thjs" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<input name="frjs" id="frjs" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>
	      </div>
	      <div class="row">
		    <div class="form-group form-group-sm">
			    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				   상여합계 
			   	 </label>
				 <div class="col-sm-2 col-md-2 col-sm-offset-6 col-md-offset-6">
				    <input name="sysum" id="sysum" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
		     </div>
	     </div> 
	     <div class="row">
		    <div class="form-group form-group-sm">
			    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				  연차 
			   	</label>
				<div class="col-sm-2 col-md-2 col-sm-offset-6 col-md-offset-6">
				    <input name="yearEnd" id="yearEnd" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
		    </div>
	     </div>	 
	   </div>
	   <div class="col-sm-6 col-md-6">
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <div class="col-sm-12 col-md-12" style="text-align: left; height: 120px;"> 
				  <br><br>
				   *소급분은 기본급,제수당에<br>
				   포함 안됨! 소급분을 포함해야할 경우<br>
				   해당 개월에 기본급 제수당을<br>
				   직접 수정함!!!!<br>
				 </div>
			 </div>
	      </div>
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				   급여 합
				 </label>
				 <div class="col-sm-2 col-md-2">
					<input name="onejs" id="onejs" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>
	      </div>
	      <div class="row">
			  <div class="form-group form-group-sm">
			     <div class="col-sm-12 col-md-12" style="height: 54px;"> 
				 </div>
			 </div>
	      </div>
	   </div>
	   <div class="row">
		   <div class="form-group form-group-sm">
			  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				 일평균임금 
			   </label>
			   <label class="col-sm-3 col-md-3 control-label" for="textinput" style="text-align: left;"> 
				  급여합계/정산일+((상여+년차)/12*3/정산일) 
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="yearEnd" id="yearEnd" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			 </div> 
	    </div>
	    <div class="row">
		   <div class="form-group form-group-sm">
			  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				 산출퇴직금 
			   </label>
			    <div class="col-sm-1 col-md-1">
				   <input name="caltiri" id="caltiri" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				  추가퇴직금
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="yearEnd" id="yearEnd" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			 </div> 
	    </div>
	    <div class="row">
		   <div class="form-group form-group-sm">
			  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				 퇴직소득공제액 
			   </label>
			    <div class="col-sm-1 col-md-1">
				   <input name="caltiri" id="caltiri" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				  퇴직소득과세표준
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="yearEnd" id="yearEnd" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			 </div> 
	    </div>
	    <div class="row">
		   <div class="form-group form-group-sm">
			  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				 연평균산출세액 
			   </label>
			    <div class="col-sm-1 col-md-1">
				   <input name="yscm" id="yscm" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				  연평균과세표준
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="ystan" id="ystan" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			 </div> 
	    </div>
	    <div class="row">
		   <div class="form-group form-group-sm">
			  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				 중간지급기간 
			   </label>
			    <div class="col-sm-1 col-md-1">
				   <input name="jgjst" id="jgjst" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<div class="col-sm-1 col-md-1">
				   <input name="jgjed" id="jgjed" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				  중간퇴직소득
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="jtsd" id="jtsd" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			 </div> 
	    </div>
	    <div class="row">
		    <div class="form-group form-group-sm">
			   <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 중간지급 
			   	</label>
				 <div class="col-sm-1 col-md-1">
				    <div class="col-sm-6 col-md-6">
				       <input name="j1" id="j1" type="text" value="" placeholder="" class="form-control input-xs">
				    </div>
				    <div class="col-sm-6 col-md-6">
				       <input name="j2" id="j2" type="text" value="" placeholder="" class="form-control input-xs">
				    </div>   
				 </div>
				 <div class="col-sm-1 col-md-1 col-sm-offset-5 col-md-offset-5">
				   <input name="j8" id="j8" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j9" id="j9" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>  
		 </div>
	    
	    <div class="row">
		    <div class="form-group form-group-sm">
			   <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 13년이전 
			   	</label>
				 <div class="col-sm-1 col-md-1">
				    <div class="col-sm-6 col-md-6">
				       <input name="j1" id="j1" type="text" value="" placeholder="" class="form-control input-xs">
				    </div>
				    <div class="col-sm-6 col-md-6">
				       <input name="j2" id="j2" type="text" value="" placeholder="" class="form-control input-xs">
				    </div>   
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j3" id="j3" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1 col-sm-offset-2 col-md-offset-2">
				   <input name="j6" id="j6" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j7" id="j7" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j8" id="j8" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j9" id="j9" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>  
		 </div>
	    <div class="row">
		    <div class="form-group form-group-sm">
			   <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 13년이후 
			   	</label>
				 <div class="col-sm-1 col-md-1">
				    <div class="col-sm-6 col-md-6">
				       <input name="j1" id="j1" type="text" value="" placeholder="" class="form-control input-xs">
				    </div>
				    <div class="col-sm-6 col-md-6">
				       <input name="j2" id="j2" type="text" value="" placeholder="" class="form-control input-xs">
				    </div>   
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j3" id="j3" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j4" id="j4" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j5" id="j5" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j6" id="j6" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j7" id="j7" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j8" id="j8" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
				   <input name="j9" id="j9" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
			 </div>  
		 </div>
		 <div class="row">
		   <div class="form-group form-group-sm">
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 퇴직금액 
			   </label>
			    <div class="col-sm-1 col-md-1">
				   <input name="tjgjm" id="tjgjm" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			   <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				  퇴직환금
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="tjgjhg" id="tjgjhg" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				  복지자금
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="life" id="life" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-2 col-md-2 control-label" for="textinput" style="text-align: center;"> 
				  의료보험정산납부금
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="menab" id="menab" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			 </div> 
	    </div>
	    <div class="row">
		   <div class="form-group form-group-sm">
			  <label class="col-sm-2 col-md-2 col-sm-offset-1 col-md-offset-1 control-label" for="textinput"> 
				 이전년도연차수당 
			   </label>
			    <div class="col-sm-1 col-md-1">
				   <input name="legdate" id="legdate" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			   <label class="col-sm-2 col-md-2 col-sm-offset-2 col-md-offset-2 control-label" for="textinput"> 
				  퇴직금실수령액
			   	</label>
				<div class="col-sm-1 col-md-1">
				   <input name="tissm" id="tissm" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			 </div> 
	    </div>
	</form>	    
  </div>	
</div>