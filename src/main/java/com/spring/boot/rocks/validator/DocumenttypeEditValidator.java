package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppCasetype;
import com.spring.boot.rocks.model.AppDocumenttype;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class DocumenttypeEditValidator implements Validator {


	@Override
	public boolean supports(Class<?> aClass) {
		return AppCasetype.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		AppDocumenttype documenttype = (AppDocumenttype) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "documenttypename", "NotEmpty");
		if (documenttype.getDocumenttypename().length() < 6 || documenttype.getDocumenttypename().length() > 32) {
			errors.rejectValue("documenttypename", "Size.documenttypeForm.documenttypename");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "documenttypeproperty1", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "documenttypeproperty2", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "documenttypeproperty3", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "documenttypeproperty4", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "documenttypeproperty5", "NotEmpty");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appCasetype", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appCasetype", "NoCasetypeSelected");
		
	}
}
