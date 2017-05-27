<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<c:catch var="error">
		<c:set target="d" property="d"></c:set>
		<br>
	</c:catch>
	<c:out value="${error }"></c:out>
	<br>

	<from action="index.jsp" method="post"> <input type="text"
		name="score" value="${param.score}" /> <input type="submit" /> </from>
	<c:if test="${param.score>=90}" var="result">
		<c:out value="恭喜你，你的成绩是优秀"></c:out>
	</c:if>
	<c:out value="${result}"></c:out>

	<!-- 档成绩大于等于90小于等于100 --优秀 -->
	<!-- 档成绩大于等于80小于等于90 --良好 -->
	<!-- 档成绩大于等于70小于等于80 --中等-->
	<!-- 档成绩大于等于60小于等于70 --及格 -->
	<!-- 小于60不及格 -->

	<c:choose>
		<c:when test="${param.score>=90 && param.score<=100}">
			<c:out value="优秀"></c:out>
		</c:when>
		<c:when test="${param.score>=80 && param.score<90}">
			<c:out value="良好"></c:out>
		</c:when>
		<c:when test="${param.score>=70 && param.score<80}">
			<c:out value="中等"></c:out>
		</c:when>
		<c:when test="${param.score>=60 && param.score<70}">
			<c:out value="及格"></c:out>
		</c:when>
		<c:when test="${param.score<60 && param.score>=0}">
			<c:out value="不及格"></c:out>
		</c:when>
		<c:otherwise>
			<c:out value="您的输入有问题"></c:out>
		</c:otherwise>
	</c:choose>

	<%
		List<String> fruits = new ArrayList<String>();
		fruits.add("apple");
		fruits.add("orange");
		fruits.add("pear");
		fruits.add("watermelon");
		fruits.add("banana");
		fruits.add("grape");
		request.setAttribute("fruits", fruits);
	%>
	<c:forEach var="fruit" items="${fruits}">
		<c:out value="${fruit}"></c:out>
		<br>
	</c:forEach>
	<c:out value="=================="></c:out>
	<br>

	<c:forEach var="fruit" items="${fruits} " begin="1" end="3" step="2">
		<c:out value="${fruit}"></c:out>
		<br>
	</c:forEach>
	<c:out value="=================="></c:out>
	<br>

	<c:forEach var="fruit" items="${fruits} " begin="1" end="3" step="2"
		varStatus="fru">
		<c:out value="${fruit}的四个值"></c:out>
		<br>
		<c:out value="${fru.index}"></c:out>
		<br>
	</c:forEach>
	<c:out value="=================="></c:out>
	<br>

	<c:forTokens items="010-888045-123" delims="-" var="num">
		<c:out value="${num}"></c:out>
		<br>
	</c:forTokens>
	<br>

	<c:catch var="error1">
		<c:import url="http://www.yangtzeu.edu.cn/" charEncoding="utf-8"></c:import>
	</c:catch>
	<c:out value="${error1}"></c:out>
	<br>

	<c:out value="${param.username}"></c:out>
	<c:out value="${param.password }"></c:out>
</body>
</html>
