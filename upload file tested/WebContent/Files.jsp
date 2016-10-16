<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Uploaded Files</title>
</head>
<body style="text-align:center">
	<h3>Uploaded Files</h3>
	<table border="1" align="center">
		<tr>
			<th>File Name</th>
			<th>File Size in KB</th>
			<th>File Last Modified</th>
		</tr>	
	<c:forEach items="${files}" var="file">
		<tr><td><c:out value="${file.name}"/>
		</td><td> ${file.length()/1000} </td> 
		<td>${file.lastModified()} </td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>