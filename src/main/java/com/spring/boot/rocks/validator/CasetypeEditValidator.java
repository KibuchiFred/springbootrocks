package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppCasetype;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CasetypeEditValidator implements Validator {


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

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appProgramarea", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appProgramarea", "NoProgramareaSelected");
		
	}
}
