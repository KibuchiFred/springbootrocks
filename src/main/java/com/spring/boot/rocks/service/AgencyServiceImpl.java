package com.spring.boot.rocks.service;

import com.spring.boot.rocks.model.AppAgency;
import com.spring.boot.rocks.repository.AgencyRepository;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(timeout = 5)
public class AgencyServiceImpl implements AgencyService {
	@Autowired
	private AgencyRepository agencyRepository;

	@Override
	public void save(AppAgency agency) {
		agency.setAgencyname(agency.getAgencyname());
		agency.setAgencylocation(agency.getAgencylocation());
		agency.setAgencyheadname(agency.getAgencyheadname());
		agency.setAgencyheademail(agency.getAgencyheademail());
		agency.setAgencyaddress(agency.getAgencyaddress());
		System.out
				.println("\n%%%%%%%%%%%      Adding New Agency.... " + agency.getAgencyname() + "     %%%%%%%%%%%%%\n");
		agencyRepository.save(agency);
	}

	@Override
	public AppAgency findByAgencyname(String agencyname) {
		return agencyRepository.findByAgencyname(agencyname);
	}

	@Override
	public AppAgency findById(int id) {
		return agencyRepository.findById(id);

	}

	@Override
	public List<AppAgency> findAllAgencies() {
		List<AppAgency> list = new ArrayList<>();
		agencyRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public void updateAgency(AppAgency agency) {
		AppAgency entity = agencyRepository.findById(agency.getId());
		if (entity != null) {
			System.out.println(
					"\n%%%%%%%%%%%      Updating Agency.... " + agency.getAgencyname() + "     %%%%%%%%%%%%%\n");

			entity.setAgencyname(agency.getAgencyname());
			entity.setAgencylocation(agency.getAgencylocation());
			entity.setAgencyheadname(agency.getAgencyheadname());
			entity.setAgencyheademail(agency.getAgencyheademail());
			entity.setAgencyaddress(agency.getAgencyaddress());

		}
		agencyRepository.save(entity);
	}

	@Override
	public void deleteAgencyByAgencyname(String agencyname) {
		System.out.println("\n%%%%%%%%%%%      Deleting Agency.... " + agencyname + "     %%%%%%%%%%%%%\n");
		agencyRepository.delete(findByAgencyname(agencyname));

	}

}
