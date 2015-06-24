<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>jqGrid RowSpan Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/themes/redmond/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="/component/jqGrid/ui.jqgrid.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
<script type="text/javascript" src="/component/jqGrid/grid.locale-kr.js"></script>
<script type="text/javascript" src="/component/jqGrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/component/jqGrid/json2.js"></script>
<script type="text/javascript">
	$.jgrid.no_legacy_api = true;
	$.jgrid.useJSON = true;
</script>
<script type="text/javascript">
	$(function () {
		'use strict';
		
		// 1. RowSpan 대상컬럼수만큼 생성(country, state)
		var prevColOne = { cellId: undefined, value: undefined };
		var prevColTwo = { cellId: undefined, value: undefined };
		var prevColThree = { cellId: undefined, value: undefined };
	
		// 2. RowSpan 대상컬럼 속성에 cellattr 지정(변수명이 중복되지 않도록 정의)
		$("#list").jqGrid({
		    url : "/erp/sys",
		    mType: "get",
			datatype: "json",
			colNames: ['sysNm', 'viewIdx', 'useYn', 'strCdate', 'strCuser'],
			colModel: [
				{ name: 'sysNm', width: 150, align: 'center', 
					cellattr: function (rowId, val, rawObject, cm, rdata) {
						var result;
						if (prevColOne.value == val) {
							result = ' style="display: none" spanOne="' + prevColOne.cellId + '"';
						} else {
							var cellId = this.id + '_one_' + rowId + '_' + cm.name;
							result = ' onespan="1" id="' + cellId + '"';
							prevColOne = { cellId: cellId, value: val };
						}
						return result;
					}
				},
				{ name: 'viewIdx', width: 150, align: 'center', 
					cellattr: function (rowId, val, rawObject, cm, rdata) {
						var result;
						if (prevColTwo.value == val) {
							result = ' style="display: none" spanTwo="' + prevColTwo.cellId + '"';
						} else {
							var cellId = this.id + '_two_' + rowId + '_' + cm.name;
							result = ' twospan="1" id="' + cellId + '"';
							prevColTwo = { cellId: cellId, value: val };
						}
						return result;
					}
				},
				{ name: 'useYn', width: 150, align: 'center',
					cellattr: function (rowId, val, rawObject, cm, rdata) {
						var result;
						if (prevColThree.value == val) {
							result = ' style="display: none" spanThree="' + prevColThree.cellId + '"';
						} else {
							var cellId = this.id + '_two_' + rowId + '_' + cm.name;
							result = ' threespan="1" id="' + cellId + '"';
							prevColThree = { cellId: cellId, value: val };
						}
						return result;
					}
				},
				{ name: 'strCdate', width: 150, align: 'center' },
				{ name: 'strCuser', width: 150, align: 'center' }
			],
			cmTemplate: {sortable: false},
			rowNum: 100,
			gridview: true,
			hoverrows: false,
			autoencode: true,
			ignoreCase: true,
			viewrecords: true,
			height: '100%',
			caption: 'Grid with RowSpan attributes',
			beforeSelectRow: function () {
				return false;
			},
			gridComplete: function () {
				// 3. RowSpan 정의
				var grid = this;
				$('td[onespan="1"]', grid).each(function () {
					var spans = $('td[spanOne="' + this.id + '"]', grid).length + 1;
					if (spans > 1) $(this).attr('rowspan', spans);
				});
				$('td[twospan="1"]', grid).each(function () {
					var spans = $('td[spanTwo="' + this.id + '"]', grid).length + 1;
					if (spans > 1) $(this).attr('rowspan', spans);
				});
				$('td[threespan="1"]', grid).each(function () {
					var spans = $('td[spanThree="' + this.id + '"]', grid).length + 1;
					if (spans > 1) $(this).attr('rowspan', spans);
				});
			}
		});
	});
</script>
</head>
<body>
	<form name="frmSearch" method="post" target="_blank" action="/erp/sys/excel">
	<input type="button" value="Excel" onclick='frmSearch.submit();'>
	</form>
    <table id="list"><tr><td/></tr></table>
</body>
</html>