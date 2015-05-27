//<<<<<<< HEAD
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
        async: false,
        dataType: "json",
        beforeSend: function() {
            layout.progressOn();
        },
        success: function(data, status) {

//        	gfn_temp(grid,data);

//        	 if (callbackFn != undefined) {
//                callbackFn.call(this, data);
//        	 }
//        		console.log(data);
//
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
//            MsgManager.alertMsg("WRN040");
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
//            MsgManager.alertMsg(xhr);
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
//		function disableElements(stay){
//			for(var i in stay){
//				stay[i].addClass("crud-stay");
//			}
//		}
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
//		disableElements(stay);
		editElements(formId);
		var enyUrl =  $("#"+formId).serialize();
		createElements(formId);
		console.log("enyUrl",enyUrl);
		return enyUrl;
}




//=======
/**functin(a,b,c
 * [a,b,c]
 *
 */
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
        beforeSend: function() {

        },
        success: function(data, status) {
            if (callbackFn != undefined) {
                callbackFn.call(this, data);
            }
        },
        failure: function(data) {
            console.log(data.d);
        },
        complete: function() {

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
            MsgManager.alertMsg("WRN040");
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


            gfn_setDataInFrom($("#" + formId), data[0]);

            if (callbackFn != undefined) {
                callbackFn.call(this, data);
            }

        },
        complete: function() {

        },
        error: function(xhr) { // if error occured
            MsgManager.alertMsg(xhr);
            console.log(xhr.statusText + xhr.responseText);
        }
    });
}


function gfn_getFormElemntsData(formId, extraData) {

    var submitData;
    var formEl = $("<form>").appendTo("body");

    $("#" + formId).find(':input').each(function() {
        $(this).clone().appendTo(formEl);
    })

    $(formEl).find(':input').each(function() {

        if ($(this).is('[class^="format_"]')) {
            $(this).val($(this).cleanVal());
        }
        if ($(this).is("input[type='checkbox']")) {
            $('<input>').attr({
                type: 'hidden',
                id: "",
                name: $(this).attr("name")
            }).appendTo(formEl);

            if ($(this).is(":checked")) {
                $("input:hidden[name='" + this.name + "']").val($(this).val())
            } else {
                $("input:hidden[name='" + this.name + "']").val("");
            }
        }

    });

    submitData = $(formEl).serializeArray();

	 for (var i in submitData) {
		 submitData[i].forEach(function(key, val) {
	            if (submitData[i].name == key) {
	                submitData[i].value = val;
	            } else {
	                submitData.push({
	                    "name": key,
	                    "value": val
	                });
	            }
		    });
		};

    $(formEl).remove();
    return $.param(submitData);
}

function gfn_setDataInFrom($form, data) {

    $(':input', $form)
        .not(':button, :submit, :reset, :hidden')
        .val('')
        .removeAttr('checked')
        .removeAttr('selected');

    $form.find('select').each(function() {
        $(this).prop('selectedIndex', 0);
    });

    var els = $form.find(':input').get(); // get input elements from Form

    if (typeof data != 'object') {
        data = {};
        $.each(els, function() {
            if (this.name && !this.disabled && (this.checked || /select|textarea/i.test(this.nodeName) || /text|hidden|password/i.test(this.type))) {
                data[this.name] = $(this).val();
                if(this.type=="text")$(this).keyup();
            }
        });
        return data;
    } else {
        $.each(els, function() {
            if (this.name && data[this.name]) {
                if (this.type == 'checkbox' || this.type == 'radio') {
                    $(this).attr("checked", (data[this.name] == $(this).val()));
                } else {
                    $(this).val(data[this.name]);
                }
            }
        });
        return $(this);
    }
};
//>>>>>>> branch 'master' of https://github.com/dopez/ubidom.git
