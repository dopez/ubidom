/* Validation Rule */
var g_dxRules = null;
var r_notEmpty = "notEmpty";
var r_onlyNumber = "onlyNumber";
var r_specialChar = "specialChar";
var r_alphaNumeric = "alphaNumeric";
var r_len = "len";
var r_minLen = "minLen";
var r_maxLen = "maxLen";
var g_frRules = null;

function gfn_gridLoad(url, data, grid, callback) {
	var rtn = "";
	
	$.ajax({
		"url":url,
		"type":"get",
		"data":data
	}).done(function(jsonData) {
		if(jsonData!="") {
			rtn = {"total_count":jsonData.length, "pos":0, "data":jsonData};
			grid.load(rtn);		
			if (callback != null) { 
				callback();
			}
        } else {
        	grid.getDxObj().clearAll();
        	alert("No Data");
        	
        	/*
        	var data = new Array(grid.getDxObj().getColumnCount());
        	data[0] = "NO DATA";
			grid.getDxObj().addRow("1", data);
        	grid.getDxObj().setColspan(grid.getDxObj().getSelectedId(),0,grid.getDxObj().getColumnCount());
        	*/
        }
	});
}

//object empty 여부 체크. Undefined, null, '', 배열 혹은 json의 길이가 0이면 true를 반환한다.
function gfn_isEmpty(obj) {
	var isBlack = function(string){
		return (!string || $.trim(string)=="");
	};

	if(typeof obj == 'string'){
		return isBlack(obj);
	} else if(typeof obj == 'number' || typeof obj == 'boolean' || obj instanceof Number){
		var tmp = obj.toString();
		return isBlack(tmp);
	} else if(typeof obj == 'function'){
		return false;
	} else if( obj instanceof Array ){	//배열일 때 배열안의 값을 체크하여 공백이면 empty
		if( obj.length < 1 )
			return true;
		else{
			var rtn = true;
			$.each( obj, function(i, v){
				if( '' != $.trim(v) )
					rtn = false;
			} );
			return rtn;
		}
	} else {
		return $.isEmptyObject(obj);
	}
}

function gfn_checkNumber(onvalue) {
	count = 0;
	var i;
	for (i = 0; i < onvalue.length; i++) {
		ls_one_char = onvalue.charAt(i);

		if (ls_one_char.search(/[0-9]/) == -1) {
			count++;
		}
	}
	if (count != 0) {
		return false;
	} else {
		return true;
	}
}

function gfn_checkAlphaNumeric(onvalue) {
	count = 0;
	var i;
	for (i = 0; i < onvalue.length; i++) {
		ls_one_char = onvalue.charAt(i);

		if (ls_one_char.search(/[0-9|a-z|A-Z]/) == -1) {
			count++;
		}
	}
	if (count != 0) {
		return false;
	} else {
		return true;
	}
}

/*
 * desc : 입력 값 특수문자(%,<,> 등) check
 * input : obj -> 객체
 * return : Boolean(정상여부)
 */
function gfn_checkXSS(chkValue, bolMsg)
{
	var exp = /[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\@\ \"\:\.\,\+\-\=\/\(\)\{\}\?\~\!\#\_\[\]\月\火\水\木\金\土\日]/;
	count = 0;
	
	var i;
	for (i = 0; i < chkValue.length; i++) {
		one_char = chkValue.charAt(i);
		if (one_char.search(exp) == -1) {
			if(bolMsg) {
				MsgManager.alertMsg("WRN060");
			}
			return false;
		}
	}
	
	return true;
}

/* ---------------------
* Validation Check Start */
function gfn_validation(colId, colNm, colVal){
	if (g_dxRules == null) return true;
	
	var rule = g_dxRules[colId];
	if(typeof rule == 'undefined' || rule == null || rule == "") return true;

	return gfn_ruleCheck(colNm, colVal, rule);
}

function gfn_ruleCheck(colNm, colVal, rules){
	var rule;
	
	for(var i = 0; i < rules.length; i++) {
		
		if(rules[i].split("|").length == 1) {
			
			rule = rules[i];
		
			if (rule==r_notEmpty) {
				if (gfn_isEmpty(colVal)) {
					alert(colNm + "이(가) 빈값입니다.");
					return false;
				}
			} else if (rule==r_onlyNumber) {
				if (! gfn_checkNumber(colVal)) {
					alert(colNm + "는(은) 숫자만 입력가능합니다.");
					return false;
				}
			} else if (rule==r_specialChar) {
				if (! gfn_checkXSS(colVal, false)) {
					alert(colNm + "는(은) 특수문자 입력이 금지되어있습니다.");
					return false;
				}
			} else if (rule==r_alphaNumeric) {
				if (! gfn_checkAlphaNumeric(colVal, false)) {
					alert(colNm + "는(은) 영숫자만 입력가능합니다.");
					return false;
				}
			}
			
		} else {
			
			rule = rules[i].split("|");
	
			if (rule[0]==r_len) {
				if (colVal.length != rule[1]) {	// byte길이계산 : gfn_getByteLength(colVal)
					alert(colNm + "는(은) 입력값이 " + rule[1] + "자리 입니다.");
					return false ;
				}
			} else if (rule[0]==r_minLen) {
				if (colVal.length < rule[1]) {	// byte길이계산 : gfn_getByteLength(colVal)
					alert(colNm + "는(은) 입력값이 최소 " + rule[1] + "자리 입니다.");
					return false ;
				}
			} else if (rule[0]==r_maxLen) {
				if (colVal.length > rule[1]) {	// byte길이계산 : gfn_getByteLength(colVal)
					alert(colNm + "는(은) 입력값이 최대 " + rule[1] + "자리 입니다.");
					return false ;
				}
			}
		}
	}
	
	return true;
}