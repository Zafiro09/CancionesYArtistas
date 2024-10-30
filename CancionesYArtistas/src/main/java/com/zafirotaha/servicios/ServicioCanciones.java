package com.zafirotaha.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zafirotaha.repositorios.RepositorioCanciones;

import com.zafirotaha.modelos.Cancion;

@Service
public class ServicioCanciones {
	@Autowired
	RepositorioCanciones repositorio;
	
	public List<Cancion> obtenerTodasLasCanciones(){
		return repositorio.findAll();
	}
	
	public Cancion obtenerCancionPorId(Long id) {
		Optional<Cancion> cancion = repositorio.findById(id);
		return cancion.orElse(null);
	}
	
	public Cancion agregarCancion(Cancion cancion) {
		return repositorio.save(cancion);
	}
	
	public Cancion actualizarCancion(Cancion cancion) {
		return repositorio.save(cancion);
	}
	
	public void eliminarUno(Long id) {
		this.repositorio.deleteById(id);
	}
}
