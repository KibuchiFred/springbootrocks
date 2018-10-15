package com.spring.boot.rocks.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.boot.rocks.model.AppProgramarea;

@Repository
public interface ProgramareaRepository extends JpaRepository<AppProgramarea, Long> {
	AppProgramarea findById(Integer id);

	AppProgramarea findByProgramareaname(String programareaname);

}
