package com.spring.boot.rocks.validator;

import com.spring.boot.rocks.model.AppAgency;
import com.spring.boot.rocks.service.AgencyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class AgencyAddValidator implements Validator {
    @Autowired
    private AgencyService agencyService;

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
        if (agencyService.findByAgencyname(agency.getAgencyname()) != null) {
            errors.rejectValue("agencyname", "Duplicate.agencyForm.agencyname");
        }
  
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencylocation", "NotEmpty"); 
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencyaddress", "NotEmpty"); 
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencyheadname", "NotEmpty"); 
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "agencyheademail", "NotEmpty");   

    }
}
