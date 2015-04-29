$(document).ready(function() {
	dhtmlXCalendarObject.prototype.langData["ko"] = {
			dateformat: '%Y/%m/%d',
			monthesFNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			monthesSNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			daysFNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토용;ㄹ"],
			daysSNames: ["일","월","화","수","목","금","토"],
			weekstart: 7,
			weekname: "주"
		}	
});
function setSens(flag,id, k) {
  if(flag ==1){
	if (k == "min") {
		 calMain.setSensitiveRange(byId(id).value, null);
	} else {
		calMain.setSensitiveRange(null, byId(id).value);
	}
  }
  if(flag ==2){
	  calMain.setSensitiveRange(new Date(), new Date());
  }
}

function byId(id) {
	return document.getElementById(id);
} 

function dateformat(date){ 
	var isdate= date;      

        var yyyy = isdate.getFullYear().toString();       
        var mm = (isdate.getMonth()+1).toString();       
        var dd  = isdate.getDate().toString();                                   
        return yyyy + '/' + (mm[1]?mm:"0"+mm[0]) + '/' + (dd[1]?dd:"0"+dd[0]);
}

function fn_monthLen(month){
	 var initMonth;
		if(month < 10){		
			initMonth = "0"+month;
		}else{
			initMonth = month;
		}
		return initMonth;
}