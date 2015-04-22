<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1,9], "2E"); //매입처별세금계산서집계표

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer");
                subLayout.cells("a").attachObject("bootContainer2");
                subLayout.cells("a").setHeight(250);

                //grid
                subLayout.cells("b").showHeader();
                subLayout.cells("b").setText("전자세금계산서");
                gridMain = subLayout.cells("b").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                gridMain.setHeader("일련번호,사업자등록번호,상호(법인명),매수,공급가액"+
                					",세액,비고");
                gridMain.setInitWidths("100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,right,right,right,left");
                gridMain.setColTypes("ron,ro,ro,ron,ron,ron,ro");
                gridMain.setColSorting("int,str,str,int,int,int,str");
                gridMain.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "edDate",
                    button: "calpicker2"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
        		});

        </script>
        <style>
        th{
        	text-align: center;
        }
        .table>tbody>tr>td{
        	vertical-align: middle;
        }
        .table{
        	text-align: center;
        	vertical-align: middle;
        }
        .amountAlign{
			text-align: right;
		}
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    년월 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
                    </div>
                </form>
            </div>
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                   <div class="form-group form-group-sm">
                       <table class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11 table table-bordered table-condensed">
                       	<thead>
                       		<tr class="active">
                       			<th colspan="2" class="col-sm-2 col-md-2">구&nbsp;&nbsp;&nbsp;분</th>
                       			<th class="col-sm-1 col-md-1">매입처수</th>
                       			<th class="col-sm-1 col-md-1">매&nbsp;&nbsp;&nbsp;수</th>
                       			<th class="col-sm-2 col-md-2">공급가액</th>
                       			<th class="col-sm-2 col-md-2">세&nbsp;&nbsp;&nbsp;액</th>
                       		</tr>
                       	</thead>
                       	<tbody>
                       		<tr>
                       			<td colspan="2">합&nbsp;&nbsp;&nbsp;계</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       		</tr>
                       		<tr>
                       			<td rowspan="3">전자세금계산서수취분</td>
                       			<td>사업자등록번호수취분</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       		</tr>
                       		<tr>
                       			<td>주민등록번호수취분</td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr>
                       			<td>소&nbsp;&nbsp;계</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       		</tr>
                       		<tr>
                       			<td rowspan="3">전자세금계산서이외수취분</td>
                       			<td>사업자등록번호수취분</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       		</tr>
                       		<tr>
                       			<td>주민등록번호수취분</td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       			<td></td>
                       		</tr>
                       		<tr>
                       			<td>소&nbsp;&nbsp;&nbsp;계</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       			<td class="amountAlign">0</td>
                       		</tr>
                       	</tbody>
                       </table>
                   </div>
                </form>
            </div>
        </div>