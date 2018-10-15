package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppProgramarea;
import com.spring.boot.rocks.service.ProgramareaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ProgramareaAddValidator implements Validator {
	@Autowired
	private ProgramareaService programareaService;

	@Override
	public boolean supports(Class<?> aClass) {
		return AppProgramarea.class.equals(aClass);
	}

	@SuppressWarnings("unlikely-arg-type")
	@Override
	public void validate(Object o, Errors errors) {
		AppProgramarea programarea = (AppProgramarea) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaname", "NotEmpty");
		if (programarea.getProgramareaname().length() < 6 || programarea.getProgramareaname().length() > 32) {
			errors.rejectValue("programareaname", "Size.programareaForm.programareaname");
		}
		if (programareaService.findByProgramareaname(programarea.getProgramareaname()) != null) {
			errors.rejectValue("programareaname", "Duplicate.programareaForm.programareaname");
		}

//		if(programarea.getAppAgency()== null){
//			errors.rejectValue("appAgency", "NoAgencySelected");
//		   }
//		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appAgency", "NoAgencySelected");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programarealocation", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaaddress", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaheadname", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "programareaheademail", "NotEmpty");

	}
}
