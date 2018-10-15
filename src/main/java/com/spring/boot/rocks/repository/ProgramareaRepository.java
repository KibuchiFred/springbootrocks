package com.spring.boot.rocks.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spring.boot.rocks.model.AppProgramarea;
import com.spring.boot.rocks.model.AppRole;

@Repository
public interface ProgramareaRepository extends JpaRepository<AppProgramarea, Long> {
	AppProgramarea findById(Integer id);

	AppProgramarea findByProgramareaname(String programareaname);

}
