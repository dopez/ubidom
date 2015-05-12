/**
 * 
 */
function gfn_callAjaxForGrid(grid,param,url,layout,callback){
	$.ajax({
       url: url,
       type: "POST",
       contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
       data: param,
       async: true,
       dataType: "json", 
       beforeSend: function() {
            layout.progressOn();
       },
       success: function(data) {
                    	
        grid.clearAll();
        grid.parse(data, "js");
        callback(data);
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

$.fn.serializeObject = function serializeObject(){
	
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

function gfn_callAjaxForForm(formId,param,url){
				
	$.ajax({
          url: url,
          type: "POST",
          contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
          data: param,
          async: true,
          dataType: "json", 
          beforeSend: function() {       	
           },
         success: function(data) {
            gfn_setDataInFrom($("#"+formId),data);
          },
         complete: function() {
          },
          error: function(xhr) { // if error occured
               MsgManager.alertMsg("WRN040");
               console.log(xhr.statusText + xhr.responseText);
           }
    });
};

function gfn_setDataInFrom($form,data){
	
       var els = $form.find(':input').get(); // get input elements from Form
       if(typeof data != 'object') {
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