/**functin(a,b,c
 * [a,b,c]
 *
 */

function gfn_temp(grid,data){

	var input = $("<input>").appendTo("body");
	for(var i=0;i<data.length;i++){
		for (var key in data[i]) {
	        if(grid.dxObj.getUserData("","@"+key)!= null){
	        	var msk_format = grid.dxObj.getUserData("","@"+key);
	        	if(msk_format != null){
		        	$(input).mask(msk_format).val(data[i][key]).keyup();

		        	data[i][key] = $(input).val();
	        	}

	        }
		}


	};
	grid.clearAll();
    grid.parse(data, "js");


}
function gfn_getMappingUrl(param){
	var tabId = parent.mainTabbar.getActiveTab();
	var uri = parent.mainMenu.getUserData(tabId, "uri");
	uri = "/"+uri+"/"+param;
	return uri.trim();
}

function gfn_callAjaxComm(param,url,callbackFn) {
	if (!url.match(/\\$/)) url = gfn_getMappingUrl(url);

	$.ajax({
    	url:  url,
        type: "POST",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
        data: param,
        async: false,
        dataType: "json",
        success: function(data, status) {
            if (callbackFn != undefined) {
                callbackFn.call(this, data);
            }
        },
        error: function(xhr) { // if error occured
            console.log(xhr.statusText + xhr.responseText);
        }
    });

}

function gfn_callAjaxForGrid(grid, param, url, layout, callbackFn) {
	if (!url.match(/\//g)) url = gfn_getMappingUrl(url);
	$.ajax({
    	url:  url,
        type: "POST",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
        data: param,
        async: true,
        dataType: "json",
        beforeSend: function() {
            layout.progressOn();
        },
        success: function(data, status) {
        	
       	 if (callbackFn != undefined) {
             callbackFn.call(this, data);
         }
       	 
            grid.clearAll();
            grid.parse(data, "js");
            
       
        },
        failure: function(data) {
            console.log(data.d);
        },
        complete: function() {
            layout.progressOff();
        },
        error: function(xhr) { // if error occured
            console.log(xhr.statusText + xhr.responseText);
        }
    });
}


function gfn_callAjaxForForm(formId, p_data, url, callbackFn) {

	if (!url.match(/\//g)) url = gfn_getMappingUrl(url);
    $.ajax({
        url: url,
        type: "POST",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
        data: p_data,
        async: false,
        dataType: "json",
        beforeSend: function() {},
        success: function(data) {

           	if (callbackFn != undefined) {
                callbackFn.call(this, data);
            }
           	$("#" + formId).exSetDataInFrom(data[0]);
        },
        complete: function() {

        },
        error: function(xhr) { // if error occured
            console.log(xhr.statusText + xhr.responseText);
        }
    });
}


function gfn_getFormElemntsData(formId,added) {
	function addElements(formId,added){
		  for(var key in added){
		       $('<input>').attr({
		            type: 'hidden',
		            id: "",
		            name: key
		       }).appendTo("#"+formId).addClass('crud-added');
			}
		}

		function editElements(){
			$("#"+formId+" *").filter(':input').each(function(){
			    $("#"+formId+" input[class*='format']").each(function(){
			    	$.applyDataMask($(this));
			    	$(this).val($(this).cleanVal());
			    });
			});
		}
		function createElements(formId){
			   $("#"+formId).find(':checkbox').each(function() {
			       var els = $('<input>').attr({
			            type: 'hidden',
			            id: "",
			            name: $(this).attr("name")
			        }).appendTo("#"+formId).addClass("crud-added");

			        if ($(this).is(":checked")) {
			            $(els).val($(this).val())
			        } else {
			        	$(els).val("");
			        }
			    });
		}
		function resetElements(){
			$("class^=crud").remove();
		}
		addElements(formId,added);
		editElements(formId);
		var enyUrl =  $("#"+formId).serialize();
		createElements(formId);
		console.log("enyUrl",enyUrl);
		return enyUrl;
}
