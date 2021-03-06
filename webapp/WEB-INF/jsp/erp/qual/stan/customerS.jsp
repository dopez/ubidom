<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"2U"); 
	//고객등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("고객코드,고객명,사업자번호",null,
			          ["text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100");
	gridMain.setColAlign("left,left,left");
	gridMain.setColTypes("ro,ro,ro");
	gridMain.setColSorting("str,str,str");
	gridMain.init();	
	subLayout.cells("a").setWidth(300);
	
	subLayout.cells("b").attachObject("bootContainer2");

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
			 고객코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="customCode" id="customCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 고객명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="customName" id="customName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     고객코드
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="customCode" id="customCode" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     고객명
		   </label>
		   <div class="col-sm-4 col-md-4">
			  <input name="customName" id="customName" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	   </div>
	 </div>
	 <div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     주민번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="jumin" id="jumin" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     대표자명
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="representative" id="representative" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     사업자등록번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="businessNum" id="businessNum" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     법인번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="corporateBodyNum" id="corporateBodyNum" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     업태
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="jobType" id="jobType" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     종목
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="jobBranch" id="jobBranch" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     우편번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="zipCode" id="zipCode" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     주소구분
		   </label>
		   <div class="col-sm-3 col-md-3">
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="addrGubn" id="addrGubn" value="도로명"  checked="checked">도로명
			  </div>
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="addrGubn" id="addrGubn" value="지번">지번
			  </div>
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     주소(도로명)
		   </label>
		   <div class="col-sm-8 col-md-8">
			  <input name="addrRoadName" id="addrRoadName" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     주소(지번)
		   </label>
		   <div class="col-sm-8 col-md-8">
			  <input name="addrJibun" id="addrJibun" type="text" value="" placeholder="" class="form-control input-xs">
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
		     이메일
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="email" id="email" type="email" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     팩스번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="fax" id="fax" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     홈페이지
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="homePage" id="homePage" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     거래여부
		   </label>
		   <div class="col-sm-3 col-md-3">
			 <div class="col-sm-4 col-md-4">
			    <input type="radio" name="deal" id="deal" value="거래"  checked="checked">거래
			  </div>
			  <div class="col-sm-5 col-md-5">
			    <input type="radio" name="deal" id="deal" value="거래중지">거래중지
			  </div>
		   </div>
	  </div>
	</div>
	<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				담당자 정보 
				</label>
				<div class="col-sm-8 col-md-8">	
					<div class="table-responsive">
						<table class="table table-striped table-bordered" style="text-align: center;">
						<tbody>
						  <tr>
							<td>이름</td>
							<td>직책</td>
							<td>소속</td>
							<td>HP번호</td>
							<td>전화</td>
							<td>이메일</td>
							<td>중지일자</td>
							<td>비고</td>
						</tr>
						</tbody>
						  <tbody>
							 <tr>
								<td>김지훈</td>
								<td>사원</td>
								<td>연구개발팀</td>
								<td>010-0000-0000</td>
								<td>000-0000-0000</td>
								<td>abcd@ubidom.com</td>
								<td>2015/03/25</td>
								<td>.</td>
							 </tr>
							 <tr>
								<td>김지훈</td>
								<td>사원</td>
								<td>연구개발팀</td>
								<td>010-0000-0000</td>
								<td>000-0000-0000</td>
								<td>abcd@ubidom.com</td>
								<td>2015/03/25</td>
								<td>.</td>
							 </tr>
							  <tr>
								<td>김지훈</td>
								<td>사원</td>
								<td>연구개발팀</td>
								<td>010-0000-0000</td>
								<td>000-0000-0000</td>
								<td>abcd@ubidom.com</td>
								<td>2015/03/25</td>
								<td>.</td>
							</tr>
						 </tbody>
					  </table>
				   </div>
			   </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				구분 
				</label>
				<div class="col-sm-10 col-md-10">
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="1" checked="checked">매출
					</div>
					<div class="col-sm-1 col-md-1">
					    <input type="checkbox" name="empGbn_group1" value="2">매입
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="3">외주
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="4">금융
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="5">품질
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="6">총무
					</div>
					<div class="col-sm-2 col-md-2">
						<input type="checkbox" name="empGbn_group1" value="7">Buyer
					</div>
				</div>
			</div>
		</div>
  </form>
 </div> 
</div>