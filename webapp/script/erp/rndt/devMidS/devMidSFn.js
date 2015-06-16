function fn_setDate(){
    var t = dateformat(new Date());
    byId("stDate").value = t;
}
function fn_textAreaSetbg(color)
{
	document.getElementById("contents").style.background=color
	document.getElementById("remarks").style.background=color
}