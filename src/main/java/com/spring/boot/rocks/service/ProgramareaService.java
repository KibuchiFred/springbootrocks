package com.spring.boot.rocks.service;

import java.util.List;

import com.spring.boot.rocks.model.AppProgramarea;

public interface ProgramareaService {
	AppProgramarea findByProgramareaname(String programareaname);

	AppProgramarea findByProgramareaId(long programareaid);

	void save(AppProgramarea programarea);

	List<AppProgramarea> findAllProgramareas();

	void updateProgramarea(AppProgramarea programarea);

	void deleteProgramareaByProgramareaname(String emailid);

}
