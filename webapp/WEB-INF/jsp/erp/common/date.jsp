<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="row">
           <div class="form-group form-group-sm">
               <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                   일자 </label>
               <div class="col-sm-2 col-md-2">
                   <div class="col-sm-10 col-md-10">
                       <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs">
                   </div>
                   <div class="col-sm-2 col-md-2">
                       <input type="button" id="calpicker1" class="calicon form-control">
                   </div>
               </div>
               <div class="col-sm-1 col-md-1">
                   <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                       <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                   </div>
               </div>
           </div>
       </div>