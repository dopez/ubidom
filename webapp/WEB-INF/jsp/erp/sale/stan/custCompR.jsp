<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var grid;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 8, 9], "1C"); /*공급업체조회 */

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                layout.cells("b").attachObject("bootContainer2");

                grid = new dxGrid(subLayout.cells("a"), false);
                grid.addHeader({name:"코드",       colId:"custCode",    width:"80", align:"center",  type:"ro"});
                grid.addHeader({name:"고객명",     colId:"custKorName", width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"대표자명",   colId:"director",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"사업자번호", colId:"custNumb",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"법인번호",   colId:"lawNumb",     width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"업태", 	   colId:"bussCode",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"종목", 	   colId:"bussKind",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"주소", 	   colId:"custAddress", width:"150", align:"left",   type:"ro"});
                grid.addHeader({name:"전화번호",   colId:"telNo",       width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"팩스번호",   colId:"faxNo",       width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"이름", 	   colId:"stopDate",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"직책", 	   colId:"stopDate",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"소속", 	   colId:"stopDate",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"HP번호", 	   colId:"stopDate",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"전화번호",   colId:"stopDate",    width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"이메일", 	   colId:"eMail",       width:"80", align:"left",   type:"ro"});
                grid.addHeader({name:"거래여부",   colId:"useYn",       width:"80", align:"center", type:"ro"});
                grid.setColSort("str");
                grid.setUserData("","pk","custCode");
                grid.init();

                fn_search();
            })

            function fn_search(){

				gfn_callAjaxForGrid(grid,gfn_getFormElemntsData("frmSearch",{},[]),"search",subLayout.cells("a"));

			};
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
			 		<div class="row">
						<div class="form-group form-group-sm">
							<div class="col-sm-8 col-md-8">
								<label class=" col-sm-2 col-md-2 control-label" for="textinput">
								거래처코드
								 </label>
								<div class="col-sm-2 col-md-2">
								    <input name="custCode" id="custCode" type="text" value="" placeholder="" class="form-control input-xs">
								</div>
								<label class=" col-sm-2 col-md-2 control-label" for="textinput">
								거래처명
								</label>
								<div class="col-sm-4 col-md-4">
									<input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
								</div>
							</div>
						</div>
					</div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                                <div class="col-sm-10 col-md-10">
                                    <input type="checkbox" name="custKindA" value="1" checked="checked">매출
                                    <input type="checkbox" name="custKindB" value="2">매입
                                    <input type="checkbox" name="custKindL" value="3">외주
                                    <input type="checkbox" name="custKindH" value="4">금융
                                    <input type="checkbox" name="custKindC" value="5">품질
                                    <input type="checkbox" name="custKindZ" value="6">총무
                                    <input type="checkbox" name="custKindE" value="7">Buyer
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>