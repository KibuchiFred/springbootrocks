package com.spring.boot.rocks.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.boot.rocks.model.AppAgency;

@Repository
public interface AgencyRepository extends JpaRepository<AppAgency, Long> {
	AppAgency findById(Integer id);

	AppAgency findByAgencyname(String agencyname);

}