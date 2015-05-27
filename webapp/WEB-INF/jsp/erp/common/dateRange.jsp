<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="row">
          <div class="form-group form-group-sm">
              <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                  기간 </label>
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