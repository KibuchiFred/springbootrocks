package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppUser;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserEditValidator implements Validator {

	@Override
	public boolean supports(Class<?> aClass) {
		return AppUser.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		AppUser user = (AppUser) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
			errors.rejectValue("password", "Size.userForm.password");
		}

		if (!user.getPasswordConfirm().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "useremail", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userfirstname", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userlastname", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "useraddress", "NotEmpty");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roles", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roles", "NoRoleSelected");
		
	}
}
