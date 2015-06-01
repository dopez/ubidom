/**
 * 
 */

var dxgrid = (function (Ubi) {
		
	Ubi.dxgrid ={
			dxObj:null,
			conf:{
					columns:null,
					hiddenColumns:null,
					attachHeader:null
			},
			init:function (grid,header) {
				this.dxObj = grid;
				grid.setImagePath("/component/imgs/");
				grid.setSkin("dhx_skyblue");
				grid.setDateFormat("%Y-%m-%d");
					
				for (var prop in header) {
					  if(prop == "columns"){
						this.conf.columns = header[prop];
					  }else if(porp == "attachHeader"){
						this.conf.hiddenColumns = header[prop];
					  }else if(porp == "attachFooter"){
						this.conf.multiLineColumns = header[prop];
					  }	  
				}
		    	
		    	var rs = iterator(this.conf.columns);
		    	decorator(grid,rs);
		    	setCommonOptionOfGrid(grid);
		    	
		    	grid.setStyle(
		    		    "font-weight:normal;border-bottom-width:2px;",
		    		    "","",""
		    	);
//		    	grid.enableHeaderMenu();
		    	grid.init();	
		    	
		    	for(var i=0; i<10; i++){
		    		var newId = (new Date()).valueOf();
		    		grid.addRow(newId,"");
		    	}
		  },
		  getGrid:function(){
			  return this.dxObj;
		  }
	}
		
	var iterator = function(columns){
		var rs = {};
		rs.label = [];
		rs.width = [];
		rs.sort  = [];
		rs.type  = [];
		rs.align = [];
		var counterCol = {label:"&nbsp",width:"40",type:"cntr",sort:"na",align:"right"};
		columns.splice(0,0,counterCol);
		for(var i=0; i<columns.length;i++){
			$.each(columns[i],function(key,value){
				rs[key].push(columns[i][key]);
			});
		}
		return rs;
	}
	
	var decorator = function(grid,obj){
		
		for(var key in obj){
			var val = obj[key].join();
			if(key == "label"){
				grid.setHeader(val);
//				if(this.conf.multiLineColumns != null){
//					setMultiLineColumns(this.conf.multiLineColumns);
//				}
			}else if(key == "width"){
				grid.setInitWidths(val);
			}else if(key == "align"){
				grid.setColAlign(val);
			}else if(key == "type"){
				grid.setColTypes(val);
			}else if(key == "id"){
				grid.setColumnIds(val);
			}else if(key == "validator"){
				grid.setColValidators(val);
			}
		}
	}
	var setColumnHidden = function(grid,h_columns){	
//		for(var i=0;i<h_columns.length;i++){
//			var colIdx=grid.getColumnsNum()-1;
//			grid.insertColumn(colIdx);
//			grid.setColumnId(colIdx,h_columns[i]);
//			grid.setColumnHidden(colIdx,true);
//			
//		}
	}
	
	var setMultiLineColumns = function(grid,m_columns){
		for(var i=0; i<m_columns.length; i++){
			grid.attachHeader(m_columns[i]);
		}
	}
	
    var setCommonOptionOfGrid = function(grid){
    	grid.enableAutoHeight(true);
    	grid.enableBlockSelection(true);
    	grid.enableCellIds(true);
    	grid.enableColumnAutoSize(true);
    	grid.enableEditEvents(true,false,true);
 
    }
   
    var setAttachCommonEventOfGrid = function(grid){

    }
    return Ubi;
    
})(Ubi || {});