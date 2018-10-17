package com.spring.boot.rocks.service;

import java.util.List;

import com.spring.boot.rocks.model.AppDocumenttype;

public interface DocumenttypeService {
	AppDocumenttype findByDocumenttypename(String documenttypename);

	AppDocumenttype findById(int id);

	void save(AppDocumenttype documenttype);

	List<AppDocumenttype> findAllDoctypes();

	void updateDocumenttype(AppDocumenttype documenttype);

	void deleteDocumenttypeByDocumenttypename(String documenttype);

}
