package com.zafirotaha.repositorios;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zafirotaha.modelos.Cancion;

@Repository
public interface RepositorioCanciones extends CrudRepository<Cancion, Long>{
	//CRUD
	//C -> Create
	//R -> Read
	//U -> Update
	//D -> Delete
	
	List<Cancion> findAll();
	
	Optional<Cancion> findById(Long id);
}