<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$( document ).ready(function() {
	
	Ubi.setContainer(1,[1,2,3,4,5,6],"2U"); 
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	//공급업체등록
	
	layout.cells("b").attachObject("bootContainer");
	gridMain = subLayout.cells("a").attachGrid(); 
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");      
	gridMain.setHeader("공급업체코드, 공급업체명, 사업자번호", null, 
					["text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,");       
	gridMain.setColAlign("left,left,left");     
	gridMain.setColTypes("ro,ro,ro"); 
	gridMain.setColSorting("str,str,str");
	gridMain.init();   
	
	subLayout.cells("a").setWidth("303");
	
	subLayout.cells("b").attachObject("bootContainer2");
})
function fn_search(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
	
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-3 col-md-3 control-label" for="textinput"> 
					공급업체코드
					 </label>
					<div class="col-sm-2 col-md-2">
					    <input name="supplycomcode" id="supplycomcode" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
					공급업체명 
					</label>
					<div class="col-sm-4 col-md-4">
						<input name="supplycomname" id="supplycomname" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
				</div>
			</div>
		</div>
		
	</form>
	</div>
</div>
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%; ">
	<div class="container">
	
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px; ">
		<div class="row">
			<div class="form-group form-group-sm">
			    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				  공급업체코드 
				</label>
				<div class="col-sm-2 col-md-2">
				    <input name="supplCompCode" id="supplCompCode" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				공급업체명 
				</label>
				<div class="col-sm-4 col-md-4">
					<input name="supplCompName" id="supplCompName" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				  주민번호 
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="compCeoNo" id="compCeoNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				대표자명
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="compCeoName" id="compCeoName" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				사업자등록번호
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="compRegiNo" id="compRegiNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput">
				   법인번호 
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="compCorpNo" id="compCorpNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				 업태 
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="compJob" id="compJob" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				종목
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="compBizType" id="compBizType" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				우편번호
				 </label>
				<div class="col-sm-2 col-md-2">
					<div class="col-sm-9 col-md-9">
						<input name="postNo" id="postNo" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<div class="col-sm-3 col-md-3">
							<button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('','common/zipCodePOP')">
							  <span class="glyphicon glyphicon-search"></span>
							</button>
					  </div>
			    </div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				주소구분 
				</label>
				<div class="col-sm-3 col-md-3">
					<div class="col-sm-4 col-md-4">
					  <input type="radio" name="postGbn" id="postGbn" value="도로명" checked="checked">도로명
					</div>
				    <div class="col-sm-5 col-md-5">
					   <input type="radio" name="postGbn" id="postGbn" value="지번">지번
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				주소(도로명)
				</label>
				<div class="col-sm-8 col-md-8">
					<input name="addrNew" id="addrNew" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				주소(지번) 
				</label>
				<div class="col-sm-8 col-md-8">
					<input name="addrOld" id="addrOld" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				전화번호 
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="phoneNo" id="phoneNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput">
				 이메일
				 </label>
				<div class="col-sm-4 col-md-4">
					<input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				팩스번호
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="faxNo" id="faxNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput">
				 홈페이지
			    </label>
				<div class="col-sm-4 col-md-4">
					<input name="homePage" id="homePage" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				 거래여부
				</label>
				<div class="col-sm-3 col-md-3">
					<div class="col-sm-4 col-md-4">
					  <input type="radio" name="dealGbn" id="dealGbn" value="거래" checked="checked">거래
					</div>
				    <div class="col-sm-5 col-md-5">
					   <input type="radio" name="dealGbn" id="dealGbn" value="거래중지">거래중지
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
						<table class="table table-bordered" style="text-align: center;">
						
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
						 
					  </table>
				   </div>
			   </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class="col-sm-2 col-md-2 control-label" for="textinput"> 
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
