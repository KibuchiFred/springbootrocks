package com.spring.boot.rocks.service;

import java.util.List;

import com.spring.boot.rocks.model.AppCasetype;

public interface CasetypeService {
	AppCasetype findByCasetypename(String casetypename);

	AppCasetype findById(int id);

	void save(AppCasetype casetype);

	List<AppCasetype> findAllAgencies();

	void updateCasetype(AppCasetype casetype);

	void deleteCasetypeByCasetypename(String casetype);

}
