// set common configuration of grid
var dxGrid = function(divId, autoHeight){
	this.dxObj = divId.attachGrid();
	//this.dxObj = new dhtmlXGridObject(divId);
	this.dxObj.setImagePath("/component/dhtmlxGrid/imgs/");
	this.dxObj.setSkin("dhx_skyblue");
	this.dxObj.setDateFormat("%Y-%m-%d");
	this.dxObj.attachEvent("onEditCell", gfn_gridEditCell);
	
	this.headerName = new Array();
	this.headerColId = new Array();
	this.headerWidth = new Array();
	this.headerAlign = new Array();
	this.headerType = new Array();
	
	if (autoHeight == false) {
		gAutoHeight = false;
		this.dxObj.enableAutoHeight(false, 0);
	} else {
		gAutoHeight = true;
		this.dxObj.enableAutoHeight(true);
	}
};

dxGrid.prototype.addHeader = function(val){
	this.headerName.push(val.name);
	this.headerColId.push(val.colId);
	this.headerWidth.push(val.width);
	this.headerAlign.push(val.align);
	this.headerType.push(val.type);
};

dxGrid.prototype.init = function() {
	this.setHeader(this.headerName.join(","));
	this.setColId(this.headerColId.join(","));
	this.setColWidthP(this.headerWidth.join(","));
	this.setColAlign(this.headerAlign.join(","));
	this.setColType(this.headerType.join(","));
	this.setColSort("str");
	
	this.dxObj.init();
	
	var colIdx = this.dxObj.getColIndexById(cudKeyCol);
	this.dxObj.setColumnHidden(colIdx, true);
};

dxGrid.prototype.setHeader = function(headers) {
	headers += ",<font color=FFFFFF>cudKey</font>";
	this.dxObj.setHeader(headers);
};

dxGrid.prototype.setColId = function(ids) {
	ids += "," + cudKeyCol;
	this.dxObj.setColumnIds(ids);
};

dxGrid.prototype.setColWidth = function(val) {
	var cudKeyIdx = this.dxObj.getColIndexById(cudKeyCol);
	if (cudKeyIdx >= 0) {
		val += ",10";
	}
	
	var arrLenth = val.split(",");	
	if(arrLenth.length==1) {
		this.dxObj.setInitWidths(this.getAutoVal(val));
	} else {
		this.dxObj.setInitWidths(val);
	}
};

dxGrid.prototype.setColWidthP = function(val) {
	var cudKeyIdx = this.dxObj.getColIndexById(cudKeyCol);
	if (cudKeyIdx >= 0) {
		val += ",1";
	}
	
	var arrLenth = val.split(",");	
	if(arrLenth.length==1) {
		this.dxObj.setInitWidthsP(this.getAutoVal(val));
	} else {
		this.dxObj.setInitWidthsP(val);
	}
};

dxGrid.prototype.setColAlign = function(val) {
	var arrLenth = val.split(",");	
	if(arrLenth.length==1) {
		this.dxObj.setColAlign(this.getAutoVal(val));
	} else {
		this.dxObj.setColAlign(val);
	}
};

dxGrid.prototype.setColType = function(val) {
	var arrLenth = val.split(",");	
	if(arrLenth.length==1) {
		this.dxObj.setColTypes(this.getAutoVal(val));
	} else {
		this.dxObj.setColTypes(val + ",ro");
	}
};

dxGrid.prototype.setColSort = function(val) {
	var arrLenth = val.split(",");
	if(arrLenth.length==1) {
		this.dxObj.setColSorting(this.getAutoVal(val));
	} else {
		this.dxObj.setColSorting(val);
	}
};

dxGrid.prototype.getDxObj = function(){
	return this.dxObj;
};

dxGrid.prototype.getRowsNum = function(){
	return this.dxObj.getRowsNum();
};

dxGrid.prototype.getColumnCount = function(){
	return this.dxObj.getColumnCount();
};

dxGrid.prototype.getColumnsNum = function(){
	return this.dxObj.getColumnsNum();
};

dxGrid.prototype.getRowId = function(rowIdx){
	return this.dxObj.getRowId(rowIdx);
};

dxGrid.prototype.getSelectedRowId = function(){
	return this.dxObj.getSelectedId();
};

dxGrid.prototype.getSelectedRowIndex = function(){
	var rowId = this.dxObj.getSelectedId();
	return this.dxObj.getRowIndex(rowId);
};

dxGrid.prototype.getColIndexById = function(colName){
	return this.dxObj.getColIndexById(colName);
};

dxGrid.prototype.getActTypeColIdx = function(){
	return this.dxObj.getColIndexById(cudKeyCol);
};

dxGrid.prototype.setUserData = function(rowId, key, val) {
	this.dxObj.setUserData(rowId, key, val);
};

dxGrid.prototype.getCellValue = function(rowId, columnId ) {
	return this.dxObj.cells(rowId, columnId).getValue();
};

dxGrid.prototype.attachEvent = function(eName, fName) {
	this.dxObj.attachEvent(eName, fName);
};

dxGrid.prototype.load = function(json) {
	var pk = this.dxObj.getUserData("","pk");
	this.dxObj.clearAll();
	this.dxObj.parse(json, "js");
	if(pk!="") this.dxObj.setUserData("","pk", pk);
	setGridHeight();
};

dxGrid.prototype.getAutoVal = function(val) {
	var calc = val;
	for(var i = 1; i < (this.dxObj.hdrLabels).length; i++) {
		calc = calc.concat("," + val);
	}
	return calc;
};

dxGrid.prototype.addRow = function(initDataArray, rowPos, cellPos) {
	var totalColNum = this.dxObj.getColumnCount();
	
	if(rowPos) {
		rowPos = this.dxObj.getRowsNum();
	}
	
	var data = new Array(totalColNum);
	
	if (initDataArray != null && initDataArray.length > 0) {
		for (var i=0; i < initDataArray.length; i++) {
			data[i] = initDataArray[i];
		}
	}
	
	var chkColIdx = this.dxObj.getColIndexById(chkCol);
	if (chkColIdx >= 0) {
		data[chkColIdx] = "";
	}
	
	var cudKeyIdx = this.dxObj.getColIndexById(cudKeyCol);
	if (cudKeyIdx >= 0) {
		data[cudKeyIdx] = actInsert;
	}
	
	var editStatIdx = this.dxObj.getColIndexById("editStat");
	if (editStatIdx >= 0) {
		data[editStatIdx] = editIcon;
	}
	
	this.dxObj.addRow(this.dxObj.uid(), data, rowPos);
	var cell = 0;
	if(cellPos!=null) {
		cell = cellPos;
	}
	this.dxObj.selectCell(rowPos, cell, false, true);
	this.dxObj.editCell();
	
	return eval(rowPos + "+" + 1);	//return currRow
};

//Get Json from CUD rows 
dxGrid.prototype.getJsonUpdated = function(excludeCols) {
	this.dxObj.editStop();
	var jsonStr = "";
	var colId = "";
	var colNm = "";
	var colVal = "";
	
	for(var i = 0; i < this.dxObj.getRowsNum(); i++) {
		var cudColIdx = this.dxObj.getColIndexById(cudKeyCol);
		var gubun = this.dxObj.cells2(i,cudColIdx).getValue().toUpperCase();

		if (gubun == actInsert || gubun == actUpdate || gubun == actDelete) {
			var row = '{';
			for(var j = 0; j < this.dxObj.getColumnsNum(); j++){ 
				colId = this.dxObj.getColumnId(j);
				colNm = this.dxObj.getColLabel(j);
				colVal = this.dxObj.cells2(i,j).getValue();
				
				if(!gfn_validation(colId, colNm, colVal) ) {
					this.dxObj.selectCell(i, j, false, true, false);
					return null;
				}
	
				if(colId != "editStat" && colId != "chk") {
					row += '"' + colId + '": "' + colVal + '",';
				}
			}
			jsonStr += row.substring(0, row.lastIndexOf(',')) + '},';
		}
	}
	jsonStr = jsonStr.substring(0, jsonStr.lastIndexOf(','));
	
	if(!gfn_checkXSS(jsonStr, true)) {
		return null;
	} else {
		if (jsonStr.length > 0) {
			jsonStr = '[' + jsonStr + ']';
		} else {
			MsgManager.alertMsg("WRN004");
			return null;
		}
	}
	
	return jsonStr;
};

//Get Json from checked rows 
dxGrid.prototype.getJsonChecked = function(chkIdx, excludeCols) {
	this.dxObj.editStop();
	var jsonStr = "";
	var colId = "";
	var colNm = "";
	var colVal = "";

	for(var i = 0; i < this.dxObj.getRowsNum(); i++){
		var row = '{';
		if(this.dxObj.cells2(i,chkIdx).getValue()=="1") {
			for(var j = 0; j < this.dxObj.getColumnsNum(); j++) {
				colId = this.dxObj.getColumnId(j);
				colNm = this.dxObj.getColLabel(j);
				colVal = this.dxObj.cells2(i,j).getValue();
				
				if(!gfn_validation(colId, colNm, colVal) ) {
					this.dxObj.selectCell(i, j, false, false, false);
					return null;
				}
				
				if(colId != "editStat" && colId != "chk") {
					if(colId!="cudKey") {
						row += '"' + colId + '": "' + colVal + '",';
					} else {
						row += '"' + colId + '": "' + actDelete + '",';
					}
				}
			}
			jsonStr += row.substring(0, row.lastIndexOf(',')) + '},';
		}
	}

	jsonStr = jsonStr.substring(0, jsonStr.lastIndexOf(','));
	if(!gfn_checkXSS(jsonStr, true)) {
		return null;
	} else {
		if (jsonStr.length > 0) {
			jsonStr = '[' + jsonStr + ']';
		} else {
			MsgManager.alertMsg("WRN008");
			return null;
		}
	}
	
	return jsonStr;
};

dxGrid.prototype.setUseYnCol = function(colIdx) {
	var useYnJson = [{"cd":"Y", "cdNm":"사용"},{"cd":"N", "cdNm":"미사용"}];
	for (var i=0; i < useYnJson.length; i++) {
		this.dxObj.getCombo(colIdx).put(useYnJson[i].cd, useYnJson[i].cdNm);
	}
};

dxGrid.prototype.setHiddenCols = function(cols) {
	var col = cols.split(',');
	for(var i = 0; i < col.length; i++) {
		var colIdx = this.dxObj.getColIndexById(col[i]);
		if(colIdx >= 0){
			this.dxObj.setColumnHidden(colIdx, true);
		}
	}
};

dxGrid.prototype.chkUnsavedRows = function() {
	var cudColIdx = this.dxObj.getColIndexById(cudKeyCol);
	var isDelRow = false;
	
	for(var i = 0; i < this.dxObj.getRowsNum(); i++) {
		var cudColVal = this.dxObj.cells2(i,cudColIdx).getValue();
		if (cudColVal == actInsert) {
			if(!isDelRow) {
				if(MsgManager.confirmMsg("WRN007")) {
					isDelRow = true;
					this.dxObj.deleteRow(this.dxObj.getRowId(i));
					i--;
				} else {
					return false;
				}
			} else {
				this.dxObj.deleteRow(this.dxObj.getRowId(i));
				i--;
			}
		}
	}
	return true;
};

dxGrid.prototype.isSelRows = function(colIdx) {
	for(var i = 0; i < this.dxObj.getRowsNum(); i++) {
		var colVal = this.dxObj.cells2(i,colIdx).getValue();
		if (colVal == 1) {
			return true;
		}
	}
	return false;
};

dxGrid.prototype.isDelRows = function(rowIdx) {
	if(rowIdx == null){
		return false;
	}
	return true;
};

//한줄삭제 row delete 
dxGrid.prototype.getJsonRowDelete = function(chkIdx, excludeCols) {
	this.dxObj.editStop();
	var jsonStr = "";
	var colId = "";
	var colNm = "";
	var colVal = "";
    
	chkIdx = chkIdx -1;
	for(var i = 0; i < this.dxObj.getRowsNum(); i++){
		if(i == chkIdx) {
		   var row = '{';
			  for(var j = 0; j < this.dxObj.getColumnsNum(); j++) {
					colId = this.dxObj.getColumnId(j);
					colVal = this.dxObj.cells2(chkIdx,j).getValue();

						if(colId !="cudKey") {
							row += '"' + colId + '": "' + colVal + '",';
						} else {
							row += '"' + colId + '": "' + actDelete + '",';
						}
				}
				jsonStr += row.substring(0, row.lastIndexOf(',')) + '},';
		 }
	 }
	
	jsonStr = jsonStr.substring(0, jsonStr.lastIndexOf(','));
	
	if(!gfn_checkXSS(jsonStr, true)) {
		return null;
	} else {
		if (jsonStr.length > 0) {
			jsonStr = '[' + jsonStr + ']';
		} else {
			MsgManager.alertMsg("WRN008");
			return null;
		}
	}

	return jsonStr;
};

/*dxGrid.prototype.getJsonMultiRowDelete = function(chkIdx, excludeCols) {
	this.dxObj.editStop();
	var jsonStr = "";
	var colId = "";
	var colNm = "";
	var colVal = "";
	
	for(var i = this.dxObj.getRowsNum(); i > 0; i--){
	//	alert("i="+i+"chkIdx="+chkIdx);
		if(i == chkIdx) {
		   var row = '{';
			  for(var j = 0; j < this.dxObj.getColumnsNum(); j++) {
					colId = this.dxObj.getColumnId(j);
					colVal = this.dxObj.cells2(chkIdx-1,j).getValue();
					
						if(colId !="cudKey") {
							row += '"' + colId + '": "' + colVal + '",';
						} else {
							row += '"' + colId + '": "' + actDelete + '",';
						}
				}
				jsonStr += row.substring(0, row.lastIndexOf(',')) + '},';			
		 }
	 }
	
	jsonStr = jsonStr.substring(0, jsonStr.lastIndexOf(','));
//	alert(jsonStr);
	if(!gfn_checkXSS(jsonStr, true)) {
		return null;
	} else {
		if (jsonStr.length > 0) {
			jsonStr = '[' + jsonStr + ']';
		} else {
			alert(2);
			MsgManager.alertMsg("WRN008");
			return null;
		}
	}

	return jsonStr;
};*/


//멀티삭제 MULTI DELETE 
dxGrid.prototype.getJsonMultiRowDelete = function(excludeCols) {
	this.dxObj.editStop();
	var jsonStr = "";
	var colId = "";
	var colNm = "";
	var colVal = "";

	for(var i = 0; i < this.dxObj.getRowsNum(); i++){
		   var row = '{';
			  for(var j = 0; j < this.dxObj.getColumnsNum(); j++) {
					colId = this.dxObj.getColumnId(j);
					colVal = this.dxObj.cells2(i,j).getValue();

						if(colId !="cudKey") {
							row += '"' + colId + '": "' + colVal + '",';
						} else {
							row += '"' + colId + '": "' + actDelete + '",';
						}
				}
				jsonStr += row.substring(0, row.lastIndexOf(',')) + '},';
				
	 }
	
	jsonStr = jsonStr.substring(0, jsonStr.lastIndexOf(','));
	if(!gfn_checkXSS(jsonStr, true)) {
		return null;
	} else {
		if (jsonStr.length > 0) {
			jsonStr = '[' + jsonStr + ']';
		} else {
			MsgManager.alertMsg("WRN008");
			return null;
		}
	}

	return jsonStr;
};
