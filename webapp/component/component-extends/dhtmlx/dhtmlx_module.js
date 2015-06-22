var Ubi = (function() {
	
	var config = {
		layout:null,
		subLayout:null,
		toolbar:null,
		searchArea:null
	};
    
    var f_layout_default_opt = {
       parent:     "container",    
       pattern:    "3E",           
       skin:       "dhx_skyblue",
       cells: [ 
	       {
	           id:             "a",        
	           header:         false,      
	           height:         5, 
	       },
	       {
	           id:             "b",       
	           header:         false,      
	           height:         30   
	          
	       },
	       {
	           id:             "c",       
	           header:         false,      
	           collapse:       false        
	          
	       }
	    ]
	};

	var setContainer = function(se, btn_id_arr, thi) {
	    if(se == 0){
		    f_layout_default_opt.pattern = "2E";
		    f_layout_default_opt.cells.pop();
		    delete f_layout_default_opt.cells[1]["height"];
		    setLayout();
	        setToolbar(se, btn_id_arr, false);
	        setSubLayout(thi,"b");
	    } else {
	        setLayout();
	        setToolbar(se, btn_id_arr, true);
	        setSubLayout(thi,"c");
	    }
	}; 
	    
	var setLayout = function(){
	    config.layout = new dhtmlXLayoutObject(f_layout_default_opt);
        config.layout.cells("a").fixSize(true,true);
        config.layout.cells("b").fixSize(true,true);
	    $(window).resize(function(){
	    	config.layout.setSizes();
	    });
	};
    
	var setToolbar = function(height_level,btn_id_array,bln){
		var height_arr = [50,80,114,144];
		config.toolbar = config.layout.cells("a").attachToolbar();
		var size = 18;
		btn_id_array.push(11);
		config.toolbar.clearAll();
		config.toolbar.setIconSize(18);
		config.toolbar.setIconsPath("/images/button/dhtmlx/");
		config.toolbar.loadStruct("/common/json/button.json",fn_onLoad);
		function fn_onLoad(){
			var item_id_set_arr = [1,2,3,4,5,6,7,8,9,10,11];
		    
		    for(var i=0; i< btn_id_array.length; i++){
		    	var index = item_id_set_arr.indexOf(btn_id_array[i]);
		        if (index > -1) {
		            item_id_set_arr.splice(index, 1);
		        }
		    }
		    
		    for(var i=0; i<item_id_set_arr.length; i++){
			    config.toolbar.removeItem("btn"+item_id_set_arr[i]); // item
			    config.toolbar.removeItem("sep"+item_id_set_arr[i]); // seperator
		    } 
		}

        config.layout.cells("a").setHeight(32); // fixed 
        
        if(bln){
        	config.layout.cells("b").setHeight(height_arr[height_level-1]);
        }

    }
	
    var setSubLayout = function(pattern,cellId){
    	config.subLayout = config.layout.cells(cellId).attachLayout(pattern);
    
	    $(window).resize(function(){
	    	config.subLayout.setSizes();
	    });
    
	    config.subLayout.forEachItem(doItemAction);
        
        function doItemAction(cell) {
            cell.hideHeader();
        }
    };
    
    var getLayout = function(){
    	return config.layout;
    };
    
    var getToolbar = function(){
    	return config.toolbar;
    };
    
    var getSubLayout = function(){
    	return config.subLayout;
    };
    
    return {
	    setContainer : setContainer,
	    getLayout:getLayout,
	    getToolbar:getToolbar,
	    getSubLayout:getSubLayout
    };
    
})();
function fn_exit(){
	var mainTabbar = parent.mainTabbar;
	var forTest = parent.forTest;
		mainTabbar.tabs(forTest).close();
	}
