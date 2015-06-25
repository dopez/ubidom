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
function gridSetVal(gridNm,colId,val){
    var selRowIdx = gridNm.getSelectedRowIndex();
	var colIdx = gridNm.getColIndexById(colId);
	gridNm.setCells2(selRowIdx, colIdx).setValue(val);
} 