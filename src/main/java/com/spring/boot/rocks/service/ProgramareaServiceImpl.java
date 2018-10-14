package com.spring.boot.rocks.service;

import com.spring.boot.rocks.model.AppProgramarea;
import com.spring.boot.rocks.repository.ProgramareaRepository;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(timeout = 5)
public class ProgramareaServiceImpl implements ProgramareaService {
	@Autowired
	private ProgramareaRepository programareaRepository;

	@Override
	public void save(AppProgramarea programarea) {
		programarea.setAppAgency(programarea.getAppAgency());
		programarea.setProgramareaname(programarea.getProgramareaname());
		programarea.setProgramarealocation(programarea.getProgramarealocation());
		programarea.setProgramareaheadname(programarea.getProgramareaheadname());
		programarea.setProgramareaheademail(programarea.getProgramareaheademail());
		programarea.setProgramareaaddress(programarea.getProgramareaaddress());
		System.out.println("\n%%%%%%%%%%%      Adding New Programarea.... " + programarea.getProgramareaname()
				+ "     %%%%%%%%%%%%%\n");
		programareaRepository.save(programarea);
	}

	@Override
	public AppProgramarea findByProgramareaname(String programareaname) {
		return programareaRepository.findByProgramareaname(programareaname);
	}

	@Override
	public AppProgramarea findByProgramareaId(long programareaid) {
		AppProgramarea obj = programareaRepository.findById(programareaid).get();
		return obj;
	}

	@Override
	public List<AppProgramarea> findAllProgramareas() {
		List<AppProgramarea> list = new ArrayList<>();
		programareaRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public void updateProgramarea(AppProgramarea programarea) {
		AppProgramarea entity = programareaRepository.findById(programarea.getId()).orElse(null);
		if (entity != null) {
			System.out.println("\n%%%%%%%%%%%      Updating Programarea.... " + programarea.getProgramareaname()
					+ "     %%%%%%%%%%%%%\n");
			entity.setAppAgency(programarea.getAppAgency());
			entity.setProgramareaname(programarea.getProgramareaname());
			entity.setProgramarealocation(programarea.getProgramarealocation());
			entity.setProgramareaheadname(programarea.getProgramareaheadname());
			entity.setProgramareaheademail(programarea.getProgramareaheademail());
			entity.setProgramareaaddress(programarea.getProgramareaaddress());

		}
		programareaRepository.save(entity);
	}

	@Override
	public void deleteProgramareaByProgramareaname(String programareaname) {
		System.out.println("\n%%%%%%%%%%%      Deleting Programarea.... " + programareaname + "     %%%%%%%%%%%%%\n");
		programareaRepository.delete(findByProgramareaname(programareaname));

	}

}
