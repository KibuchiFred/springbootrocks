package com.spring.boot.rocks.service;

import java.util.List;

import com.spring.boot.rocks.model.AppCasestep;

public interface CasestepService {
	AppCasestep findByCasestepname(String casestepname);

	AppCasestep findById(int id);

	void save(AppCasestep casestep);

	List<AppCasestep> findAllAgencies();

	void updateCasestep(AppCasestep casestep);

	void deleteCasestepByCasestepname(String casestep);

}
