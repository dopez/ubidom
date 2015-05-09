// init
var ubi = (function() {
	 
	
	var count = 0;
	var status = true;
    var layout;
	var sub_layout;	
    var tlbar;
    var srh_form;
    var cnt_portal;
    var nav;
    var f_layout_default_opt ={
    		 
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
	    	        height:        	30   
	    	       
	    	    },
	    	    {
	    	        id:             "c",       
	    	        header:         false,      
	    	        collapse:       false        
	    	       
	    	    }
	    	]
    };
    
    var g_default_opt = {
    		
    		edit:false,
    		footer:false
    };
    
    var f_default_opt = {
    
    		isParentObj:false
    };
    
    var init = function(se,btn_id_arr,thi){
   
    	setLayout();
 
    	setToolbar(se,btn_id_arr);
      
    	setSubLayout(thi);
    	
//    	setEvtWinResize(layout);
    }; 
    
    var setLayout = function(){
    	
    	layout = new dhtmlXLayoutObject(f_layout_default_opt);


    };
    
    var setToolbar = function(height_level,btn_id_array){
    	
    	var height_arr = [50,80,114,144];
    	
    	toolbar = layout.cells("a").attachToolbar();
    	
        var size = 18;
        
        toolbar.clearAll();
        toolbar.setIconSize(18);
        toolbar.setIconsPath("/images/button/dhtmlx/");
        toolbar.loadStruct("/common/json/button.json",fn_onLoad);

        function fn_onLoad(){
        	
        	var item_id_set_arr = [1,2,3,4,5,6,7,8,9,10];
        	
        	for(var i=0; i< btn_id_array.length; i++){
        		var index = item_id_set_arr.indexOf(btn_id_array[i]);
                if (index > -1) {
                	item_id_set_arr.splice(index, 1);
                }
        	}
        	
        	for(var i=0; i<item_id_set_arr.length; i++){
        	
        		toolbar.removeItem("btn"+item_id_set_arr[i]);	// item
        		toolbar.removeItem("sep"+item_id_set_arr[i]); // seperator
        	}	
        }

        layout.cells("a").setHeight(32); // fixed 
        layout.cells("b").setHeight(height_arr[height_level-1]); // 1 to 4
 
    }
    var setSubLayout = function(pattern){
    	
    	sub_layout = layout.cells("c").attachLayout(pattern);
        
        sub_layout.forEachItem(doItemAction);
        
        function doItemAction(cell) {
            // actions, for example:
            cell.hideHeader();
        }
    };
    var isPublished = function(){
    	return status;
    }
    // calling iterator
   
    var getUniqId = function(){
    	return count++;
    };
   
    var getDataSet = function(){
     	var x={};
     	x.layout = layout;
     	x.slayout = sub_layout;
     	x.btn = toolbar;
//     	layout.cells("a").showHeader();
//     	x.layout.cells("a").showHeader();
     	setEvtWinResize(x.layout);
     	return x;
    };
    var setEvtWinResize = function(layout){
    	$(window).resize(function(){
    		layout.setSizes();
    	});
    }
    return {
    	getUniqId : getUniqId,
    	init 	  : init,
    	getDataSet : getDataSet,
    	isPublished:isPublished
  
    };
    
})();

function fn_load_popup(view_name){
	
	var w1;
	
	if( $('#win').length < 1){
		var $div = $('<div />').appendTo('body');
		$div.attr('id', 'win');
	}

	dhxWins = new dhtmlXWindows();
	dhxWins.attachViewportTo("win");

	w1 = dhxWins.createWindow("w1", 20, 30, 320, 200);

	// iframe, get
	w1.attachURL("/erp/popup/common/"+view_name+".do");
	
	return w1;
}

function fn_get_data(object,param,request_url){
	
	var req = $.ajax({
		url: request_url,
		data:param,
		type: "POST",
		dataType: "json"
	});
	req.done(function(jsonData) {
		if("[]"!=JSON.stringify(jsonData)) {
			if( object.is( "form" )){
				
			}else{
				object.parse(json, "js");
			}
		} else {
			MsgManager.alertMsg("WRN040");
		}
	});
}

function create_chart(){
	
}

function fn_set_data_form(data){

    var els = $("#searchConditionForm").find(':input').get(); // get input elements from Form

    if(typeof data != 'object') {
        // return all data
        data = {};

        $.each(els, function() {
            if (this.name && !this.disabled && (this.checked
                            || /select|textarea/i.test(this.nodeName)
                            || /text|hidden|password/i.test(this.type))) {
                data[this.name] = $(this).val();
            }
        });
        return data;
    } else {
        $.each(els, function() {
            if (this.name && data[this.name]) {
                if(this.type == 'checkbox' || this.type == 'radio') {
                    $(this).attr("checked", (data[this.name] == $(this).val()));
                } else {
                    $(this).val(data[this.name]);
                }
            }
        });
        return $(this);
    }
};	 

$.fn.serializeObject = function serializeObject()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
