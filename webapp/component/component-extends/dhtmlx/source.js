/**functin(a,b,c
 * [a,b,c]
 *
 */

function gfn_temp(grid,data,param, url, layout, callbackFn){

	for(var i=0;i<data.length;i++){
		for (var key in data[i]) {

	        	var classNm = grid.dxObj.getUserData("","@"+[key]);

	        	if(classNm != null){
	        		var input = $("<input type='hidden'>").appendTo("body");
	        		var gDate = data[i][key];
	        		$(input).attr("id",[key]);
	        		$('#'+[key]).attr("class",classNm);
	        		$('#'+[key]).val(data[i][key]);
	        		$('#'+[key]).keyup();
	        		data[i][key] = $('#'+[key]).val();
	        		if(gDate == $('#'+[key]).val()){
	        			gfn_callAjaxForGrid(grid, param, url, layout, callbackFn);
	        		}
	        	}
		  }
	};
	grid.clearAll();
    grid.parse(data,"js");

    return data;
}


function gfn_getMappingUrl(param){
	var tabId = parent.mainTabbar.getActiveTab();
	var uri = parent.mainMenu.getUserData(tabId, "uri");
	uri = "/"+uri+"/"+param;
	return uri.trim();
}

function gfn_callAjaxComm(param,url,callbackFn) {
	if (!url.match(/\//g)) url = gfn_getMappingUrl(url);
	var gData = [];
	$.ajax({
    	url:  url,
        type: "POST",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
        data: param,
        async: false,
        dataType: "json",
        success: function(data, status) {
        	gData=data;
            if (callbackFn != undefined) {
                callbackFn.call(this, data);
            }
        },
        error: function(xhr) { // if error occured

        }
    });
	return gData;
}

function gfn_callAjaxForGrid(grid, param, url, layout, callbackFn) {
	if (!url.match(/\//g)) url = gfn_getMappingUrl(url);
	var gData = [];
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

          gData = gfn_temp(grid,data,param, url, layout, callbackFn);

          if (callbackFn != undefined) {
              callbackFn.call(this, data);
           }
        },
        failure: function(data) {

        },
        complete: function() {
            layout.progressOff();
        },
        error: function(xhr) { // if error occured

        }
    });
	return gData;
}


function gfn_callAjaxForForm(formId, p_data, url, callbackFn) {
	var gData = [];
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
        	gData = data;
           	if (callbackFn != undefined) {
                callbackFn.call(this, data);
            }
           	$("#" + formId).exSetDataInFrom(data[0]);
        },
        complete: function() {

        },
        error: function(xhr) { // if error occured

        }
    });
    return gData;
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
			        	$(els).val('0');
			        }
			    });
		}
		if(added != undefined)addElements(formId,added);

		editElements(formId);
		createElements(formId);

		return  $("#"+formId).serialize();
}
