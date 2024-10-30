package com.zafirotaha.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zafirotaha.modelos.Artista;
import com.zafirotaha.modelos.Cancion;
import com.zafirotaha.servicios.ServiciosArtista;
import com.zafirotaha.servicios.ServicioCanciones;

import jakarta.validation.Valid;



@Controller
public class ControladorCanciones {
	@Autowired
	ServicioCanciones servicio;
	ServiciosArtista servicioArtistas;

	public ControladorCanciones(ServicioCanciones servicio, ServiciosArtista servicioartistas) {
		this.servicio = servicio;
		this.servicioArtistas = servicioartistas;
	}

	@GetMapping("/canciones")
	public String desplegarCanciones(Model modelo) {
		List<Cancion> canciones = this.servicio.obtenerTodasLasCanciones();
		modelo.addAttribute("canciones", canciones);
		return "canciones.jsp";
	}

	@GetMapping("/canciones/detalle/{id}")
	public String desplegarDetalleCancion(Model modelo, @PathVariable Long id) {
		Cancion cancion = this.servicio.obtenerCancionPorId(id);
		modelo.addAttribute("cancion", cancion);
		return "detalleCanciones.jsp";
	}

	@GetMapping("/formulario/agregar")
	public String formularioAgregarCancion(@ModelAttribute Cancion cancion, Model modelo) {
		List<Artista> artistas = this.servicioArtistas.obtenerTodosLosArtistas();
		modelo.addAttribute("artistas", artistas);
        modelo.addAttribute("cancion", new Cancion());
		return "agregarCancion.jsp";
	}

	@PostMapping("/procesa/agregar")
	public String procesarAgregarCancion(@Valid @ModelAttribute Cancion cancion, BindingResult validaciones, @RequestParam Long id_artista) {
		if(validaciones.hasErrors()) {
			return "agregarCancion.jsp";
		}
		Artista artista = this.servicioArtistas.obtenerUno(id_artista);
		cancion.setArtista(artista);
		this.servicio.agregarCancion(cancion);
		return "redirect:/canciones";
	}

	@GetMapping("/canciones/editar/{id}")
	public String desplegarFormularioEditarCancion(@PathVariable Long id, 
	@ModelAttribute Cancion cancion, Model modelo) {
		cancion = this.servicio.obtenerCancionPorId(id);
		modelo.addAttribute("cancion", cancion);
		return "formularioEditarCancion.jsp";
	}


	@PutMapping("/canciones/actualizar/{id}")
	public String actualizarCancion(@Valid @ModelAttribute Cancion cancion, 
			BindingResult validaciones, @PathVariable Long id) {
		if(validaciones.hasErrors()) {
			return "formularioEditarCancion.jsp";
		}
		this.servicio.actualizarCancion(cancion);
		return "redirect:/canciones";
	}

	@DeleteMapping("/eliminar/cancion/{id}")
	public String eliminarCancion(@PathVariable Long id) {
		this.servicio.eliminarUno(id);
		return "redirect:/canciones";
	}
}