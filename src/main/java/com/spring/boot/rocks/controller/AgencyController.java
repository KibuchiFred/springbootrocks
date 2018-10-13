package com.spring.boot.rocks.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.boot.rocks.model.AppRole;
import com.spring.boot.rocks.model.AppAgency;
import com.spring.boot.rocks.repository.RoleRepository;
import com.spring.boot.rocks.service.AgencyService;
import com.spring.boot.rocks.validator.AgencyEditValidator;
import com.spring.boot.rocks.validator.AgencyAddValidator;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class AgencyController {
	@Autowired
	private AgencyService agencyService;
	
	@Autowired
	private AgencyAddValidator agencyaddValidator;

	@Autowired
	private AgencyEditValidator agencyeditValidator;

	
	@RequestMapping(value = { "agencylist" }, method = RequestMethod.GET)
	public String listAgencys(ModelMap model) {
		List<AppAgency> agencys = agencyService.findAllAgencies();
		
		model.addAttribute("agencies", agencys);

		return "agencylist";
	}

	@RequestMapping(value = "agencyregistration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("agencyForm", new AppAgency());

		return "agencyregistration";
	}

	@RequestMapping(value = "agencyregistration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("agencyForm") AppAgency agencyForm, BindingResult bindingResult, Model model) {
		agencyaddValidator.validate(agencyForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "agencyregistration";
		}

		agencyService.save(agencyForm);

		model.addAttribute("success", "Agency " + agencyForm.getAgencyname() + " created successfully");
		return "success";

	}

	@RequestMapping(value = { "edit-agency-{agencyname}" }, method = RequestMethod.GET)
	public String editAgency(@PathVariable String agencyname, Model model) {
		AppAgency agency = agencyService.findByAgencyname(agencyname);
		model.addAttribute("agencyForm", agency);
		return "agencyedit";
	}

	@RequestMapping(value = { "edit-agency-{agencyname}" }, method = RequestMethod.POST)
	public String updateAgency(@ModelAttribute("agencyForm") @Valid AppAgency agencyForm, BindingResult bindingResult,
			Model model, @PathVariable String agencyname) {
		agencyeditValidator.validate(agencyForm, bindingResult);
		if (bindingResult.hasErrors()) {
			return "agencyedit";
		}

		agencyService.updateAgency(agencyForm);

		model.addAttribute("success", "Agency " + agencyForm.getAgencyname() + " updated successfully");
		return "success";
	}
	
	
	@RequestMapping(value = { "view-agency-{agencyname}" }, method = RequestMethod.GET)
	public String viewAgency(@PathVariable String agencyname, Model model) {
		AppAgency agency = agencyService.findByAgencyname(agencyname);
		model.addAttribute("agencyForm", agency);
		return "agencyview";
	}

	
	

	@RequestMapping(value = { "delete-agency-{agencyname}" }, method = RequestMethod.GET)
	public String deleteAgency(@PathVariable String agencyname) {
		agencyService.deleteAgencyByAgencyname(agencyname);
		return "redirect:agencylist";
	}

	 
	  private String getPrincipal() {
	        String agencyName = null;
	        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

	        if (principal instanceof UserDetails) {
	            agencyName = ((UserDetails) principal).getUsername();
	        } else {
	            agencyName = principal.toString();
	        }
	        return agencyName;
	    }

	    public String getTimeStamp() {
	        TimeZone mytimeZone = TimeZone.getTimeZone("EST");
	        Calendar calendar = Calendar.getInstance(mytimeZone);
	        SimpleDateFormat simpleDateFormat
	                = new SimpleDateFormat("EE MMM dd HH:mm:ss zzz yyyy", Locale.US);
	        simpleDateFormat.setTimeZone(mytimeZone);
	        String setTimeStamp = simpleDateFormat.format(calendar.getTime());
	        return setTimeStamp;
	    }

}
