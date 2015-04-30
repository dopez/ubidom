<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <style>
            table {
                text-align: center;
                vertical-align: middle;
            }
        </style>



        <table class="table table-bordered">
            <tr>
                <td id="appv" rowspan="2">
                    결
                    <br>
                    <br>재
                </td>
                <td id="appv">작성</td>
                <td id="appv">검토</td>
                <td id="appv">승인</td>
            </tr>
            <tr>
                <td id="appv" class="col-md-3">
                    <div class="col-sm-8 col-md-8 appvBottomPadding">
                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                    <div>
                        <select class="form-control input-xs">
                            <option>결재</option>
                            <option>미결</option>
                            <option>전결</option>
                            <option>부결</option>
                        </select>
                    </div>
                </td>
                <td id="appv" class="col-md-3">
                    <div class="col-sm-8 col-md-8 appvBottomPadding">
                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                    <div>
                        <select class="form-control input-xs">
                        	<option>결재</option>
                            <option>미결</option>
                            <option>전결</option>
                            <option>부결</option>
                        </select>
                    </div>
                </td>
                <td id="appv" class="col-md-3">
                    <div class="col-sm-8 col-md-8 appvBottomPadding">
                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <button type="button" class="btn btn-default form-control" name="" id="" onclick="gfn_load_popup('결재자 선택','common/empPOP')">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                    <div>
                        <select class="form-control input-xs">
                        	<option>결재</option>
                            <option>미결</option>
                            <option>전결</option>
                            <option>부결</option>
                        </select>
                    </div>
                </td>
            </tr>
        </table>