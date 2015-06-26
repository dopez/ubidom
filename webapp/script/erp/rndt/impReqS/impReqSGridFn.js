function getColIdx(colId){
	/*grid colIdx 가져옴*/
	var colIdx = gridMain.getColIndexById(colId);
	return colIdx;
}
function gridGetVal(rId,gridNm,colId){
	/*get cell value*/
	var colIdx = gridNm.getColIndexById(colId);
	var colVal = gridNm.setCells(rId,colIdx).getValue();
	return colVal;
}
function gridSetVal(gridNm,colId,val,rowId){
	var colIdx = gridNm.getColIndexById(colId);
	if(rowId==null||rowId==""||typeof rowId=="undefined"){
	    var selRowIdx = gridNm.getSelectedRowIndex();
		gridNm.setCells2(selRowIdx, colIdx).setValue(val);
	}else{
		gridNm.setCells(rowId, colIdx).setValue(val);
	}
} 