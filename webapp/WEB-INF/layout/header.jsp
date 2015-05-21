<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
response.setHeader("Pragma","no-cache");
response.setHeader ("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>

<title>ERP</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache; no-store; no-save">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE">

<script type="text/javascript" src="/common/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/common/js/sockjs-0.3.js"></script>
<script type="text/javascript" src="/component/jquery-validation-1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="/component/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/component/bootstrap-datepicker-1.4.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/common/js/common.js"></script>
<script type="text/javascript" src="/common/js/dhtmlx_full.js"></script>
<script type="text/javascript" src="/common/js/msg_manager.js"></script>
<link rel="stylesheet" type="text/css" href="/component/bootstrap-3.3.2-dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/component/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="/component/bootstrap-datepicker-1.4.0/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" type="text/css" href="/component/bootstrap-3.3.2-dist/css/bootstrap_extends.css" />
<link rel="stylesheet" type="text/css" href="/common/css/common.css" />
<link rel="stylesheet" type="text/css" href="/component/dhtmlx.css" />
<link rel="stylesheet" type="text/css" href="/component/dhtmlx_extend.css" />
<!--dhtmlx Calendar 추가 -->
<script type="text/javascript" src="/component/dhtmlxCalendar/dhtmlxcalendar.js"></script>
<link rel="stylesheet" href="/component/dhtmlxCalendar/skins/dhtmlxcalendar_dhx_skyblue.css"/>
<link rel="stylesheet" type="text/css" href="/component/dxcalendar_extend.css" />
<!-- validation ko 추가 -->
<script type="text/javascript" src="/component/jquery-validation-1.13.1/localization/messages_ko.js"></script>
<script type="text/javascript" src="/common/js/jquery.mask.js"></script>

<!-- bootstrap fileupload  추가 -->
<script src="/component/jqueryFileupload/js/jquery.1.9.1.min.js"></script>

<script src="/component/jqueryFileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="/component/jqueryFileupload/js/jquery.iframe-transport.js"></script>
<script src="/component/jqueryFileupload/js/jquery.fileupload.js"></script>

<!-- bootstrap just to have good looking page -->
<script src="/component/jqueryFileupload/bootstrap/js/bootstrap.min.js"></script>
<link href="/component/jqueryFileupload/bootstrap-fileresize.css" type="text/css" rel="stylesheet" />

<!-- we code these -->
<link href="/component/jqueryFileupload/css/dropzone.css" type="text/css" rel="stylesheet" />
<script src="/component/jqueryFileupload/js/myuploadfunction.js"></script>