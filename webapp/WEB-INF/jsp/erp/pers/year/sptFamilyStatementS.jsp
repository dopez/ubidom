<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tableinput{
width: 70px;
}
</style>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,4,5,8],"2U");
	//부양가족공제명세서등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,사번,성명,부서,직위",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left");
	gridMain.setColTypes("ron,ro,ro,ro,ro");
	gridMain.setColSorting("int,str,str,str,str");
	gridMain.init();		
	subLayout.cells("a").setWidth(503);
	subLayout.cells("b").attachObject("bootContainer2");

	var t = new Date().getFullYear();
	byId("stDate").value = t;
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
			    구분
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			       <option value="연말정산">연말정산</option>
			       <option value="퇴직정산">퇴직정산</option>
			     </select>
			   </div>
			    <div class="col-sm-1 col-md-1">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
		    </div>
	     </div>
	 </div>
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			    부서
			 </label>
			 <div class="col-sm-2 col-md-2">
			    <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			 </div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput">
			    성명
			 </label>
			 <div class="col-sm-2 col-md-2">
			    <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			 </div>
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
			     기본자료
			  </label>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		     <div class="col-sm-2 col-md-2">
                <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     인정상여(+)
			    </label>
			    <div class="col-sm-5 col-md-5">
			      <input type="text" name="ijsy" id="ijsy" value="" placeholder="" class="form-control input-xs">
			    </div>
		     </div>
		     <div class="col-sm-2 col-md-2">
		        <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     국외근로(+)
			  </label>
			  <div class="col-sm-5 col-md-5">
			    <input type="text" name="ijsy" id="ijsy" value="" placeholder="" class="form-control input-xs">
			  </div>
		     </div>
		     <div class="col-sm-2 col-md-2">
		        <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     거주구분
			  </label>
			  <div class="col-sm-5 col-md-5">
			    <select name="gj" id="gj" class="form-control input-xs">
			      <option value="거주자">거주자</option>
			      <option value="비거주자">비거주자</option>
			    </select>
			  </div>
		     </div>
		     <div class="col-sm-2 col-md-2">
		       <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     내/외국구분
			   </label>
			   <div class="col-sm-5 col-md-5">
			    <select name="ny" id="ny" class="form-control input-xs">
			      <option value="내국인">내국인</option>
			      <option value="외국인">외국인</option>
			    </select>
			   </div>
		     </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		     <div class="col-sm-2 col-md-2">
		       <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     거주지국
			  </label>
			  <div class="col-sm-5 col-md-5">
			    <select name="gjj" id="gjj" class="form-control input-xs">
			      <option value="한국">한국</option>
			      <option value="일본">일본</option>
			    </select>
			  </div>
		     </div>
		     <div class="col-sm-2 col-md-2">
		       <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     국적
			  </label>
			  <div class="col-sm-5 col-md-5">
			    <select name="nt" id="nt" class="form-control input-xs">
			      <option value="한국">한국</option>
			      <option value="일본">일본</option>
			    </select>
			  </div>
		     </div>
		     <div class="col-sm-2 col-md-2">
		       <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     세대주여부
			  </label>
			  <div class="col-sm-5 col-md-5">
			    <input type="checkbox" name="sdj" id="sdj" value="y">
			  </div>
		     </div>
		     <div class="col-sm-2 col-md-2">
		       <label class="col-sm-7 col-md-7 control-label" for="textinput">
			     단일세율
			  </label>
			  <div class="col-sm-5 col-md-5">
			    <input type="checkbox" name="dsrate" id="dsrate" value="y">
			  </div>
		     </div>
		   </div>
 		 </div>
 		 <div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8 col-sm-offset-1 col-md-offset-1">	
					<div class="table-responsive">
						<table class="table table-striped table-bordered" style="text-align: center;">
						<tbody>
						  <tr>
							<td colspan="16" align="left">인적공제 및 소득/세액 공제 명세서  (외국인 단일세율 적용시 입력하지 마세요)</td>
						</tr>
						<tr>
							<td rowspan="2"></td>
							<td>관계</td>
							<td>성명</td>
							<td colspan="2">기본공제</td>
							<td>경로우대</td>
							<td rowspan="2">자료구분</td>
							<td colspan="2">보험료</td>
							<td rowspan="2">의료비</td>
							<td rowspan="2">교육비</td>
							<td colspan="5">신용가크 등 사용액</td>
						</tr>
						<tr>
							<td>내외국인</td>
							<td>주민번호</td>
							<td>부녀자</td>
							<td>학부모</td>
							<td>장애인</td>
							<td>건강/고용</td>
							<td>보장성</td>
							<td>신용카드</td>
							<td>직불카드 등</td>
							<td>현금영수증</td>
							<td>전통시장</td>
							<td>대중교통비</td>
						</tr>
						<tr>
							<td rowspan="2">▶</td>
							<td>
							  <select name="jgjs" id="jgjs" class="tableinput">
							   <option value="본인">본인</option>
							   <option value="직계존속(소득자)">직계존속(소득자)</option>
							   <option value="직계존속(배우자)">직계존속(배우자)</option>
							   <option value="배우자">배우자</option>
							   <option value="직계비속(자녀)">직계비속(자녀)</option>
							   <option value="직계비속(자녀외)">직계비속(자녀외)</option>
							  </select> 
							</td>
							<td>
							  <input type="text" name="jumin" id="jumin" class="tableinput">
							</td>
							<td colspan="2">
							  <input type="checkbox" name="stan" id="stan">
							</td>
							<td>
							 <input type="checkbox" name="ude" id="ude">
							</td>
							<td>국세청</td>
							<td>0</td>
							<td>
							  <input type="text" name="bojang" id="bojang" class="tableinput">
							</td>
							<td>
							  <input type="text" name="med" id="med" class="tableinput">
							</td>
							<td>
							  <input type="text" name="aca" id="aca" class="tableinput">
							</td>
							<td>
							 <input type="text" name="siy" id="siy" class="tableinput">
							</td>
							<td>
							  <input type="text" name="jib" id="jib" class="tableinput">
							</td>
							<td>
							  <input type="text" name="mon" id="mon" class="tableinput">
							</td>
							<td>
							  <input type="text" name="si" id="si" class="tableinput">
							</td>
							<td>
							  <input type="text" name="car" id="car" class="tableinput">
							</td>
						</tr>
						<tr>
							<td>
							  <select name="nys" id="nys" class="tableinput">
							    <option value="외국인">외국인</option>
							    <option value="내국인">내국인</option>
							  </select>
							</td>
							<td>
							  <input type="text" name="jumin" id="jumin" class="tableinput">
							</td>
							<td>
							  <input type="checkbox" name="bustan" id="bustan">
							</td>
							<td>
							  <input type="checkbox" name="bmstan" id="bmstan">
							</td>
							<td>
							  <select name="glud" id="glud" class="tableinput">
							    <option value="0">0.해당없음</option>
							    <option value="1">1.장애인복지법</option>
							    <option value="2">2.국가유공자</option>
							    <option value="3">3.중증환자</option>
							  </select>
							</td>
							<td>기타</td>
							<td>0</td>
							<td>
							  <input type="text" name="bojang" id="bojang" class="tableinput">
							</td>
							<td>
							  <input type="text" name="med" id="med" class="tableinput">
							</td>
							<td>
							  <input type="text" name="aca" id="aca" class="tableinput">
							</td>
							<td>
							 <input type="text" name="siy" id="siy" class="tableinput">
							</td>
							<td>
							  <input type="text" name="jib" id="jib" class="tableinput">
							</td>
							<td>
							</td>
							<td>
							  <input type="text" name="si" id="si" class="tableinput">
							</td>
							<td>
							  <input type="text" name="car" id="car" class="tableinput">
							</td>
						</tr>
						</tbody>	  
					  </table>
				   </div>
			   </div>
			</div>
		</div>
	</form>
  </div>	
</div>