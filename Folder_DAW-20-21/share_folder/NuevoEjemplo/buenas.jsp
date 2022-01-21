<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
<title>Buenas</title>
<style>
	.content{
		width: 50%;
		margin: 2% 25%;
		text-align: center;
		border: 2px black solid;
		border-radius: 10px;
		background-color: orange;
	}
</style>
</head>
<body>
	<div class="content">
		<b>Bienvenido al curso</b>
		
		<p>
			Hoy es
			<%=Calendar.getInstance().getTime()%>
		</p>
		<%
			String saludo;
			int hora = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
			if (hora < 12){
				saludo = "Buenos días";
			}
			else if (hora >= 12 && hora < 21){
				saludo = "Buenas tardes";
			}
			else {
				saludo = "Buenas noches";
			}
		%>
		
		<p><%=saludo%></p>
	</div>
</body>
</html>