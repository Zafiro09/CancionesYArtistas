<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Artistas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div>
        <h1>Lista de Artistas</h1>
        <ul>
            <c:forEach var="artista" items="${artistas}">
                <li>
                    <a href="<c:url value='/artistas/detalle/${artista.id}'/>">
                        ${artista.nombre} ${artista.apellido}
                    </a>
                </li>
            </c:forEach>
        </ul>
        <div>
            <a href="<c:url value='/formulario/agregar/Artista'/>">Agregar Artista</a>
            <a href="<c:url value='/artistas'/>">Ir a Artistas</a>
            <a href="<c:url value='/canciones'/>">Volver a lista de canciones</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>