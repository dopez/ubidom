function fn_setNew(){
	byId("frmMain").reset();
	$("#setSeq").val("");
	$("#reqEmpName").val("");
	$("#reqEmp").val("");
	fn_setDate();
    $('#setDate').keyup();
    gridMain.clearAll();
    gridMain.parse("",js);
}
function fn_getSeqReturn(){
	var obj = {};
    obj.tableName = 'TBL_GOODS_ASSIGNS';
    obj.seqColumn = 'SET_SEQ';
    obj.dateColumn1 = 'SET_DATE';
    obj.columnData1 = searchDate($("#setDate").val());
    obj.returnLen = 4;
    gfn_callAjaxComm(obj,"/erp/comm/stan/tableSeq/selTableSeq1",fn_SetSeq);
}
function fn_SetSeq(data) {
	 $("#setSeq").val(data[0].seq);
};
function fn_selGridMain(){
	var obj = {};
	obj.setSeq = $("#setSeq").val();
	obj.setNo = $("#setNo").val();
	obj.setDate = searchDate($("#setDate").val());
    gfn_callAjaxForGrid(gridMain,obj,"selGridMain",subLayout.cells("a"));
}
function fn_saveGridMain(){
	if($("#setSeq").val()==null||$("#setSeq").val()==""
		||typeof $("#setSeq").val()=="undefined"){
		fn_getSeqReturn();
	}
	var reqDnoVal = searchDate($("#setDate").val())+$("#setSeq").val();
	gridMain.dxObj.forEachRow(function(id) {
		gridSetVal(gridMain,"setDate",searchDate($("#setDate").val()),id);
		gridSetVal(gridMain,"setSeq",$("#setSeq").val(),id);
		gridSetVal(gridMain,"reqDno",reqDnoVal,id);
		gridSetVal(gridMain,"reqEmp",$("#reqEmp").val(),id);
		gridSetVal(gridMain,"reqEmpName",$("#reqEmpName").val(),id);
		gridSetVal(gridMain,"state","10",id);
		/*rNum을 setNo에 넣어준다.*/
		gridSetVal(gridMain,"setNo",gridGetVal(id,gridMain,"rNum"),id);
	});
    var jsonStr = gridMain.getJsonUpdated2();
	console.log(jsonStr);
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("저장할 값이 없습니다.");
		fn_setNew();
		return
	}else{
		$("#jsonData").val(jsonStr);
		var params = $("#frmJson").serialize();
		$.ajax({
	         url : "/erp/rndt/good/impReqS/saveGridMain",
	         type : "POST",
	         data : params,
	         async : true,
	         success : function(data) {
	        	 fn_selGridMain();
	            MsgManager.alertMsg("INF001");
	         }
	     });
	}

}