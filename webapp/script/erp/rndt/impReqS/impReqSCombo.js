function fn_setCombo(){
	combo01 = gridMain.getColumnCombo(getColIdx("custKorName"));
    combo02 = gridMain.getColumnCombo(getColIdx("itemName"));
    fn_comboLoad(combo01,"1");
    fn_comboLoad(combo02,"2");
	combo01.attachEvent("onChange", function(){
		gridSetVal(gridMain,"custKorName",combo01.getSelectedText().custKorName)
		gridSetVal(gridMain,"custCode",combo01.getSelectedText().custCode)
	});
	combo02.attachEvent("onChange", function(){
		gridSetVal(gridMain,"itemName",combo02.getSelectedText().itemName)
		gridSetVal(gridMain,"itemCode",combo02.getSelectedText().itemCode)
	});
}
function fn_comboLoad(comboId,cFlag){
	var obj = {};
	if(cFlag == 1){
		comboId.setTemplate({
		    input: "#custKorName#",
		    columns: [
	          {header: "고객코드", width: 150, option: "#custCode#"},
	          {header: "고객명", width: 150, option: "#custKorName#"}
		    ]
		});
	    obj.code = '%';
	    obj.name = '%';
		$.ajax({
			"url":"/erp/comm/CustCodeR",
			"type":"post",
			"data":obj,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				  comboId.addOption(i,
						  {custCode:list[i].custCode,
						   custKorName:list[i].custKorName});
                  } 
			}
	  });
	}else{
		comboId.setTemplate({
		    input: "#itemName#",
		    columns: [
		      {header: "품목코드", width: 150, option: "#itemCode#"},
		      {header: "품목명",   width: 150, option: "#itemName#"}
		    ]
		});
		obj.itemName = '%';
		$.ajax({
			"url":"/erp/rndt/stan/bomR/itemCodePop",
			"type":"post",
			"data":obj,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
		 		  comboId.addOption(i,
			  {itemCode:list[i].itemCode,itemName:list[i].itemName});

			  } 
			}
	  });
	}
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
};