package com.spring.boot.rocks.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.boot.rocks.model.AppCasetype;

@Repository
public interface CasetypeRepository extends JpaRepository<AppCasetype, Long> {
	AppCasetype findById(Integer id);
	AppCasetype findByCasetypename(String casetypename);

}
