var dxTree = function(obj, width, height, rootId){
	this.jsonData = new Array();
	this.nodeData = {};
	if (width == null) width = "100%";
	if (height == null) height = "600px";
	if (rootId == null) rootId = 0;
	
	this.dxObj =obj;
	this.dxObj.setImagePath("/component/dhtmlxTree/imgs/dhxtree_skyblue/");
};

dxTree.prototype.getDxObj = function(){
	return this.dxObj;
};

dxTree.prototype.setData = function(data){
	this.jsonData = data;
};

dxTree.prototype.click = function(fn){
	if(typeof fn == "function"){
		this.getDxObj().setOnClickHandler(fn);
	}
};

dxTree.prototype.getValue = function(nodeId, key){
	for(var k in this.nodeData){
		if(k == nodeId){
			return this.nodeData[k][key];
		}
	}
	return "";
};

dxTree.prototype.getUserData = function(nodeId, key){
	return this.getDxObj().getUserData(nodeId, key);
};

dxTree.prototype.attachEvent = function(eName, fName) {
	this.dxObj.attachEvent(eName, fName);
};

dxTree.prototype.load = function(nodeNm, parentNodeNm, textNm, menuTree){
	var arr = this._jsonToJSArray(nodeNm, parentNodeNm, textNm);
	this.dxObj.loadJSArray(arr, function (){
		var subItems = menuTree.getDxObj().getAllSubItems('0');
		var subItemArray = subItems.split(',');
		
		for(var k = 0; k < subItemArray.length; k++)
		{
			menucd = menuTree.getValue(subItemArray[k], "menucd");
			uri = menuTree.getValue(subItemArray[k], "uri");
			exegbn = menuTree.getValue(subItemArray[k], "exegbn");
			
			menuTree.getDxObj().setUserData(menucd, "uri", uri);
			menuTree.getDxObj().setUserData(menucd, "exegbn", exegbn);
		}
	});
};

dxTree.prototype._jsonToJSArray = function(nodeNm, parentNodeNm, textNm){
	var rtnArray = new Array();
	var nodeData = {};
	
	$.each(this.jsonData, function(i, row){
		var nodeId = row[nodeNm]+"";
		var pNodeId = row[parentNodeNm]+"";
		var text = row[textNm]+"";
		var rowArray = new Array();
		rowArray.push(nodeId);
		rowArray.push(pNodeId);
		rowArray.push(text);
		rtnArray.push(rowArray);
		nodeData[nodeId] = row;
	});
	
	this.nodeData = nodeData;
	return rtnArray;
};