package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppAgency;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class AgencyEditValidator implements Validator {


	@Override
	public boolean supports(Class<?> aClass) {
		return AppAgency.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		AppAgency agency = (AppAgency) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencyname", "NotEmpty");
		if (agency.getAgencyname().length() < 6 || agency.getAgencyname().length() > 32) {
			errors.rejectValue("agencyname", "Size.agencyForm.agencyname");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencylocation", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencyaddress", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencyheadname", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencyheademail", "NotEmpty");

	}
}
