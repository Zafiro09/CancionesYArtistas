<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<title>Editar Canción</title>
	</head>
	<body>
		<h1>Editar Canción</h1>
		<form:form class="col-6" action="/canciones/actualizar/${cancion.id}" method="POST" modelAttribute="cancion">
					<input type="hidden" name="_method" value="PUT"/>
			<div>
				<form:label path="titulo">Título: </form:label>
				<form:input path="titulo" />
				<form:errors path="titulo" cssClass="error" />
			</div>
			<div>
				<form:label path="artista">Artista: </form:label>
				<form:input path="artista" />
				<form:errors path="artista" cssClass="error" />
			</div>
			<div>
				<form:label path="album">Álbum: </form:label>
				<form:input path="album" />
				<form:errors path="album" cssClass="error" />
			</div>
			<div>
				<form:label path="genero">Género: </form:label>
				<form:input path="genero" />
				<form:errors path="genero" cssClass="error" />
			</div>
			<div>
				<form:label path="idioma">Idioma: </form:label>
				<form:input path="idioma" />
				<form:errors path="idioma" cssClass="error" />
			</div>
			<input type="submit" value="Enviar" />
		</form:form>
		<a href="<c:url value='/canciones'/>">Volver a lista de canciones</a>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>