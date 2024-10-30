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
import com.zafirotaha.modelos.Artista;
import com.zafirotaha.modelos.Cancion;
import com.zafirotaha.servicios.ServiciosArtista;
import com.zafirotaha.servicios.ServicioCanciones;
import jakarta.validation.Valid;
@Controller
public class ControladorArtistas {
	@Autowired
	ServiciosArtista servicio;
	
	
	@GetMapping("/artistas")
	public String desplegarArtistas(Model modelo) {
		List<Artista> artistas = this.servicio.obtenerTodosLosArtistas();
		modelo.addAttribute("artistas", artistas);
		return "artistas.jsp";
	}
	
	@GetMapping("/artistas/detalle/{id}")
	public String desplegarDetalleArtista(Model modelo, @PathVariable Long id) {
		Artista artista = this.servicio.obtenerUno(id);
		modelo.addAttribute("artista", artista);
		return "detalleArtista.jsp";
	}
	
	@GetMapping("/formulario/agregar/Artista")
	public String formularioAgregarArtista(@ModelAttribute Artista artista) {
		return "agregarArtista.jsp";
	}
	
	@PostMapping("/procesa/agregar/Artista")
	public String procesarAgregarArtista(@Valid @ModelAttribute Artista artista, BindingResult validaciones) {
		if(validaciones.hasErrors()) {
			return "agregarArtista.jsp";
		}
		this.servicio.agregarArtista(artista);
		return "redirect:/artistas";
	}
	
	
}
