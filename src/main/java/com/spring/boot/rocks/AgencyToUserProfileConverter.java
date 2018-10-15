package com.spring.boot.rocks;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.spring.boot.rocks.model.AppAgency;
import com.spring.boot.rocks.service.AgencyService;

@Component
public class AgencyToUserProfileConverter implements Converter<Object, AppAgency> {

	static final Logger logger = LoggerFactory.getLogger(AgencyToUserProfileConverter.class);

	@Autowired
	AgencyService agencyService;

	@Override
	public AppAgency convert(Object element) {
		Integer id = Integer.parseInt((String) element);
		AppAgency agency = agencyService.findById(id);
		logger.info("Profile : {}", agency);
		return agency;
	}

}