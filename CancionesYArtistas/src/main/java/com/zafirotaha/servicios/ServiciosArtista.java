package com.zafirotaha.servicios;
 import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zafirotaha.modelos.Artista;
import com.zafirotaha.repositorios.RepositorioArtistas;

@Service
public class ServiciosArtista {
	@Autowired
	private final RepositorioArtistas repositorioArtistas;
	
	public Artista agregarArtista(Artista artista) {
		return repositorioArtistas.save(artista);
	}
	
	public List<Artista> obtenerTodosLosArtistas(){
		return repositorioArtistas.findAll();
	}
	
	public ServiciosArtista(RepositorioArtistas repositorioArtistas) {
		this.repositorioArtistas = repositorioArtistas;
	}
	
	public Artista obtenerUno(Long id_artista) {
		return this.repositorioArtistas.findById(id_artista).orElse(null);
	}
}
