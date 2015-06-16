/**
 *
 */
var msk_options =  {
  onComplete: function(cep) {
//	 console.log('CEP Completed!:', cep);
  },
  onKeyPress: function(cep, event, currentField, options){

//    console.log('An key was pressed!:', cep, ' event: ', event,
//                'currentField: ', currentField, ' options: ', options);
  },
  onChange: function(cep){

//    console.log('cep changed! ', cep);

  },
  onInvalid: function(val, e, f, invalid, options){
	var error = invalid[0];
	var offset = $(e.currentTarget).offset();
	var posY = offset.top - $(window).scrollTop();
	var posX = offset.left - $(window).scrollLeft();

	dhtmlx.message({
	    text:"잘못 된 값입니다.",
	    expire:500

	});

	$( ".dhtmlx_message_area" ).css("top",posY-30).css("left",posX).css("position","absoulte");



	console.log ("Digit: ", error.v, " is invalid for the position: ", error.p, ". We expect something like: ", error.e);
  }
};

$(function(){
	  $('.format_date').mask('0000/00/00', $.extend(msk_options,{placeholder: "____/__/__"}));
	  $('.format_month').mask('0000/00', $.extend(msk_options,{placeholder: "____/____"}));
	  $('.double').mask('000,000.00', $.extend(msk_options,{reverse: true,placeholder: "000.00"}));
	  $('.format_jumin').mask('000000-0000000', msk_options);

});