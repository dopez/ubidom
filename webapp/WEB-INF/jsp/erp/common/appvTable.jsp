<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set var="empNo" value="${sessionScope.empNo}"></c:set>
<c:set var="empName" value="${sessionScope.empName}"></c:set> --%>
    <style>
        table {
            text-align: center;
            vertical-align: middle;
        }
    </style>
    
    <script type="text/javascript">
    	var btnEvt = "";
    	var empNo = "${empNo}";
	   	$(document).ready(function(){
	   		
	   		//버튼 클릭시 팝업 호출
	   		$("#settle2EmpBtn, #settle3EmpBtn, #settle4EmpBtn").click(function(){
	   			btnEvt = "";
	   			btnEvt = this.id;
	   			
	   			/* if(btnEvt == "settle4EmpBtn"){
					if($("#settleSelectBox4 option:selected").val() == "5"){
	  					alert("전결 상태에서는 선택 할 수 없습니다.");
	  					return false; 						
	  				}	   				   				
	   			} */

	   			gfn_load_pop('w1', 'common/empPOP', true, {"korName": ""});
	   			
	   		}); 
	   		
	   		//결제 인원 값 지웠을 때 발생 함수
	   		$("#settleKorName2, #settleKorName3, #settleKorName4").on("keyup", function(){
	   			var textIdrp = "";
	   			textIdrp = this.id.replace("settleKorName", "");
	   			var selectBoxId = "settleSelectBox"+textIdrp;
	   			
	   			if($(this).val() == ""){
   					$("#"+selectBoxId+" option").each(function(index){
						if($("#"+selectBoxId+" option").eq(index).val() == "5"){
							$("#"+selectBoxId+" option").eq(index).attr("selected", "selected");
						}
   					});
	   			}
	   		});
	   		
	   		//새로 생성하거나 수정 할 때 결제란 체크
	   		paymentCheck = function(){
	   			if($("#seqNo").val() == ""){
	            	$("#settle1Emp").val("${empNo}");
	       			$("#settleKorName1").text("${empName}");	 
	       			$("#settleSelectBox1").removeAttr("disabled");
	   				$("#settleSelectBox2").attr("disabled", "disabled");
	   				$("#settleSelectBox3").attr("disabled", "disabled");
	   				$("#settleSelectBox4").attr("disabled", "disabled");
					$("#settleKorName2").removeAttr("disabled");
	 				$("#settle2EmpBtn").removeAttr("disabled");	
					$("#settleKorName3").removeAttr("disabled");
	 				$("#settle3EmpBtn").removeAttr("disabled");	  
					$("#settleKorName4").removeAttr("disabled");
	 				$("#settle4EmpBtn").removeAttr("disabled");	  	 				
	   			}else{
	   				var settleSelected1 = $("#settleSelectBox1 option:selected").val();
	   				var settleSelected2 = $("#settleSelectBox2 option:selected").val();
	   				var settleSelected3 = $("#settleSelectBox3 option:selected").val();
	   				var settleSelected4 = $("#settleSelectBox4 option:selected").val();
	   				
	   				if(empNo == $("#settle1Emp").val()){
	   					if((settleSelected2 == "1" || settleSelected2 == "9") || (settleSelected3 == "1" || settleSelected3 == "9") 
	   							|| (settleSelected4 == "1" || settleSelected4 == "9")){
	   						$("#settleSelectBox1").attr("disabled", "disabled");
	   					}else{
	   						$("#settleSelectBox1").removeAttr("disabled");
	   					}
	   				}else{
	   					$("#settleSelectBox1").attr("disabled", "disabled");
	   				}
	   				if(empNo == $("#settle2Emp").val()){
	   					if((settleSelected1 == "0" || settleSelected1 == "9") || (settleSelected3 == "1" || settleSelected3 == "9") 
	   							|| (settleSelected4 == "1" || settleSelected4 == "9")){
	   						$("#settleSelectBox2").attr("disabled", "disabled");
	   						$("#settleKorName2").attr("disabled", "disabled");
	   						$("#settle2EmpBtn").attr("disabled", "disabled");	   						
	   					}else{
	   						$("#settleSelectBox2").removeAttr("disabled");
	   						$("#settleKorName2").removeAttr("disabled");
	   						$("#settle2EmpBtn").removeAttr("disabled");	   						
	   					}
	   				}else{
	   					$("#settleSelectBox2").attr("disabled", "disabled");
   						$("#settleKorName2").attr("disabled", "disabled");
   						$("#settle2EmpBtn").attr("disabled", "disabled");	   					
	   				}
	   				if(empNo == $("#settle3Emp").val()){
	   					if((settleSelected1 == "0" || settleSelected1 == "9") || (settleSelected2 == "0" || settleSelected2 == "9") 
	   							|| (settleSelected4 == "1" || settleSelected4 == "9")){
	   						$("#settleSelectBox3").attr("disabled", "disabled");
	   						$("#settleKorName3").attr("disabled", "disabled");
	   						$("#settle3EmpBtn").attr("disabled", "disabled");	   						
	   					}else{
	   						$("#settleSelectBox3").removeAttr("disabled");	
	   						$("#settleKorName3").removeAttr("disabled");
	   						$("#settle3EmpBtn").removeAttr("disabled");	   						
	   						if(settleSelected3 == "5"){
	   							$("#settleSelectBox1").attr("disabled", "disabled");
	   						}
	   					}	   					
	   				}else{
	   					$("#settleSelectBox3").attr("disabled", "disabled");	
   						$("#settleKorName3").attr("disabled", "disabled");
   						$("#settle3EmpBtn").attr("disabled", "disabled");	   					
	   				}	   				
	   				if(empNo == $("#settle4Emp").val()){
	   					if((settleSelected1 == "0" || settleSelected1 == "0") || (settleSelected2 == "0" || settleSelected2 == "9") 
	   							|| (settleSelected3 == "0" || settleSelected3 == "9")){
	   						$("#settleKorName4").attr("disabled", "disabled");
	   						$("#settle4EmpBtn").attr("disabled", "disabled");	   						
	   						$("#settleSelectBox4").attr("disabled", "disabled");
	   					}else{
	   						$("#settleSelectBox4").removeAttr("disabled");
	   						$("#settleKorName4").removeAttr("disabled");
	   						$("#settle4EmpBtn").removeAttr("disabled");
	   						
	   						if(settleSelected4 == "5"){
	   							$("#settleSelectBox1").attr("disabled", "disabled");
	   							$("#settleSelectBox2").attr("disabled", "disabled");
	   						}	   						
	   					}	 	   					
	   				}else{
	   					$("#settleSelectBox4").attr("disabled", "disabled");
   						$("#settleKorName4").attr("disabled", "disabled");
   						$("#settle4EmpBtn").attr("disabled", "disabled");	   					
	   				}	   				
	   			}
	   		}	   		
	   		
	   		//팝업 닫힐 떄 콜백 함수
	   		popUpCallback = function(data){
	   			$("button").each(function(index){
	   				if(btnEvt == this.id){
	   					var i = index+2;
	   					var korNameId = "settleKorName"+i;
	   					var empId = "settle"+i+"Emp";
	   					var selectBoxId = "settleSelectBox"+i;
	   					$("#"+empId).val("");
	   					$("#"+korNameId).val("");
	   					$("#"+empId).val(data[0].empNo);
	   					$("#"+korNameId).val(data[0].korName);
	   					
	   					$("#"+selectBoxId+" option").each(function(index){
	   						if($("#"+empId).val() != ""){
	   							if($("#"+selectBoxId+" option").eq(index).val() == "0"){
	   								$("#"+selectBoxId+" option").eq(index).attr("selected", "selected")	
	   							}
	   						}
	   					});
	   				}	   				
	   			});
	   		}
	   		
			//결제 정보 select 및 값 세팅
			loadPaymentsHistory = function(url, parameter, callback){
                $("input[name=empNo]").attr("disabled",false);
                $("input[name=setDate]").val($("#stDate").val().split("/").join(""));
                
               	var topData = gfn_callAjaxComm(parameter, url, callback);
               	
               	$(topData).each(function(index){
               		var settle1State = topData[index].settle1State;
               		var settle2State = topData[index].settle2State;
               		var settle3State = topData[index].settle3State;
               		var settle4State = topData[index].settle4State;
               		
               		if($("#custCode").length > 0){
               			$("#custCode").val(topData[index].custCode);	
               		}
               		if($("#custCode").length > 0){
               			$("#custName").val(topData[index].custName);	
               		}               
               		
               		if($("#seqNo").val() == ""){
               			$("#empNo").val("${empNo}");
               			$("#empName").val("${empName}");
               		}else{
               			$("#empNo").val(topData[index].empNo);
               			$("#empName").val(topData[index].empName);
               		}
               		
               		$("#settle1Emp").val(topData[index].empNo);
               		$("#settleKorName1").text(topData[index].empName);
               		$("#settleSelectBox1 option").each(function(index){
               			if($("#settleSelectBox1 option").eq(index).val() == settle1State){
               				$("#settleSelectBox1 option").eq(index).attr("selected", "selected");
               			}
               		});               		
               		$("#settle2Emp").val(topData[index].settle2Emp);
               		$("#settleKorName2").val(topData[index].settle2EmpName);
               		$("#settleSelectBox2 option").each(function(index){
               			if($("#settleSelectBox2 option").eq(index).val() == settle2State){
               				$("#settleSelectBox2 option").eq(index).attr("selected", "selected");
               			}
               		});
               		$("#settle3Emp").val(topData[index].settle3Emp);
               		$("#settleKorName3").val(topData[index].settle3EmpName);
               		$("#settleSelectBox3 option").each(function(index){
               			if($("#settleSelectBox3 option").eq(index).val() == settle3State){
               				$("#settleSelectBox3 option").eq(index).attr("selected", "selected");
               			}
               		});                		
               		$("#settle4Emp").val(topData[index].settle4Emp);
               		$("#settleKorName4").val(topData[index].settle4EmpName);
               		$("#settleSelectBox4 option").each(function(index){
               			if($("#settleSelectBox4 option").eq(index).val() == settle4State){
               				$("#settleSelectBox4 option").eq(index).attr("selected", "selected");
               			}
               		});                		
               	});
               	
               	paymentCheck();
			};
			
			//결제란 저장, 수정, 삭제
			saveTopMainGrid = function(url, mstCudKey){
   				var jsonData = {
   					cudKey : mstCudKey, 
					compId : "${compId}",
					setDate : $("#setDate").val(),
					setSeq : $("#setSeq").val(),
					empNo : empNo,
					custCode : $("#custCode").val(),
					sysEmpNo : empNo,   						
					settle1Emp: $("#settle1Emp").val(),
					settle2Emp: $("#settle2Emp").val(),
					settle3Emp: $("#settle3Emp").val(),
					settle4Emp: $("#settle4Emp").val(),
					settle1EmpName: "${empName}",
					settle2EmpName: $("#settleKorName2").val(),
					settle3EmpName: $("#settleKorName3").val(),
					settle4EmpName: $("#settleKorName4").val(),
					settle1State : $("#settleSelectBox1 option:selected").val(),
					settle2State : $("#settleSelectBox2 option:selected").val(),
					settle3State : $("#settleSelectBox3 option:selected").val(),
					settle4State : $("#settleSelectBox4 option:selected").val()
   				};
   				
                $.ajax({
                    url: url,
                    type: "json",
                    contentType: "application/json",
                    data: JSON.stringify(jsonData),
                    method: "post",
                    success: function(data) {
                    	console.log("9");
                    }
                });                  
   				
			};
			
			gridMain.dxObj.selectRow(0,true,true,true);
			
			if($("#seqNo").val() == ""){
				paymentCheck();	
			}
	   		
	   	})
    </script>
    <form id="topMain" name="topMain">
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
	            	<div class="col-sm-8 col-md-8 appvBottomPadding" style="width: 100%;">
	            		<span style="text-align: center; font-weight: bold;" id="settleKorName1">${empName}</span>
	            		<input type="hidden" name="settle1Emp" id="settle1Emp" value="${empNo}">
	            	</div>
	                <div style="width: 100%; margin-bottom: -9px;">
	                    <select id="settleSelectBox1" name="settleSelectBox1" class="form-control input-xs">
	                    	<option value="1">결재</option>
	                        <option value="0" selected="selected">미결</option>
	                        <option value="5">전결</option>
	                        <option value="9">부결</option>
	                    </select>
	                </div>
	            </td>
	            <td id="appv" class="col-md-3">
	                <div class="col-sm-8 col-md-8 appvBottomPadding">
	                    <input name="settleKorName2" id="settleKorName2" type="text" value="" placeholder="" class="form-control input-xs">
	                    <input type="hidden" name="settle2Emp" id="settle2Emp" value="">
	                </div>
	                <div class="col-sm-4 col-md-4">
	                    <button type="button" class="btn btn-default form-control" name="settle2EmpBtn" id="settle2EmpBtn">
	                        <span class="glyphicon glyphicon-search"></span>
	                    </button>
	                </div>
	                <div>
	                    <select id="settleSelectBox2" name="settleSelectBox2" class="form-control input-xs">
	                    	<option value="1">결재</option>
	                        <option value="0">미결</option>
	                        <option value="5" selected="selected">전결</option>
	                        <option value="9">부결</option>
	                    </select>
	                </div>
	            </td>
	            <td id="appv" class="col-md-3">
	                <div class="col-sm-8 col-md-8 appvBottomPadding">
	                    <input name="settleKorName3" id="settleKorName3" type="text" value="" placeholder="" class="form-control input-xs">
	                    <input type="hidden" name="settle3Emp" id="settle3Emp" value="">
	                </div>
	                <div class="col-sm-4 col-md-4">
	                    <button type="button" class="btn btn-default form-control" name="settle3EmpBtn" id="settle3EmpBtn">
	                        <span class="glyphicon glyphicon-search"></span>
	                    </button>
	                </div>
	                <div>
	                    <select id="settleSelectBox3" name="settleSelectBox3" class="form-control input-xs">
	                    	<option value="1">결재</option>
	                        <option value="0">미결</option>
	                        <option value="5" selected="selected">전결</option>
	                        <option value="9">부결</option>
	                    </select>
	                </div>
	            </td>
	            <td id="appv" class="col-md-3">
	                <div class="col-sm-8 col-md-8 appvBottomPadding">
	                    <input name="settleKorName4" id="settleKorName4" type="text" value="" placeholder="" class="form-control input-xs">
	                    <input type="hidden" name="settle4Emp" id="settle4Emp" value="">
	                </div>
	                <div class="col-sm-4 col-md-4">
	                    <button type="button" class="btn btn-default form-control" name="settle4EmpBtn" id="settle4EmpBtn">
	                        <span class="glyphicon glyphicon-search"></span>
	                    </button>
	                </div>
	                <div>
	                    <select id="settleSelectBox4" name="settleSelectBox4" class="form-control input-xs">
	                    	<option value="1">결재</option>
	                        <option value="0">미결</option>
	                        <option value="5" selected="selected">전결</option>
	                        <option value="9">부결</option>
	                    </select>
	                </div>
	            </td>
	        </tr>
	    </table>
	</form>