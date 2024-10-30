<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
    	<title>Detalle del Artista</title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	</head>
	<body>
		<h1> Detalle Del Artista</h1>
		<h2>${artista.nombre} ${artista.apellido}</h2>
		<p>${artista.biografia}</p>
		<h3>Canciones Del Artista</h3>
		<table>
			<thead>
				<tr>
					<th>Título</th>
					<th>Álbum</th>
					<th>Género</th>
					<th>Idioma</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cancion" items="${artista.canciones }">
					<tr>
						<td>${cancion.titulo}</td>
						<td>${cancion.album}</td>
                        <td>${cancion.genero}</td>
                        <td>${cancion.idioma}</td>
                    </tr>
                 </c:forEach>
			</tbody>
		</table>
		<a href="<c:url value='/canciones'/>">Volver a lista de canciones</a>
		<a href="<c:url value='/artistas'/>">Volver A Artistas</a>
	</body>
</html>