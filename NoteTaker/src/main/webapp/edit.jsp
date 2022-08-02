<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.helper.*,org.hibernate.*,com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_js.jsp"%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<h1 class="text-uppercase">Edit your page:</h1>


		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Note note = (Note) s.get(Note.class, noteId);
		%>


		<form action="UpdateServlet" method="post">
		
		<input value="<%= note.getId()%>" name="noteId" type="hidden"/>
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> <input
					required type="text" name="title" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here" value="<%= note.getTitle()%>">
					
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea required id="content" name="content"
					placeholder="Enter your text here" class="form-control"
					style="height: 300px;"><%= note.getContent() %>
    
    </textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>

			</div>
		</form>
	</div>
</body>
</html>