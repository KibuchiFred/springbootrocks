package com.spring.boot.rocks.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.boot.rocks.model.AppCasestep;

@Repository
public interface CasestepRepository extends JpaRepository<AppCasestep, Long> {
	AppCasestep findById(Integer id);
	AppCasestep findByCasestepname(String casestepname);

}
