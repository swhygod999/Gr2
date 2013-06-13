<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cht.paas.util.CloudLogger"%>
<%@ page import="cht.paas.util.LogLevel"%>

<%
	request.setCharacterEncoding("UTF-8");

	//check 驗證碼
	String answer = request.getParameter("answer");
	String sessAns = (String) session.getAttribute("ans");
	try {
		if (answer.length() > 1 && answer.compareTo(sessAns)==0) {
%>
{"status":"100"}
<%
	} else {
%>
{"status":"200"}
<%
	}
	} catch (Exception e1) {
		e1.printStackTrace();
%>
{"status":"300"}
<%
	}
%>


