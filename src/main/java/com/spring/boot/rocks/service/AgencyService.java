package com.spring.boot.rocks.service;

import java.util.List;

import com.spring.boot.rocks.model.AppAgency;

public interface AgencyService {
	AppAgency findByAgencyname(String agencyname);

	AppAgency findById(int id);

	void save(AppAgency agency);

	List<AppAgency> findAllAgencies();

	void updateAgency(AppAgency agency);

	void deleteAgencyByAgencyname(String emailid);

}
