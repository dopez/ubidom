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
function fn_saveGridMain(){
	if($("#seqNo").val()==null||$("#seqNo").val()==""
		||typeof $("#seqNo").val()=="undefined"){
		fn_getSeqReturn();
	}
	var reqDnoVal = searchDate($("#setDate").val())+$("#setSeq").val();
	gridMain.dxObj.forEachRow(function(id) {
		gridSetVal(gridMain,"setDate",searchDate($("#setDate").val()));
		gridSetVal(gridMain,"setSeq",$("#setSeq").val());
		gridSetVal(gridMain,"reqDno",reqDnoVal);
		gridSetVal(gridMain,"reqEmp",$("#reqEmp").val());
		gridSetVal(gridMain,"reqEmpName",$("#reqEmpName").val());
		gridSetVal(gridMain,"state","10");
	});
    var jsonStr = gridMain.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("저장할 값이 없습니다.");
		fn_setNew();
		return
	}else{
		$("#jsonData").val(jsonStr);
		var params = $("#frmJson").serialize();
		console.log(params);
		$.ajax({
	         url : "/erp/rndt/good/impReqS/saveGridMain",
	         type : "POST",
	         data : params,
	         async : true,
	         success : function(data) {
	            MsgManager.alertMsg("INF001");
	         }
	     });
	}

}