package com.spring.boot.rocks.service;

import com.spring.boot.rocks.model.AppCasetype;
import com.spring.boot.rocks.repository.CasetypeRepository;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(timeout = 5)
public class CasetypeServiceImpl implements CasetypeService {
	@Autowired
	private CasetypeRepository casetypeRepository;

	@Override
	public void save(AppCasetype casetype) {
		casetype.setCasetypename(casetype.getCasetypename());
		casetype.setAppProgramarea(casetype.getAppProgramarea());
		System.out
				.println("\n%%%%%%%%%%%      Adding New Casetype.... " + casetype.getCasetypename() + "     %%%%%%%%%%%%%\n");
		casetypeRepository.save(casetype);
	}

	@Override
	public AppCasetype findByCasetypename(String casetypename) {
		return casetypeRepository.findByCasetypename(casetypename);
	}

	@Override
	public AppCasetype findById(int id) {
		return casetypeRepository.findById(id);

	}

	@Override
	public List<AppCasetype> findAllAgencies() {
		List<AppCasetype> list = new ArrayList<>();
		casetypeRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public void updateCasetype(AppCasetype casetype) {
		AppCasetype entity = casetypeRepository.findById(casetype.getId());
		if (entity != null) {
			System.out.println(
					"\n%%%%%%%%%%%      Updating Casetype.... " + casetype.getCasetypename() + "     %%%%%%%%%%%%%\n");

			entity.setCasetypename(casetype.getCasetypename());
			entity.setAppProgramarea(casetype.getAppProgramarea());
			

		}
		casetypeRepository.save(entity);
	}

	@Override
	public void deleteCasetypeByCasetypename(String casetypename) {
		System.out.println("\n%%%%%%%%%%%      Deleting Casetype.... " + casetypename + "     %%%%%%%%%%%%%\n");
		casetypeRepository.delete(findByCasetypename(casetypename));

	}

}
