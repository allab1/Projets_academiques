<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload Page</title>
</head>
<body>
	<h1 style="text-align:center">Choose and Upload file</h1>
	<form action="UploadServlet" method="post" enctype="multipart/form-data">
		<p><input type="file" name="browse" /></p>
		<p style="color:red">${errorMessage}</p>
		<p><input type="submit" name="upload" value="Upload File" /></p>
	</form>
</body>
</html>