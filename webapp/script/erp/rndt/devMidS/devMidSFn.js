function fn_frmSearch(){
	var mainParam = {};
	mainParam.setDate = searchDate($("#setDate").val());
	mainParam.setSeq = $("#setSeq").val();
	//console.log(mainParam);
	gfn_callAjaxForForm("frmMain", mainParam, "selFrmMain",fn_frmSearchCB);
}
function fn_frmSearchCB(data){
	console.log("devS frmMain data=",data);
}
function fn_getSeqReturn(){
	 var obj = {};
	    obj.tableName = 'TBL_DEV_PLAN_EVALUATE_MST';
	    obj.seqColumn = 'SET_SEQ';
	    obj.dateColumn1 = 'SET_DATE';
	    obj.columnData1 = searchDate($("#setDate").val());
	    //obj.dateColumn2 = 'PLAN_NUMB';
	    //obj.columnData2 = $("#planNumb").val();
	    obj.returnLen = 2;
	    gfn_callAjaxComm(obj,"/erp/comm/stan/tableSeq/selTableSeq1",fn_SetSeq); 
}
function fn_seqValid(){
	var vFlag = "";
	if($("#setSeq").val()==null||$("#setSeq").val()==""
		||typeof $("#setSeq").val()=="undefined"
			||$("#planNumb").val()==null||$("#planNumb").val()==""
			||typeof $("#planNumb").val()=="undefined"){
		dhtmlx.alert("위 Form부터 작성/저장 하세요");
		vFlag = false;
		return vFlag;
	}else{
		vFlag = true;
		return vFlag;
	}
}
function fn_frmMainSave(){
	$("input[name=setSeq]").attr("disabled",false);
	dateVal = searchDate($("#setDate").val());
	seqVal = $("#setSeq").val();
	planNumVal = $("#planNumb").val();
 	var params = gfn_getFormElemntsData('frmMain');
	$("input[name=setSeq]").attr("disabled",true);
	console.log(params);
	    $.ajax({
        type: 'POST',
        url: "/erp/rndt/good/devMidS/frmMainSave",
        data: params,
        success: function(data) {
            MsgManager.alertMsg("INF001");
            }
    });
}
function fn_SetSeq(data) {
	   $("#setSeq").val(data[0].seq);
	};
function fn_new(){
	byId("frmMain").reset();
	$("#setSeq").val("");
	fn_setDate();
    $('#setDate').keyup();
    fn_setCud("cudKey","i");
}
function fn_setDate(){
    var t = dateformat(new Date());
    byId("setDate").value = t;
}
function fn_textAreaSetbg(color)
{
	document.getElementById("contents").style.background=color
	document.getElementById("remarks").style.background=color
}
function fn_setCud(cudId,flag){
	if(flag=="i"){
		byId(cudId).value = 'INSERT';
	}
	if(flag=="u"){
		byId(cudId).value = 'UPDATE';
	}
	if(flag=="d"){
		byId(cudId).value = 'DELETE';
	}
}