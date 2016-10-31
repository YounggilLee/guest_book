

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="model.Message"%>
<%@ page import="service.MessageListView"%>
<%@ page import="service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	GetMessageListService messageListService = 
			GetMessageListService.getInstance();
	MessageListView viewData = 
			messageListService.getMessageList(pageNumber);
%>
<c:set var="viewData" value="<%= viewData %>"/>
<html>
<head>
	<title>Guest Book List</title>
        <meta name="viewport" content="width=device-width" inintial-scale="1.0">
	<link rel="stylesheet" href="css/bootstr ap.mim.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
	<script src="js/bootstrap.min.js"></script>	
</script>
</head>
<body>

<form action="writeMessage.jsp" method="post">
Name <input type="text" name="guestName"> <br>
Password <input type="password" name="password"> <br>
Message <textarea name="message" cols="30" rows="3"></textarea> <br>
<input type="submit" value="Submit" />
</form>
<hr>
<c:if test="${viewData.isEmpty()}">
There is no Message!!
</c:if>

<c:if test="${!viewData.isEmpty()}">
<table border="1">
	<c:forEach var="message" items="${viewData.messageList}">
	<tr>
		<td>
		Message_ID: ${message.id} <br/>
		Guest_Name: ${message.guestName} <br/>
		Message: ${message.message} <br/>
		<a href="confirmDeletion.jsp?messageId=${message.id}">[Delete]</a>
		</td>
	</tr>
	</c:forEach>
</table>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>

</c:if>
</body>
</html>
