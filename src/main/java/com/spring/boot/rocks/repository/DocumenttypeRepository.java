package com.spring.boot.rocks.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.boot.rocks.model.AppDocumenttype;

@Repository
public interface DocumenttypeRepository extends JpaRepository<AppDocumenttype, Long> {
	AppDocumenttype findById(Integer id);
	AppDocumenttype findByDocumenttypename(String documenttypename);

}
