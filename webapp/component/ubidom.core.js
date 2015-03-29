/***
 * @AnonymousClosures
 */


/** jQuery.
 * 
 */
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
/** JavaScript.
 * 
 */
Date.prototype.setFormattedDate = function() {
	   var yyyy = this.getFullYear().toString();
	   var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
	   var dd  = this.getDate().toString();
	   return yyyy +"-"+ (mm[1]?mm:"0"+mm[0])+"-"+ (dd[1]?dd:"0"+dd[0]); // padding
};

Array.prototype.contains = function ( needle ) {
	   for (i in this) {
	       if (this[i] == needle) return true;
	   }
	   return false;
}
/** Ubidom.
 * 
 */
(function ($) {
    $.Ubidom = {
      "SearchArea":{
    	  "inputPopup":"inputPopup()", //
    	  "hiddenForm":"hiddenForm(paramObjectArray)", // create hidden input field
    	  "hiddenFieldSet":"hiddenFieldSet" 
      },
      "SlickGrid":{
    	  "gridOptions":"gridOptions(options)",                              // set grid option
    	  "createGrids":"createGrids(dataSet,arrayOfGrids)",                 // create the Grids
    	  "setConditonForGetData":"",
    	  "customGridEvnentsSet":"customGridEvnentsSet(grid,dataView,data)", // set Custom Grid's Event.
    	  "gridCommonEvtSet":"gridCommonEvtSet(grid,dataView,data)",         // set Common Grid's Event.
    	  "getDataFromServer":"getDataFromServer(index,searchParam,dataSet)",// get Data From Server
    	  "crudStatusByDel":"crudStatusByDel(item)",                         //
    	  "crudStatusByAdd":"crudStatusByAdd(item)",						 //
    	  "crudStatus":"crudStatus()",										 //
    	  "refreshGrid":"refreshGrid()",										 // refresh Data of Grid
    	  "crudStatusByDel2":"crudStatusByDel2(item)",                         //
    	  "crudStatusByAdd2":"crudStatusByAdd2(item)",						 //
    	  "crudStatus2":"crudStatus2()",										 //
    	  "refreshGrid2":"refreshGrid2()",										 // refresh Data of Grid
    	  "crudStatusByUpdate2":"crudStatusByUpdate2()"
    		  
      },
      "Global":{
    	  "getPageInfo":"getPageInfo(appkind)",								 // get Page's number 
    	  "downloadExcel":"downloadExcel",									 // download excel files
    	  "createHiddenForm":"createHiddenForm(paramObjectArray)",			 //
    	  "saveDataToServer":"saveDataToServer",							 // save Data to Server.
    	  "fullScreenGrid":"fullScreenGrid",									 // close layout of north.
    	  "creatingChart":"creatingChart",
    	  "accessPrivateFunction":"accessPrivateFunction"
      }
    };
   
    // Ubidom의 prototype function으로 기본적으로 제공되며, 필요할 경우 재정의하여 사용한다
	$.Ubidom.Global.prototype = {
			customGridEvnentsSet : function(){return;},           // set Custom Grid's Event.
			gridMetaDataSet :  function(dataView,index){return;}, // set MetaData Of Grid.
			paramSetToModal : function(){return;}				  // set Parameter Property for Modal dialog. 
	};

    var grid;
    var count = 0;
    var accessPrivateFunction = function(param1,param2){
    	if(param1 == 0){
    		createModal(param2.name,param2.popupDepth);
    	}
    };
    var fullScreenGrid = function(){
    	if(!window.outerLayout.state.north.isClosed){
    		window.outerLayout.close('north');
    	}else{
    		window.outerLayout.open('north');
    	} 	
    };
//-----
    function checkGridIdentity(id){
    	var dataSetIdx;
    	for(var i=0; i < arrayOfGrids.length; i++){
    		var item = arrayOfGrids[i].getData().getItemById(id);
    		if(item != undefined){
    			if(dataSet[i].hasOwnProperty("dataQueue")){
    				dataSetIdx = i;
    				return dataSetIdx;
    			}else{
    				dataSetIdx = "need not check crudstatus";
    				return dataSetIdx;
    			}
    		}
    	}
    };
    var crudStatusByUpdate2 = function(item){
    	var num = checkGridIdentity(item.id);
    	if(!isNaN(num)){
    		crudStatus2(item,num);
    	}
    };
    var crudStatusByDel2 = function(item){
    	var num = checkGridIdentity(item.id);
    	if(!isNaN(num)){
    	    switch(item.crudStatus){
    		case "":
    			item.crudStatus = "DELETE";
    			window.dataSet[num].dataQueue.push(item);
    			refreshData2(item,num);
    			return;
    		case "UPDATE":
    			item.crudStatus = "DELETE";
    			window.dataSet[num].dataQueue.push(item);
    			refreshData2(item,num);
    			return;
    		case "INSERT":
    			item.crudStatus = "DO DELETE";
    			refreshData2(item,num);
    			return;
    	    }
    	}
    };
	var crudStatusByAdd2 = function(item){
    	var num = checkGridIdentity(item.id);
    	if(!isNaN(num)){
    		dataSet[num].dataQueue.push(item);
    	}
	};
   function crudStatus2(item,index) {
	    switch(item.crudStatus){
	    	case "":
	    		item.crudStatus = "UPDATE";
	    		return window.dataSet[index].dataQueue.push(item);
	    	case "UPDATE":
	    		return refreshData2(item,index);
	    	case "INSERT":
	    		return refreshData2(item,index);
	    }; 
	};
	function refreshData2(item,index){
		if(window.dataSet[index].dataQueue.length == 0){
				window.dataSet[index].dataQueue.push(item);	
		}else{
			for(var i=0; i< window.dataSet[index].dataQueue.length; i++){
				if(window.dataSet[index].dataQueue[i].id == item.id){		
					var idx = i;
					var deletedItem="";
					if (idx > -1) {
						deletedItem = window.dataSet[index].dataQueue.splice(idx, 1);
					}
					if(deletedItem[0].crudStatus != "DO DELETE"){
						window.dataSet[index].dataQueue.push(item);
					}
				}
			};
		}

	}
	function onCellChange(item, column, editCommand){

		editCommand.execute();
    	var num = checkGridIdentity(item.id);
    	if(!isNaN(num)){
    		crudStatus2(item,num);
    	}
		
	}
//-----
	var crudStatusByDel = function(index,dataQueue){	
//		var num = dItemId[0].dataQueue;
//		var dataQueue = window['dataQueue'+ num];
//		var item = jQuery.extend({}, dItemId[0]);
		var rowIdx = arrayOfGrids[index].getActiveCell().row;
		var dataView = arrayOfGrids[index].getData();
		var item = dataView.getItem(rowIdx);
		var itemId = item.id;
	    switch(item.crudStatus){
		case "":
			item.crudStatus = "DELETE";
			dataQueue.push(item);
			dataView.deleteItem(itemId);
			return;
		case "UPDATE":
			item.crudStatus = "DELETE";
			dataQueue.push(item);
			dataView.deleteItem(itemId);
			return;
		case "INSERT":
			dataView.deleteItem(itemId);
			return;
	    }
	};
	var crudStatusByAdd = function(index,args,dataQueue){
		var num = item.dataQueue;
		var dataQueue = window['dataQueue'+ num];
		item.crudStatus = "INSERT";
		dataQueue.push(item);
	};
    var crudStatus = function(index,args,dataQueue) {
//		var num = item.dataQueue;
//		var dataQueue = window['dataQueue'+ num];
//		console.log(dataQueue);
//		editCommand.execute();
		var dataView = arrayOfGrids[index].getData();
		var item = dataView.getItem(args.row);
		
	    switch(item.crudStatus){
	    	case "":
	    		item.crudStatus = "UPDATE";
	    		return dataQueue.push(item);
	    	case "UPDATE":
	    		return refreshData(item,dataQueue);
	    	case "INSERT":
	    		return refreshData(item,dataQueue);
	    }; 
	};
	function refreshData(item,dataQueue){
		if(dataQueue.length === 0){
			dataQueue.push(item);
		}else{
			for(var i=0; i< dataQueue.length; i++){
				if(dataQueue[i].id == item.id){		
					var index = i;
					if (index > -1) {
						dataQueue.splice(index, 1);
					}
					dataQueue.push(item);
				}
			};
		}

	}
	var refreshGrid = function(index,arrayOfGrids){
		var emptyData = [];
		var startNum = index + 1;
		for(var i=startNum; i<arrayOfGrids.length; i++){
			var dataView = arrayOfGrids[i].getData();
			dataView.setItems(emptyData);
		}
		arrayOfGrids[index].resetActiveCell();
	};
	
	var hiddenFieldSet =function(hiddenInputArray){	
		for(var i=0; i<hiddenInputArray.length; i++){
			$("form#searchConditionForm")
			.append('<input type="hidden" id="'+hiddenInputArray[i]+'" name="'+hiddenInputArray[i]+'" value="" />');
		}
	};
	
	// DO NOT USE ------------------------------------
	var createHiddenForm = function(paramObjectArray){
		
		$("<form id='hiddenForm' style='display:none'>").appendTo("body");
		
		for(var i=0; i<paramObjectArray.length; i++){
			$("<input type='hidden' name='"+paramObjectArray[i].name+"' value='"+paramObjectArray[i].value+"'>").appendTo("#hiddenForm");
		}
		var paramToPage = $("#hiddenForm").serializeArray();
		
		$("#hiddenForm").remove();
		
		return paramToPage;
	};
	// ====== END =====
// ====== Not USE =====
//    var downloadExcel = function(index,arrayOfGrids){
//
//    	var dataView = arrayOfGrids[index].getData();
//    	var row = dataView.getLength()-1;
//    	var col = arrayOfGrids[index].getColumns().length-1;
//    	
//    	arrayOfGrids[index].getSelectionModel().setSelectedRanges([new Slick.Range(row,col)]);
//    	
//    	var e = jQuery.Event("keydown");        
//    	e.which = 67;
//    	e.ctrlKey = true;
//    	parent.flag = false;
//    	arrayOfGrids[index].onKeyDown.notify(null, e);
//    	
//    };
// ====== END =====
	var creatingChart = function(chartObj){

		var dataLine = {
			labels : ["January","February","March","April","May","June","July"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					data : [65,59,90,81,56,55,40]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					data : [28,48,40,19,96,27,100]
				}
			]
		};
		var dataBar = {
				labels : ["January","February","March","April","May","June","July"],
				datasets : [
					{
						fillColor : "rgba(151,187,205,0.5)",
						strokeColor : "rgba(151,187,205,1)",
						data : [65,59,90,81,56,55,40]
					},
					{
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,1)",
						data : [28,48,40,19,96,27,100]
					}
				]
		};
		var dataRadar = {
			labels : ["Eating","Drinking","Sleeping","Designing","Coding","Partying","Running"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					data : [65,59,90,81,56,55,40]
				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					data : [28,48,40,19,96,27,100]
				}
			]
		};

		var dataPolarArea = [
		        	{
		        		value : 30,
		        		color: "#D97041"
		        	},
		        	{
		        		value : 90,
		        		color: "#C7604C"
		        	},
		        	{
		        		value : 24,
		        		color: "#21323D"
		        	},
		        	{
		        		value : 58,
		        		color: "#9D9B7F"
		        	},
		        	{
		        		value : 82,
		        		color: "#7D4F6D"
		        	},
		        	{
		        		value : 8,
		        		color: "#584A5E"
		        	}
		        ];
		var dataPie = [
		        	{
		        		value: 30,
		        		color:"#F38630"
		        	},
		        	{
		        		value : 50,
		        		color : "#E0E4CC"
		        	},
		        	{
		        		value : 100,
		        		color : "#69D2E7"
		        	}			
		];
		var dataDoughnut  = [
		        	{
		        		value: 30,
		        		color:"#F7464A"
		        	},
		        	{
		        		value : 50,
		        		color : "#E2EAE9"
		        	},
		        	{
		        		value : 100,
		        		color : "#D4CCC5"
		        	},
		        	{
		        		value : 40,
		        		color : "#949FB1"
		        	},
		        	{
		        		value : 120,
		        		color : "#4D5360"
		        	}

		];
		var $container;
		
		$container = "<div id='dialog' style='display:none;position:relative;'></div>"; // dialog container
	    
	    $($container).appendTo("body"); // body tag에 dialog container를 생성해준다
	    
		var chartCanvas = '<canvas id="myChart" width="600" height="500"></canvas>';
		
		$(chartCanvas).appendTo("#dialog");
		
		var ctx = $("#myChart").get(0).getContext("2d");
		
		var chartKind = chartObj.kind;
		var chartLabels = chartObj.labels;
		var chartDataArray = chartObj.datasets;

		function setChartData(chartKind,chartData){
			if(chartKind == "Line" || chartKind == "Radar" || chartKind == "Bar"){
				chartData.labels = chartLabels; 
				for(var i=0; i<chartDataArray.length; i++){		
					if("data" in chartData.datasets[i]){
						chartData.datasets[i].data = chartDataArray[i];
					}
				}
				chartData.datasets.splice(chartDataArray.length,chartData.datasets.length);
				return chartData;
			}else{
//				for(var i=0; i<data.length; i++){
//					dataObject[data+'value'][i].value = data[i];
//				}
//				return dataObject[data+'value'].splice(0,data.length);
			}
		}
		switch (chartKind) {
	      case "Line":
	    	  var data = setChartData("Line",dataLine);
	    	  new Chart(ctx).Line(data);
	    	  break;
	      case "Bar":
	    	  var data = setChartData("Bar",dataBar);
	    	  new Chart(ctx).Bar(data);
	    	  break;
	      case "Radar":
	    	  var data = setChartData("Radar",dataRadar);
	    	  new Chart(ctx).Radar(data);
	    	  break;
	      case "Pie":
	    	  var data = setChartData("Pie",dataPolarArea);
	    	  new Chart(ctx).Pie(data);
	    	  break;
	      case "PolarArea":
	    	  var data = setChartData("PolarArea",dataPie);
	    	  new Chart(ctx).PolarArea(data);
	    	  break;
	      case "Doughnut":
	    	  var data = setChartData("Doughnut",dataDoughnut);
	    	  new Chart(ctx).Doughnut(data);
	    	  break;
	    };  
	    
		var dialogOption = {
    		    autoOpen: true,
    		    position: 'center',
    		    title: "그래프",
    		    draggable: true,
    		    minWidth:200,
    		    width : 640,
    		    height : 600,
    		    resizable : true,
    		    modal : false,
    		    close: function( event, ui ) {
    		    	$("#dialog").remove();
    		    }
		};
		
		$("#dialog").dialog(dialogOption); // add dialog option
		$("#dialog").css('display','block'); 
		$("#dialog").css("padding", 0);
//		$("#dialog").css("background-color","#CCCCCC");

		$("#dialog").dialog("open");  // dialog open
		
    };	
		// JAVA SCRIPT's object를 form의 input field value값으로 설정해준다.
		function setDataInFrom(data){

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

	var getPageInfo = function(appkind){
		var menuEls = $("#menu_iframe").contents().find("#menu");

		var pageInfo = new Array();
		var pageObjet = {10:[["상품매입일보"],["approval/productPurchaseDailyReport"]],
					 15:[["재고조정일보"],["approval/stockAdjustmentDailyReport"]],
					 20:[["원재료매입일보"],["approval/rawmaterialPurchaseDailyReport"]],
					 30:[["금형매입일보"],["approval/moldPurchaseDailyReport"]],
					 40:[["외주가공매입일보"],["approval/outsourcingPurchaseDailyReport"]],
					 50:[["외상대금결제일보"],["approval/creditedPricePaymentDailyReport"]],
					 60:[["기타매입일보"],["approval/othersPurchaseDailyReport"]],
					 70:[["매출일보"],["approval/salesDailyReport"]],
					 80:[["원재료매출일보"],["approval/rawmaterialSalesDailyReport"]]};
		var pageParam;
		for(var key in pageObjet){

			if(key == appkind){
				pageInfo[key] = pageObjet[key];
				pageParam = pageInfo[key];
			}
		}
		return pageParam;
	};	
	var hiddenForm = function(paramObjectArray){
		
		$("<form id='hiddenForm' style='display:none'>").appendTo("body");
		
		for(var i=0; i<paramObjectArray.length; i++){
			$("<input type='hidden' name='"+paramObjectArray[i].name+"' value='"+paramObjectArray[i].value+"'>").appendTo("#hiddenForm");
		}
		var paramToPage = $("#hiddenForm").serializeArray();
		
		$("#hiddenForm").remove();
		
		return paramToPage;
	};
	var inputPopup = function(){
		var form = $('#searchConditionForm');
	    var divInput = $('div.inputPopup');
	    var width = divInput.width();

	    divInput.on('focus','input',function(){
	    	var searchImg = $($(this).next()).attr('id');
	    	var pageName  = $($(this).next()).attr('name');
	        $(this).parent().css('background-color', '#fff').css('padding-right','35px').addClass('focus');
	        $("#"+searchImg).css({display: 'inline-block'});
	        $("#"+searchImg).unbind('mousedown').mousedown(function(){
	        	createModal(pageName);
	        });
	    });
	    divInput.on('blur','input',function(){
	    	var searchImg = $($(this).next()).attr('id');
	        $(this).parent().css('background-color','#FCFCFC').css('padding-right','15px').removeClass('focus');
	        $("#"+searchImg).css({display: 'none'});
	    });
	    divInput.on('keydown','input',function(e){
	    	var code = e.keyCode || e.which;
	    	if(code == 13){
		    	var searchImg = $($(this).next()).attr('id');
		    	var pageName  = $($(this).next()).attr('name');
		    	$(this).parent().css('background-color','#FCFCFC').css('padding-right','15px').removeClass('focus');
		        $("#"+searchImg).css({display: 'none'});
		    	createModal(pageName);
	    	}
	    });
	    form.on('click','input:button',function(e){
	    	var buttonId = $(this).attr('id');
	    	createModal(buttonId);
	    });
	    
	};
	function createModal(popupName,popupDepth){
		
		var num = count++; 

		var $container;
		
		$container = "<div id='dialogContainer"+ num +"' style='display:none' class='dialogContainer'></div>"; // dialog container
	    
	    $($container).appendTo("body"); // body tag에 dialog container를 생성해준다
	
		var iframeTag = '<iframe frameborder="No" id="iframe'+num+'" name="iframe'+num+'" scrolling="No" src=" " width="100%" height="100%" marginwidth="0" marginheight="0" ></iframe>';
		
		$(iframeTag).appendTo("#dialogContainer"+num); // dialog container에 iframe를 생성해준다

		// popup이 열릴 때, 필요한 parameter를 main page의 변수에 저장해 준다.
		if (typeof paramSet == 'function' || typeof customParamSet == 'function') { 
//			console.log(paramSet(popupName));
		    top.receiveParam = paramSet(popupName);
		}
		var popupDepth;
		if(popupDepth == undefined){
			popupDepth = $("[name='"+popupName+"'").attr('alt'); // 팝업 소스 위치정보를 불러온다
		}
		if (popupDepth == 2){
			$("#iframe"+num).attr('src','../../popup/common/'+popupName); // for server
		}
		else if (popupDepth == 3){
			$("#iframe"+num).attr('src','../../../popup/common/'+popupName); // for server
		}
		else if (popupDepth == 4){
			$("#iframe"+num).attr('src','../../../../popup/common/'+popupName); // for server
		}
		else {
			$("#iframe"+num).attr('src','../popup/common/'+popupName); // for server
		}
//		$("#iframe"+num).attr('src','../popup/common/'+popupName); // for server
//		$("#iframe"+num).attr('src','../popup/common/'+popupName+".html"); // for ui

		var options = {};
		
		// set dialog options
		var defaluts = {
    		    autoOpen: true,
    		    position: 'center',
    		    title: "loading..",
    		    draggable: true,
//    		    minWidth:200,
    		    width : 500,
    		    height : 600,
    		    iframe: true,
    		    iframeFix: true,
//    		    autoResize: true,
    		    resizable : true,
    		    modal : true,
    		    close: function( event, ui ) {
    		    	$('#dialogContainer'+ num).remove();
    		    }
		};
		options = $.extend(true, {}, defaluts, options);
//        $("#dialogContainer"+num).resizable({
//            handles: 'all'
//        });
		
		$("#dialogContainer"+num).dialog(options); // add dialog option
		$("#dialogContainer"+num).draggable({ iframeFix: true });
		$("#dialogContainer"+num).dialog({
			  dragStart: function (event, ui) {
			      $("iframe", this).each(function() {
			          $('<div class="ui-draggable-iframeFix" style="background: #FFF;"></div>')
			          .css({
			              width: '100%', height: '100%',
			              position: 'absolute', opacity: '1', zIndex: 1000, overflowX: 'hidden'
			          })
			          .css($(this).position())
			          .appendTo($(this).offsetParent());
			      });
			  },
			  dragStop: function (event, ui) {
			      $("div.ui-draggable-iframeFix").each(function() {
			        this.parentNode.removeChild(this); }); //Remove frame helpers
			      }
		});
		$("#dialogContainer"+num).css('display','block'); 
		$(".ui-dialog-content").css("padding", 0);
		$(".ui-dialog-content").css("overflow", "hidden");
		$("#dialogContainer"+num).css("background-color","#CCCCCC");
		
    	$("#iframe"+num).load(function(){    		
        	var title = $(this).contents().find("title").text();
        	$("span.ui-dialog-title").text(title); 
//        	resizeFrame(num);
        	
    	});
		$("#dialogContainer"+num).dialog("open");  // dialog open
		
		$("#dialogContainer"+num).bind('dialogclose', function(event) {
			top.receiveParam = undefined;
			top.enableTabs();
		});
		top.disableTabs();

	}

		
		




		 
		

	var gridOptions = function(options){
		
			var defaults = {
//					asyncEditorLoading: true,  			// ==> Default value: false. Makes cell editors load asynchronously after a small delay to speed up the keyboard navigation.
//					asyncEditorLoadDelay: 100, 			// ==> Default value: 100 (100ms). Delay after which cell editor is loaded. This value is used only when 'asyncEditorLoading' is 'true'.
//					asyncPostRenderDelay: 50,  			// Default value: 50  (50ms).
//					autoEdit: false,		   			// ==> Default value: true.  When 'autoEdit' is false, a cell will not automatically go into edit mode when selected.
//					autoHeight: false,		   			// ==> Default value: false. When 'autoHeight' is true, slickgrid's vertical scroll bar will be disabled and use a browser's verticall scrolling.
//					cellFlashingCssClass: "flashing",  	// Default value: 'flashing'
//					cellHighlightCssClass: "selected", 	// Default value: 'selected'
//						// dataItemColumnValueExtractor: null, // Default value: null
//					defaultColumnWidth: 80,	   			// Default value: 80 (80 pixels)	
//						// defaultFormatter: defaultFormatter, // Default value: defaultFormatter
//					editable: false,			   			// ==> Default value: false. When 'editable' is true, it allows cells to be edited.
//						// editCommandHandler: queueAndExecuteCommand, // Default value: queueAndExecuteCommand
//						// editorFactory: null,				// Default value: null
//						// editorLock: Slick.GlobalEditorLock, // Default value: Slick.GlobalEditorLock. For controlling concurrent data edits
//					enableAddRow: false,				// ==> Default value: false. If true, a blank row will be displayed at the bottom - typing values in that row will add a new one. Must subscribe to onAddNewRow to save values.
//					enableAsyncPostRender: false, 		// Default value: fasle. If true, async post rendering will occur and asyncPostRender delegates on columns will be called.
//					enableCellNavigation: true, 		//Default value: true.  Appears to enable cell virtualisation for optimised speed with large datasets
//					enableColumnReorder: false,  		// Default value: true. Dataview-filter test에서도  'true'로 해놓았음.
//					enableTextSelectionOnCells: true, 	// ==> Default value: false. If 'true', it enables to select texts from cells.	
//					forceFitColumns: false, 			// Default value: false. If 'true', Force column sizes to fit into the container.
//					forceSyncScrolling: false,   		// ==> Default value: false.
//						// formatterFactory: null, 			// Defaulr value: null
//					fullWidthRows: false, 				// Default value: false. If 'true', will expand the table row divs to the full width of the container, 
//						//headerRowHeight: 25, 				// Default value: 25 (25 pixels)
//					leaveSpaceForNewRows: false, 		// ==> Default value: false. Enables scrolling up of the last row to the top of the screen.
//					multiColumnSort: false,				// ==> Default value: false. 
//					multiSelect: true,					// ==> Default value: true. Enables multiple selection.
//					rowHeight: 25,						// Default value: 25 (25 pixels).
//					selectedCellCssClass: "selected", 	// Default value: 'selected'
//						//showHeaderRow: false,				// ==> Default value: false. If 'true', it dislays one extra row right under the colmun header row.
//					syncColumnCellResize: true, 		// ==>Default value: false. If 'true', the column being resized will change its width as the mouse is dragging the resize handle.
//					topPanelHeight: 25,					// Default value: 25 (25 pixels)		
//					// == Below are for Filter.	==
//				 	showHeaderRow: false,   // enable showing header row for filters
//				 	headerRowHeight: 0,   // filter header row height
//				 	explicitInitialization: true   // <-- Filter input field를 프로그램에서 생성해서 붙이기 위해서는  필수사항.
				      explicitInitialization: true,
				      rowHeight: 25,
				      defaultColumnWidth: 80,
				      enableAddRow: false,
				      leaveSpaceForNewRows: false,
				      editable: false,
				      autoEdit: false,
				      autoEditAddRow: false, 
				      enableCellNavigation: true,
				      enableColumnReorder: false,
				      asyncEditorLoading: true,
				      asyncEditorLoadDelay: 100,
				      forceFitColumns: false,
				      enableAsyncPostRender: false,
				      asyncPostRenderDelay: 50,
				      autoHeight: false,
				      editorLock: Slick.GlobalEditorLock,
				      showHeaderRow: false,
				      headerRowHeight: 25,
				      showTopPanel: false,
				      topPanelHeight: 25,
				      formatterFactory: null,
				      editorFactory: null,
				      cellFlashingCssClass: "flashing",
				      selectedCellCssClass: "selected",
				      multiSelect: true,
				      enableTextSelectionOnCells: true,
				      dataItemColumnValueExtractor: null,
				      fullWidthRows: false,
				      multiColumnSort: false,
				      forceSyncScrolling: false,
				      editCommandHandler:onCellChange
			}; // end options1
			
			options = $.extend({}, defaults, options);
			return options;
	};
	
	function myFilter(item) {	
		var columnFilter = window.columnFilter;
		for ( var columnId in columnFilter ){	

		    if ((item[columnId] != "" && item[columnId] != undefined && item[columnId] != null) &&  
			    (columnFilter[columnId] != "" && columnFilter[columnId] != null && columnFilter[columnId] != undefined)) {
		    	if((item[columnId].toUpperCase().indexOf(columnFilter[columnId]) == -1))
		    	return false;
		    }
		}	
		return true;
	};
	
	var pluginOptions = {
			    clipboardCommandHandler: function(editCommand){ undoRedoBuffer.queueAndExecuteCommand.call(undoRedoBuffer,editCommand); },
			    includeHeaderWhenCopying : false
	};
	// createGrids function. ( 그리드 객체생성에 필수적인 4개의 인자만으로 이루어진 기본적인 그리드를 생성해준다. ) 
	var createGrids = function(dataSet,arrayOfGrids){
			
			for(var i=0; i< dataSet.length; i++) { 	
				
				var grid;
				
				var dataView = new Slick.Data.DataView();
				
				var d = dataSet[i]; // dataSet은 Grid가 생성되기 위해 필요한 정보를 담고 있는 변수이다
				
				grid = new Slick.Grid(d.name, dataView, d.columns, d.options);
				
				arrayOfGrids.push(grid); // push Grid object in Array
			}
			createGridObjects(dataSet,arrayOfGrids);
	};// END - createGrids function.
	
	// createGridObjects function. ( 생성된 그리드에 이벤트와 메소드의 기능적인것들과 요구조건에 맞는 데이터등을 더 해준다 ) 
	function createGridObjects(dataSet,arrayOfGrids){
		
		  for(var i=0; i< dataSet.length; i++) { 
			  
			    grid = arrayOfGrids[i];
			    
			    var dataView = grid.getData();
			  	
			  	var d = dataSet[i];
			  	
			  	$.Ubidom.Global.prototype.gridMetaDataSet(dataView,i); // load function of gridMetaDataSet. 	
			  	
			  	gridCommonEvtSet(grid,dataView,d.data);	// load function of gridCommonEvtSet.
			  	
			  	$.Ubidom.Global.prototype.customGridEvnentsSet(grid,dataView,dataSet,i); // load function of customGridEvnentsSet.
				
				setConditonForGetData(i,dataSet,arrayOfGrids,true);
				
		  }
	}// END - createGridObjects function.
	
	// setConditonForGetData function. (  ) 
	var setConditonForGetData = function(index,dataSet,arrayOfGrids,init){

		if(top.receiveParam != undefined){ // page load될 때, 다른 page에서 넘겨받은 parameter가 있는 경우
			init = false;
			searchParam = top.receiveParam; 
		}else{	// load page at first.
			searchParam =  $('#searchConditionForm').serializeObject(); // translate data of form to javascript objcet.
		}
		
		var loginObj = top.loginObj[0]; // login object of main page

		if(init){ // load page at first .
			searchParam = $.extend({}, searchParam, loginObj); 
		}else{    // load page by event.
			searchParam = $.extend({}, loginObj, searchParam); 
		}
	
		setDataInFrom(searchParam); // set value in form 

		var dataView = arrayOfGrids[index].getData();

		getDataFromServer(index,searchParam,dataSet,arrayOfGrids);
		
		dataView.setItems(dataSet[index].data);
		
		dataView.setFilter(myFilter);
		
		arrayOfGrids[index].init();
		
//		arrayOfGrids[index].getSelectionModel().setSelectedRanges([]);
		
		arrayOfGrids[index].resetActiveCell(); 
		
	};// END - setConditonForGetData function.

	var getDataFromServer = function(index,searchParam,dataSet,arrayOfGrids){

		$.ajax({
			url: dataSet[index].url ,  
			type:'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
			data: searchParam,
			dataType: "json", 
			async:false,
			success: function(data, textStatus, jqXHR){	
				// TEST용 DATA Genertation Field.
				//------------------------------------------
//				data = [] ;
//			    function DataItem(i) {
//				    this.num = i;
//				    this.itemName = "itemName" + i;
//				    this.itemSpec = "itemSpec" + i;
//				    this.nextProg = "nextProg" + i;
//				    this.nextCust = "nextCust" + i;
//				    this.deliCust = "deliCust" + i;
//				    this.soyoMatrName = "soyoMatrName" + i;
//				    this.orderQty = "orderQty" + i;
//				}
//			    for (var i = 0; i < 500000; i++) {
//				      data[i] = new DataItem(i);
//				}
			    //------------------------------------------
				console.log('data is ...',data);
				if(typeof data[0] == 'object'){
					if(data[0].hasOwnProperty("message")){
						alert(data[0].message);
						var currentVal= $("#setGroup").val();
						$("#setGroup").val(currentVal - 1);
						return false;
					}
				}
//				if(typeof data[0] == "object"){
				
//					if(data[0].hasOwnProperty("maxNum")){
//						$("#setGroup").attr("max",String(Number(data[0].maxNum)-1));
////						maxGroupNum = Number(data[0].maxNum);
//					}
//				}
				dataSet[index].data = data;
				dataSet[index].dataQueue = [];
				
				for (var i = 0; i < dataSet[index].data.length; i++) {
					
					dataSet[index].data[i].id = idCountNum++;
//					dataSet[index].data[i].dataQueue = index+1;
				}	
				var dataVeiw = arrayOfGrids[index].getData();
				dataVeiw.setItems(dataSet[index].data);
//				arrayOfGrids[index].getSelectionModel().setSelectedRanges([]);
				arrayOfGrids[index].resetActiveCell();
				return;
			},
			error: function(data, textStatus, errorThrown){
				alert(ERROR_MSG_SERVER_DATA_DOWNLOAD);
													  
			}
		}); 
		receiveParam = undefined;
	};
	var saveDataToServer = function(index,dataSet,arrayOfGrids,dataQueue){
		
		// 변경된 data가 하나도 없는 경우에는 서버에 data 저장 request를 보내지 않는다.
		if (dataQueue.length == 0){
			alert(INFO_MSG_NO_DATA_TO_SAVE);  // INFO_MSG_NO_DATA_TO_SAVE = "저장할 데이터가 없습니다."
			return;
		} // end if
		
		if(top.receiveParam != undefined){ // page load될 때, 다른 page에서 넘겨받은 parameter가 있는 경우
			init = false;
			searchParam = top.receiveParam; 
		}else{	// load page at first.
			searchParam =  $('#searchConditionForm').serializeObject(); // translate data of form to javascript objcet.
		}
		
		var loginObj = top.loginObj[0]; // login object of main page
        //console.log(loginObj);

		searchParam = $.extend({},loginObj ,searchParam ); 
		
		
		searchParam = $.extend({}, searchParam, {"grid": JSON.stringify(dataQueue)}); 
		console.log('searchParam',searchParam);
		$.ajax({
			url: dataSet[index].saveUrl,   // (Servlet) URL to update master detail codes ( Absolute URL: )
			type:'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: searchParam,		
			dataType: "text",  //"json",  // 서버의 return data type
			async:false ,
			success: function(data, textStatus, jqXHR){	
				
				// 데이터를 저장할 때 서블렛에서 setting한 message가 그대로 Browser에 온다. 
				// Browser에서 값을 잘라 읽어내어 사용한다.
				// Message Format: 
				// (1) 저장 성공일 경우: data = "success;"
				// (2) 저장 실패일 경우: data = "fail;SQL-error-message-text...."
				var resultMsg = data.split(";");
				console.log('resultMsg[1]',resultMsg)
//			console.log(resultMsg);
				var successOrFail = resultMsg[0];  // "success" or "fail" 값
				
				// // ===== NOTE =====// 
				// success일때는, 서버 return값은 'success' or 'session out'
				// SQL Error가 발생하면 아무 값도 return 하지 않아 ajax error가 발생하게 한다.
				if (successOrFail == "success"){
					alert(INFO_MSG_SAVED_SUCCESSFULLY);  // INFO_MSG_SAVED_SUCCESSFULLY = "저장완료.\n\n확인 버튼을 누르면 서버에서 데이터를 다시 가져옵니다." 
				
						
				    $("#setGroup").val(Number(resultMsg[2]));
					
				    if(arrayOfGrids[index].getData().getItems().length < 1)
				    	$("#setGroup").val(0);
				    
				    setConditonForGetData(index,dataSet,arrayOfGrids);
				} else if (successOrFail == "fail") {
					var SQLErrorMsgFromServer = resultMsg[1];
					alert(INFO_MSG_SAVE_FAILED_WITH_REASON  + SQLErrorMsgFromServer);   // 서블렛이 보내온 SQL Error Message를 덧 붙여서 alert창을 띄운다.
																			
					//alert("저장에 실패했습니다.\n그 이유는 아래와 같습니다.\n\n" + SQLErrorMsgFromServer);  // 서블렛이 보내온 SQL Error Message를 덧 붙여서 alert창을 띄운다.
				} else if (successOrFail == "msg") {
					var SQLMsgFromServer = resultMsg[1];
					alert(INFO_MSG_EMPTY_MESSAGE  + SQLMsgFromServer);
					setConditonForGetData(index,dataSet,arrayOfGrids);
					//alert("저장에 실패했습니다.\n그 이유는 아래와 같습니다.\n\n" + SQLErrorMsgFromServer);  // 서블렛이 보내온 SQL Error Message를 덧 붙여서 alert창을 띄운다.
				}else {
					
					//$("#content_area_container").html(data);					

				} // end if	
			},
			error: function(data, textStatus, errorThrown){
				alert(INFO_MSG_SAVE_FAILED_WITHOUT_REASON);  // INFO_MSG_SAVE_FAILED_WITHOUT_REASON = "저장에 실패했습니다." 
			}
		}); // end $.ajax({ });  서버에서 Master Code 가져오기.	
	};
	function gridCommonEvtSet(grid,dataView,data){
		
//		grid.setSelectionModel(new Slick.CellSelectionModel());
		
	    //grid.getCanvasNode().focus();
	    
//	    grid.registerPlugin(new Slick.CellExternalCopyManager(pluginOptions));
	    
		grid.onHeaderRowCellRendered.subscribe(function(e, args) {
			
			var columnId = args.column.id;
			  
			if(columnId == SEQ_NUM_COLUMN_ID){
			  	return ;
			}
			
		    $(args.node).empty();
	
		    $("<input type='text'>").attr("id", columnId).appendTo(args.node);
		    
		    if (columnFilter[columnId] == undefined){
		    	columnFilter[columnId] = "";
		    }else{
		    	$("input#"+columnId).val(columnFilter[columnId]);  
		    }
		    
		});

		$(grid.getHeaderRow()).delegate(":input", "change keyup", function (e) {
	
			var columnId = $(this).attr("id");
			
		    columnFilter[columnId] = $.trim($(this).val().toUpperCase());
		      
			dataView.refresh();
			  
		});

		dataView.onRowCountChanged.subscribe(function (e, args) {
		  		grid.updateRowCount();
		  		grid.invalidate();
		  		grid.render();
		});
		  
		dataView.onRowsChanged.subscribe(function (e, args) {
				grid.invalidateRows(args.rows);
				grid.invalidate();
				grid.render();
		});

		$(window).resize(function() { 
			grid.resizeCanvas();
	    });
		
		grid.onHeaderClick.subscribe(function (e, args) {

		});
		
		grid.onColumnsReordered.subscribe(function(e, args){

		}); 
		grid.onSort.subscribe(function(e , args) {

			function comparerAlphabetic(a, b){
				return a[args.sortCol.field] > b[args.sortCol.field] ? 1 : -1;
			} 		
			function comparerNumeric(a, b){
			    	
			    var aFieldValue;
			    var bFieldValue;
			    
			    if (a[args.sortCol.field] == "") {
			    	aFieldValue = Number.NEGATIVE_INFINITY; // field의 값이 "" 이면 비교값으로 Javascript에서 가장 작은 수를 사용한다.
			    } else {
			    	aFieldValue = a[args.sortCol.field];    // field의 값이 ""이 아니면, field에 입력된 값을 비교값으로 사용한다.
			    }
			    
			  if (b[args.sortCol.field] == "") {
			    	bFieldValue = Number.NEGATIVE_INFINITY; // field의 값이 "" 이면 비교값으로 Javascript에서 가장 작은 수를 사용한다.
			    } else {
			    	bFieldValue = b[args.sortCol.field];    // field의 값이 ""이 아니면, field에 입력된 값을 비교값으로 사용한다.
			    }

				return aFieldValue - bFieldValue;
			} 

		 	if (args.sortCol.cssClass == COLUMN_DEF_CSS_CLASS_NAME_ALIGN_RIGHT){ 
		
		 		dataView.sort(comparerNumeric, args.sortAsc);
		 	} else {

		 		dataView.sort(comparerAlphabetic, args.sortAsc);
		 	}
		 	
		 	
		 	
		});
		grid.onActiveCellChanged.subscribe(function(e, args){

			if (args.cell == undefined ){
				return false;
			}
		});
	}

	function hideColumnFilterLine(){
		
		grid.setHeaderRowVisibility(false);		
	}
	function showColumnFilterLine(){

		grid.setHeaderRowVisibility(true);
	}
	function toggleFilterRow(){

		grid.setHeaderRowVisibility(!grid.getOptions().showHeaderRow);
	}
	function initializeDataArrays(){
		
	}
	
	$.Ubidom.SearchArea.inputPopup = inputPopup;
	$.Ubidom.SearchArea.hiddenForm = hiddenForm;
	$.Ubidom.SearchArea.hiddenFieldSet = hiddenFieldSet;
	
	$.Ubidom.SlickGrid.gridOptions = gridOptions;
	$.Ubidom.SlickGrid.createGrids = createGrids;
	$.Ubidom.SlickGrid.getDataFromServer = getDataFromServer;
	$.Ubidom.SlickGrid.setConditonForGetData = setConditonForGetData;
	$.Ubidom.SlickGrid.crudStatus = crudStatus;
	$.Ubidom.SlickGrid.crudStatusByDel = crudStatusByDel;
	$.Ubidom.SlickGrid.crudStatusByAdd = crudStatusByAdd;
	$.Ubidom.SlickGrid.crudStatusByDel2 = crudStatusByDel2;
	$.Ubidom.SlickGrid.crudStatusByAdd2 = crudStatusByAdd2;
	$.Ubidom.SlickGrid.crudStatusByUpdate2 = crudStatusByUpdate2;
	
	$.Ubidom.Global.getPageInfo = getPageInfo;
//	$.Ubidom.Global.downloadExcel = downloadExcel;
	$.Ubidom.Global.createHiddenForm = createHiddenForm;
	$.Ubidom.Global.saveDataToServer = saveDataToServer;
	$.Ubidom.Global.fullScreenGrid = fullScreenGrid;
	$.Ubidom.Global.creatingChart = creatingChart;
	$.Ubidom.Global.accessPrivateFunction = accessPrivateFunction;
	
}(jQuery));

