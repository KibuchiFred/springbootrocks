package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppProgramarea;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ProgramareaEditValidator implements Validator {

	@Override
	public boolean supports(Class<?> aClass) {
		return AppProgramarea.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		AppProgramarea programarea = (AppProgramarea) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaname", "NotEmpty");
		if (programarea.getProgramareaname().length() < 6 || programarea.getProgramareaname().length() > 32) {
			errors.rejectValue("programareaname", "Size.programareaForm.programareaname");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appAgency", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programarealocation", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaaddress", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaheadname", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaheademail", "NotEmpty");

	}
}
