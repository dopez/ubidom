// set common configuration of grid
var dxGrid = function(divId, autoHeight){
	if(typeof divId =="string"){
		this.dxObj = new dhtmlXGridObject(divId);
	}else{
		this.dxObj = divId.attachGrid();
	}
	this.dxObj.setImagePath("/component/dhtmlxSuite/codebase/imgs/");
	this.dxObj.setDateFormat("%Y/%m/%d");
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

dxGrid.prototype.atchHeader = function(){
	this.atchHeaderName = new Array();
}

dxGrid.prototype.addAtchHeader = function(val){
	this.atchHeaderName.push(val.atchHeaderName);
}

dxGrid.prototype.attachHeader = function(headers){
	this.dxObj.attachHeader(headers);
}

dxGrid.prototype.atchHeaderInit = function(){
	this.attachHeader(this.atchHeaderName.join(","));
}

dxGrid.prototype.atchFooter = function(){
	this.atchFooterName = new Array();
}

dxGrid.prototype.addAtchFooter = function(val){
	this.atchFooterName.push(val.atchFooterName);
}

dxGrid.prototype.attachFooter = function(headers){
	this.dxObj.attachFooter(headers);
}

dxGrid.prototype.atchFooterInit = function(){
	this.attachFooter(this.atchFooterName.join(","));
}


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
	this.setColWidth(this.headerWidth.join(","));
	this.setColAlign(this.headerAlign.join(","));
	this.setColType(this.headerType.join(","));
	this.cs_setColSort(this.headerType.join(","));
	this.dxObj.setStyle(
		    "border-bottom-width:2px;", "border:1px solid silver;","", ""
	);
	this.dxObj.init();
	this.dxObj.enableSmartRendering(true);
	this.dxObj.setAwaitedRowHeight(28);

	this.dxObj.enableEditEvents(true,false,true);

	this.dxObj.enableDistributedParsing(true,50,1000);

	//this.dxObj.insertColumn(0,'&nbsp;','cntr',15,'na','right','top',null,'#CCE2FE');

	var colIdx = this.dxObj.getColIndexById(cudKeyCol);
	this.dxObj.setColumnHidden(colIdx, true);

	this.cs_setHeaderMenu();

	this.enableResizing();


};
dxGrid.prototype.cs_setColSort = function(val) {
	var arrLenth = val.split(",");
	var sortingArr = [];
	for(var i=0;i<arrLenth.length;i++){
		if(arrLenth[i] == "ron" || arrLenth[i] == "edn"){
			this.dxObj.setColSorting("int");
			sortingArr[i] = "int";
		}else{
			sortingArr[i] = "str";
		}
	}
	sortingArr = sortingArr.join(",");
	this.dxObj.setColSorting(sortingArr);
}

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

dxGrid.prototype.getUserData = function(){
	return this.dxObj.getUserData("","pk");
}



dxGrid.prototype.getCellValue = function(rowId, columnId ) {
	return this.dxObj.cells(rowId, columnId).getValue();
};

dxGrid.prototype.attachEvent = function(eName,fName) {
	   this.dxObj.attachEvent(eName,fName);
};

dxGrid.prototype.load = function(json) {
	var pk = this.dxObj.getUserData("","pk");
	this.clearAll();
	this.dxObj.parse(json, "js");
	if(pk!="") this.dxObj.setUserData("","pk", pk);
	setGridHeight();
};

dxGrid.prototype.loadXML = function(xmlStr) {
	var pk = this.dxObj.getUserData("","pk");
	this.clearAll();
	this.dxObj.loadXMLString(xmlStr);
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

//Get Json from CUD rows 특수기호 포함
dxGrid.prototype.getJsonUpdated2 = function(excludeCols) {
	this.dxObj.editStop();
	var jsonStr = "";
	var colId = "";
	var colNm = "";
	var colVal = "";
	var colType = "";
	var arr = [];
	for(var i = 0; i < this.dxObj.getRowsNum(); i++) {
		var cudColIdx = this.dxObj.getColIndexById(cudKeyCol);
		var gubun = this.dxObj.cells2(i,cudColIdx).getValue().toUpperCase();
		if (gubun == actInsert || gubun == actUpdate || gubun == actDelete) {
			var row={};
			for(var j = 0; j < this.dxObj.getColumnsNum(); j++){
				colId = this.dxObj.getColumnId(j);
				colNm = this.dxObj.getColLabel(j);
				colVal = this.dxObj.cells2(i,j).getValue();
				colType = this.dxObj.getColType(j);
				
				var classNm = grid.dxObj.getUserData("","@"+colId);

	        	if(classNm != null){
	        		var regExp = /[\{\}\[\]\/?;:|\)*`!^\+<>@\#$%&\\\=\(\'\"]/gi;
					colVal = colVal.replace(regExp, "");
	        	 }

				/*if(colType=="ro" || colType =="dhxCalendar" || colType == "dhxCalendarA"){
					var regExp = /[\{\}\[\]\/?;:|\)*`!^\+<>@\#$%&\\\=\(\'\"]/gi;
					colVal = colVal.replace(regExp, "");
				}*/


				if(!gfn_validation(colId, colNm, colVal) ) {
					this.dxObj.selectCell(i, j, false, true, false);
					return null;
				}
				  row[colId]=colVal;
			}
			arr.push(row);
		}
	}
	jsonStr = JSON.stringify(arr);

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

//Get Json from checked rows 특수기호 추가
dxGrid.prototype.getJsonChecked2 = function(chkIdx, excludeCols) {
	this.dxObj.editStop();
	var jsonStr = "";
	var colId = "";
	var colNm = "";
	var colVal = "";
	var arr = delCol.split(";");

	for(var i = 0; i < this.dxObj.getRowsNum(); i++){
		var row = '{';
		if(this.dxObj.cells2(arr[i],chkIdx).getValue()=="1") {
			for(var j = 0; j < this.dxObj.getColumnsNum(); j++) {
				colId = this.dxObj.getColumnId(j);
				colNm = this.dxObj.getColLabel(j);
				colVal = this.dxObj.cells2(arr[i],j).getValue();

				if(!gfn_validation(colId, colNm, colVal) ) {
					this.dxObj.selectCell(arr[i], j, false, false, false);
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

	if (jsonStr.length > 0) {
		jsonStr = '[' + jsonStr + ']';
	} else {
		MsgManager.alertMsg("WRN008");
		return null;
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

//한줄만 삭제
dxGrid.prototype.chkUnsavedRows = function() {
	var cudColIdx = this.dxObj.getColIndexById(cudKeyCol);
	var isDelRow = false;

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

	return true;
};
//메세지 안나오게 한 로직
dxGrid.prototype.chkUnsavedRow = function(rowNum,rowId) {
	var cudColIdx = this.dxObj.getColIndexById(cudKeyCol);
	var isDelRow = false;
	var cudColVal = this.dxObj.cells2(rowNum,cudColIdx).getValue();
	if (cudColVal == actInsert) {
		isDelRow = true;
			this.dxObj.deleteRow(rowId);
	}
	return isDelRow;
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

dxGrid.prototype.getColumnCombo = function(column_index){
	return this.dxObj.getColumnCombo(column_index);
}

dxGrid.prototype.setCells2 = function(row_index,col) {
	return  this.dxObj.cells2(row_index, col);
};
dxGrid.prototype.setCells = function(row_id,col) {
	return  this.dxObj.cells(row_id, col);
};
dxGrid.prototype.editCell = function(){
	return this.dxObj.editCell();
}
dxGrid.prototype.editStop = function(ode){
	return this.dxObj.editStop(ode);
}

dxGrid.prototype.printView = function(before,after){
	return this.dxObj.printView(before,after);
}

dxGrid.prototype.clearAll = function(flag){
	var userData = this.dxObj.UserData["gridglobaluserdata"];
	this.dxObj.clearAll(flag);
	this.dxObj.UserData["gridglobaluserdata"] = userData;
	return;
}

dxGrid.prototype.setColumnHidden = function(ind,state){
	return this.dxObj.setColumnHidden(ind,state);
}

dxGrid.prototype.parse = function(data,type){
	return this.dxObj.parse(data,type);
}

dxGrid.prototype.selectRow = function(rIndex,fl,preserve,show){
	return this.dxObj.selectRow(rIndex,fl,preserve,show);
}

dxGrid.prototype.enableSmartRendering = function(flag,rowNum){
	return this.dxObj.enableSmartRendering(flag,rowNum);
}

dxGrid.prototype.clearSelection = function(){
	return this.dxObj.clearSelection();
}

dxGrid.prototype.filterBy = function(colIndex,value,status){
	return this.dxObj.filterBy(colIndex,value,status);
}

dxGrid.prototype.filterByAll = function(){
	return this.dxObj.filterByAll();
}

dxGrid.prototype.changeCellType = function(rowInd,cellIndex,type){
	return this.dxObj.changeCellType(rowInd,cellIndex,type);
}

dxGrid.prototype.getColumnId = function(cellIndex){
	return this.dxObj.getColumnId(cellIndex);
}
dxGrid.prototype.cs_setHeaderMenu = function(){
	var arr = new Array(this.dxObj.getColumnsNum()-1);

	for(var i=0; i<this.dxObj.getColumnsNum()-1;i++){
		if(this.dxObj.isColumnHidden(i)){
			arr.push(false);
		}else{
			if(this.dxObj.getColType(i)=="cntr"){
				arr.push(false);
			}else{
				arr.push(true);
			}

		}
	}

	return this.dxObj.enableHeaderMenu(arr.join());
};

dxGrid.prototype.cs_deleteRow = function(rowId){
	var colIndex=this.dxObj.getColIndexById("cudKey");
	var cellObj = this.dxObj.cells(rowId,colIndex);

	if(cellObj.getValue() == "INSERT"){
		this.dxObj.deleteRow(rowId)
	}else{
		cellObj.setValue("DELETE");
		return this.dxObj.setRowTextStyle(rowId, "font-family:arial;font-style: italic;color:#C0C0C0;");
	}
}

dxGrid.prototype.cs_setColumnHidden = function(arr){

	for(var i in arr){
		var colIdx = this.dxObj.getColumnsNum()-1;
		this.dxObj.insertColumn(colIdx);
		this.dxObj.setColumnId(colIdx,arr[i]);
		this.dxObj.setColumnHidden(colIdx,true);
	}

}

dxGrid.prototype.enableResizing = function(){

	var arr = [];

	for(var i=0; i<this.dxObj.getColumnsNum()-1;i++){
		if(this.dxObj.getColType(i)=="cntr"){
			arr.push(false);
		}else{
			arr.push(true);
		}
	}

	return this.dxObj.enableResizing(arr.join());
}

dxGrid.prototype.enableDragAndDrop = function(boolean){
	return this.dxObj.enableDragAndDrop(boolean);
}


dxGrid.prototype.cs_setNumberFormat= function(colArr, format) {
    var defaultFormat = "0,000";
    if (format == undefined)
        format = defaultFormat;
    for (var i = 0; i < colArr.length; i++) {
        var colIndex = this.dxObj.getColIndexById(colArr[i]);
        this.dxObj.setNumberFormat(format, colIndex);
    }
}

dxGrid.prototype.setColumnExcellType = function(colIdx,type){
	return this.dxObj.setColumnExcellType(colIdx,type);
}

dxGrid.prototype.detachFooter = function(footerIdx){
	return this.dxObj.detachFooter(footerIdx);
}

dxGrid.prototype.enableMultiselect = function(flag){
	return this.dxObj.enableMultiselect(flag);
}

dxGrid.prototype.deleteRow = function(rId){
	return this.dxObj.deleteRow(rId);
}