package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppCasestep;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CasestepEditValidator implements Validator {


	@Override
	public boolean supports(Class<?> aClass) {
		return AppCasestep.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		AppCasestep casestep = (AppCasestep) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "casestepname", "NotEmpty");
		if (casestep.getCasestepname().length() < 6 || casestep.getCasestepname().length() > 32) {
			errors.rejectValue("casestepname", "Size.casestepForm.casestepname");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appCasetype", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appCasetype", "NoCasetypeSelected");
		
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appRole", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appRole", "NoRoleSelected");
		
	}
}
