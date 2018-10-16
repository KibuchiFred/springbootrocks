package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppCasetype;
import com.spring.boot.rocks.service.CasetypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CasetypeAddValidator implements Validator {
	@Autowired
	private CasetypeService casetypeService;

	@Override
	public boolean supports(Class<?> aClass) {
		return AppCasetype.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		AppCasetype casetype = (AppCasetype) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "casetypename", "NotEmpty");
		if (casetype.getCasetypename().length() < 6 || casetype.getCasetypename().length() > 32) {
			errors.rejectValue("casetypename", "Size.casetypeForm.casetypename");
		}
		if (casetypeService.findByCasetypename(casetype.getCasetypename()) != null) {
			errors.rejectValue("casetypename", "Duplicate.casetypeForm.casetypename");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appProgramarea", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appProgramarea", "NoProgramareaSelected");

	}
}
