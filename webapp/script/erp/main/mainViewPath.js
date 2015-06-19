function getViewFullPath(id){
	var finalPath="";
	var path;
	var level;
	var initPath = mainMenu.getDxObj().getItemText(id);

	level = mainMenu.getDxObj().getLevel(id);
	mainMenu.getDxObj().selectItem(id);
	do {

		var parentId = mainMenu.getDxObj().getParentId(id);
		path = " > "+mainMenu.getDxObj().getItemText(parentId);
		finalPath = path+finalPath;
		id = parentId;
		level--;
	}while (level > 1);
	$("#pathbar").val(finalPath.slice(2)+" > "+initPath);
}