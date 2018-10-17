package com.spring.boot.rocks.service;

import com.spring.boot.rocks.model.AppCasestep;
import com.spring.boot.rocks.repository.CasestepRepository;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(timeout = 5)
public class CasestepServiceImpl implements CasestepService {
	@Autowired
	private CasestepRepository casestepRepository;

	@Override
	public void save(AppCasestep casestep) {
		casestep.setCasestepname(casestep.getCasestepname());
		casestep.setAppCasetype(casestep.getAppCasetype());
		casestep.setAppRole(casestep.getAppRole());
		System.out
				.println("\n%%%%%%%%%%%      Adding New Casestep.... " + casestep.getCasestepname() + "     %%%%%%%%%%%%%\n");
		casestepRepository.save(casestep);
	}

	@Override
	public AppCasestep findByCasestepname(String casestepname) {
		return casestepRepository.findByCasestepname(casestepname);
	}

	@Override
	public AppCasestep findById(int id) {
		return casestepRepository.findById(id);

	}

	@Override
	public List<AppCasestep> findAllAgencies() {
		List<AppCasestep> list = new ArrayList<>();
		casestepRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public void updateCasestep(AppCasestep casestep) {
		AppCasestep entity = casestepRepository.findById(casestep.getId());
		if (entity != null) {
			System.out.println(
					"\n%%%%%%%%%%%      Updating Casestep.... " + casestep.getCasestepname() + "     %%%%%%%%%%%%%\n");

			entity.setCasestepname(casestep.getCasestepname());
			entity.setAppCasetype(casestep.getAppCasetype());
			entity.setAppRole(casestep.getAppRole());
			

		}
		casestepRepository.save(entity);
	}

	@Override
	public void deleteCasestepByCasestepname(String casestepname) {
		System.out.println("\n%%%%%%%%%%%      Deleting Casestep.... " + casestepname + "     %%%%%%%%%%%%%\n");
		casestepRepository.delete(findByCasestepname(casestepname));

	}

}
