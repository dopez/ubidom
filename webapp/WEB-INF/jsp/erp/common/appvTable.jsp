<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="empNo" value="${sessionScope.empNo}"></c:set>
    <style>
        table {
            text-align: center;
            vertical-align: middle;
        }
    </style>
    
    <script type="text/javascript">
    	var btnEvt = "";
    
	   	$(document).ready(function(){
	   		$("#sttleEmp2Btn, #sttleEmp3Btn, #sttleEmp4Btn").click(function(){
	   			btnEvt = "";
	   			btnEvt = this.id;
	   			
	   			if(btnEvt == "sttleEmp4Btn"){
					if($("#sttleSelectBox4 option:selected").val() == "5"){
	  					alert("전결 상태에서는 선택 할 수 없습니다.");
	  					return false; 						
	  				}	   				   				
	   			}

	   			gfn_load_pop('w1', 'common/empPOP', true, {"korName": ""});
	   			
	   		});    
	   		/* 임시 주석처리
			if("${empNo}" != empNo){
   				$("#sttleKorName2").attr("disabled", "disabled");
   				$("#sttleSelectBox2").attr("disabled", "disabled");
   				$("#sttleEmp2Btn").attr("disabled", "disabled");
				$("#sttleKorName3").attr("disabled", "disabled");
				$("#sttleSelectBox3").attr("disabled", "disabled");
				$("#sttleEmp3Btn").attr("disabled", "disabled");
   				$("#sttleKorName4").attr("disabled", "disabled");
   				$("#sttleSelectBox4").attr("disabled", "disabled");
   				$("#sttleEmp4Btn").attr("disabled", "disabled");
			} */ 
	   	})
    </script>

    <table class="table table-bordered">
        <tr>
            <td id="appv" rowspan="2">
                	결
                <br>
                <br>재
            </td>
            <td id="appv">작성</td>
            <td id="appv">검토</td>
            <td id="appv">검토</td>
            <td id="appv">승인</td>
        </tr>
        <tr>
            <td id="appv" class="col-md-3">
            	<span style="text-align: center; font-weight: bold;"><c:out value="${empNo}"></c:out></span>
            	<input type="hidden" name="sttleEmp1" id="sttleEmp1" value="${empNo}">
                <%-- <div class="col-sm-8 col-md-8 appvBottomPadding">
                    <input name="sttleEmp1" id="sttleEmp1" type="text" value="${empNo}" placeholder="" class="form-control input-xs">
                </div>
                <div class="col-sm-4 col-md-4">
                    <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
                <div>
                    <select class="form-control input-xs">
                        <option>결재</option>
                        <option>미결</option>
                        <option>전결</option>
                        <option>부결</option>
                    </select>
                </div> --%>
            </td>
            <td id="appv" class="col-md-3">
                <div class="col-sm-8 col-md-8 appvBottomPadding">
                    <input name="sttleKorName2" id="sttleKorName2" type="text" value="" placeholder="" class="form-control input-xs">
                    <input type="hidden" name="sttleEmp2" id="sttleEmp2" value="">
                </div>
                <div class="col-sm-4 col-md-4">
                    <button type="button" class="btn btn-default form-control" name="sttleEmp2Btn" id="sttleEmp2Btn">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
                <div>
                    <select id="sttleSelectBox2" name="sttleSelectBox2" class="form-control input-xs">
                    	<option value="1">결재</option>
                        <option value="0" selected="selected">미결</option>
                        <option value="5">전결</option>
                        <option value="9">부결</option>
                    </select>
                </div>
            </td>
            <td id="appv" class="col-md-3">
                <div class="col-sm-8 col-md-8 appvBottomPadding">
                    <input name="sttleKorName3" id="sttleKorName3" type="text" value="" placeholder="" class="form-control input-xs">
                    <input type="hidden" name="sttleEmp3" id="sttleEmp3" value="">
                </div>
                <div class="col-sm-4 col-md-4">
                    <button type="button" class="btn btn-default form-control" name="sttleEmp3Btn" id="sttleEmp3Btn">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
                <div style="display: none;">
                    <select id="sttleSelectBox3" name="sttleSelectBox3" class="form-control input-xs">
                    	<option value="1">결재</option>
                        <option value="0" selected="selected">미결</option>
                        <option value="5">전결</option>
                        <option value="9">부결</option>
                    </select>
                </div>
            </td>
            <td id="appv" class="col-md-3">
                <div class="col-sm-8 col-md-8 appvBottomPadding">
                    <input name="sttleKorName4" id="sttleKorName4" type="text" value="" placeholder="" class="form-control input-xs">
                    <input type="hidden" name="sttleEmp4" id="sttleEmp4" value="">
                </div>
                <div class="col-sm-4 col-md-4">
                    <button type="button" class="btn btn-default form-control" name="sttleEmp4Btn" id="sttleEmp4Btn">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
                <div>
                    <select id="sttleSelectBox4" name="sttleSelectBox4" class="form-control input-xs">
                    	<option value="1">결재</option>
                        <option value="0" selected="selected">미결</option>
                        <option value="5">전결</option>
                        <option value="9">부결</option>
                    </select>
                </div>
            </td>
        </tr>
    </table>