<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Agregar Cancion</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="/css/artista.css" rel="stylesheet"/>
	</head>
	<body>
		<h1>Agregar Cancion</h1>
		<form:form modelAttribute="cancion" action="/procesa/agregar" method="POST">
			<div>
				<form:label path="titulo">Título: </form:label>
				<form:input path="titulo" />
				<form:errors path="titulo" cssClass="error" />
			</div>
			<div>
				<form:label path="artista">Artista: </form:label>
				<form:input path="artista" />
				<form:errors path="artista" cssClass="error" />
			<div class="mb-3">
				<label for="id_artista">Artista:</label>
				<select name="id_artista" id="id_artista" required>
					<option value="">-- Seleccione un artista --</option>
						<c:forEach var="artista" items="${artistas}">
							<option value="${artista.id}">${artista.nombre} ${artista.apellido}</option>
						</c:forEach>
				</select>
			</div>
				<form:errors path="artista" />
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
