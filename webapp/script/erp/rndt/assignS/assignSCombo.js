function fn_setCombo(){
	combo01 = gridDtl.getColumnCombo(getDtlColIdx("equiName"));
    combo02 = gridDtl.getColumnCombo(getDtlColIdx("inchEmpName"));
    fn_comboLoad(combo01,"1");
    fn_comboLoad(combo02,"2");
	combo01.attachEvent("onSelectionChange", function(){
		//gridSetVal(gridDtl,"equiName",combo01.getSelectedText().equiName)
		gridSetVal(gridDtl,"equiCode",combo01.getSelectedText().equiCode)
	});
	combo02.attachEvent("onSelectionChange", function(){
		//gridSetVal(gridDtl,"inchEmpName",combo02.getSelectedText().inchEmpName)
		gridSetVal(gridDtl,"inchEmp",combo02.getSelectedText().inchEmp)
	});
}
function fn_comboLoad(comboId,cFlag){
	var obj = {};
	if(cFlag == 1){
		comboId.setTemplate({
		    input: "#equiName#",
		    columns: [
	          {header: "설비코드", width: 150, option: "#equiCode#"},
	          {header: "설비명", width: 150, option: "#equiName#"}
		    ]
		});
	    obj.equiName = '%';
		$.ajax({
			"url":"/erp/prod1/equi/historyS/equiCodeSearch",
			"type":"post",
			"data":obj,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				  comboId.addOption(i,
						  {equiCode:list[i].equiCode,
						   equiName:list[i].equiName});
                  } 
			}
	  });
	}else{
		comboId.setTemplate({
		    input: "#inchEmpName#",
		    columns: [
		      {header: "담당자코드", width: 150, option: "#inchEmp#"},
		      {header: "담당자명",   width: 150, option: "#inchEmpName#"}
		    ]
		});
		obj.korName = '%';
		$.ajax({
			"url":"/erp/pers/pers/persAppointS/selEmpPop",
			"type":"post",
			"data":obj,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
		 		  comboId.addOption(i,
			  {inchEmp:list[i].empNo,inchEmpName:list[i].korName});

			  } 
			}
	  });
	}
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
};