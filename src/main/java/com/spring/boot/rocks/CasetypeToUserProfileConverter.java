package com.spring.boot.rocks;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.spring.boot.rocks.model.AppCasetype;
import com.spring.boot.rocks.service.CasetypeService;

@Component
public class CasetypeToUserProfileConverter implements Converter<Object, AppCasetype> {

	static final Logger logger = LoggerFactory.getLogger(CasetypeToUserProfileConverter.class);

	@Autowired
	CasetypeService casetypeService;

	@Override
	public AppCasetype convert(Object element) {
		Integer id = Integer.parseInt((String) element);
		AppCasetype agency = casetypeService.findById(id);
		logger.info("Profile : {}", agency);
		return agency;
	}

}