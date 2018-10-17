package com.spring.boot.rocks.service;

import com.spring.boot.rocks.model.AppDocumenttype;
import com.spring.boot.rocks.repository.DocumenttypeRepository;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(timeout = 5)
public class DocumenttypeServiceImpl implements DocumenttypeService {
	@Autowired
	private DocumenttypeRepository documenttypeRepository;

	@Override
	public void save(AppDocumenttype documenttype) {
		documenttype.setDocumenttypename(documenttype.getDocumenttypename());
		documenttype.setAppCasetype(documenttype.getAppCasetype());
		documenttype.setDocumenttypeproperty1(documenttype.getDocumenttypeproperty1());
		documenttype.setDocumenttypeproperty2(documenttype.getDocumenttypeproperty2());
		documenttype.setDocumenttypeproperty3(documenttype.getDocumenttypeproperty3());
		documenttype.setDocumenttypeproperty4(documenttype.getDocumenttypeproperty4());
		documenttype.setDocumenttypeproperty5(documenttype.getDocumenttypeproperty5());
		
		System.out
				.println("\n%%%%%%%%%%%      Adding New Documenttype.... " + documenttype.getDocumenttypename() + "     %%%%%%%%%%%%%\n");
		documenttypeRepository.save(documenttype);
	}

	@Override
	public AppDocumenttype findByDocumenttypename(String documenttypename) {
		return documenttypeRepository.findByDocumenttypename(documenttypename);
	}

	@Override
	public AppDocumenttype findById(int id) {
		return documenttypeRepository.findById(id);

	}

	@Override
	public List<AppDocumenttype> findAllDoctypes() {
		List<AppDocumenttype> list = new ArrayList<>();
		documenttypeRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public void updateDocumenttype(AppDocumenttype documenttype) {
		AppDocumenttype entity = documenttypeRepository.findById(documenttype.getId());
		if (entity != null) {
			System.out.println(
					"\n%%%%%%%%%%%      Updating Documenttype.... " + documenttype.getDocumenttypename() + "     %%%%%%%%%%%%%\n");

			entity.setDocumenttypename(documenttype.getDocumenttypename());
			entity.setAppCasetype(documenttype.getAppCasetype());
			entity.setDocumenttypeproperty1(documenttype.getDocumenttypeproperty1());
			entity.setDocumenttypeproperty2(documenttype.getDocumenttypeproperty2());
			entity.setDocumenttypeproperty3(documenttype.getDocumenttypeproperty3());
			entity.setDocumenttypeproperty4(documenttype.getDocumenttypeproperty4());
			entity.setDocumenttypeproperty5(documenttype.getDocumenttypeproperty5());
			

		}
		documenttypeRepository.save(entity);
	}

	@Override
	public void deleteDocumenttypeByDocumenttypename(String documenttypename) {
		System.out.println("\n%%%%%%%%%%%      Deleting Documenttype.... " + documenttypename + "     %%%%%%%%%%%%%\n");
		documenttypeRepository.delete(findByDocumenttypename(documenttypename));

	}

}
