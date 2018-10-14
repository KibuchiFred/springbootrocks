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
import com.spring.boot.rocks.model.AppProgramarea;
import com.spring.boot.rocks.repository.AgencyRepository;
import com.spring.boot.rocks.repository.ProgramareaRepository;
import com.spring.boot.rocks.repository.RoleRepository;
import com.spring.boot.rocks.service.ProgramareaService;
import com.spring.boot.rocks.validator.ProgramareaEditValidator;
import com.spring.boot.rocks.validator.ProgramareaAddValidator;

@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class ProgramAreaController {
	@Autowired
	private ProgramareaService programareaService;

	@Autowired
	private ProgramareaAddValidator programareaaddValidator;

	@Autowired
	private ProgramareaEditValidator programareaeditValidator;

	@Autowired
	private AgencyRepository agencyRepo;

	@ModelAttribute("appAgency")
	public List<AppAgency> initializeAgencies() {
		return (List<AppAgency>) agencyRepo.findAll();
	}

	@RequestMapping(value = { "programarealist" }, method = RequestMethod.GET)
	public String listProgramareas(ModelMap model) {
		List<AppProgramarea> programareas = programareaService.findAllProgramareas();

		model.addAttribute("programareas", programareas);

		return "programarealist";
	}

	@RequestMapping(value = "programarearegistration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("programareaForm", new AppProgramarea());

		return "programarearegistration";
	}

	@RequestMapping(value = "programarearegistration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("programareaForm") AppProgramarea programareaForm,
			BindingResult bindingResult, Model model) {
		programareaaddValidator.validate(programareaForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "programarearegistration";
		}

		programareaService.save(programareaForm);

		model.addAttribute("success", "Programarea " + programareaForm.getProgramareaname() + " created successfully");
		return "success";

	}

	@RequestMapping(value = { "edit-programarea-{programareaname}" }, method = RequestMethod.GET)
	public String editProgramarea(@PathVariable String programareaname, Model model) {
		AppProgramarea programarea = programareaService.findByProgramareaname(programareaname);
		model.addAttribute("programareaForm", programarea);
		model.addAttribute("edit", true);
		return "programarearegistration";
	}

	@RequestMapping(value = { "edit-programarea-{programareaname}" }, method = RequestMethod.POST)
	public String updateProgramarea(@ModelAttribute("programareaForm") @Valid AppProgramarea programareaForm,
			BindingResult bindingResult, Model model, @PathVariable String programareaname) {
		programareaeditValidator.validate(programareaForm, bindingResult);
		if (bindingResult.hasErrors()) {
			return "programarearegistration";
		}

		programareaService.updateProgramarea(programareaForm);

		model.addAttribute("success", "Programarea " + programareaForm.getProgramareaname() + " updated successfully");
		return "success";
	}

	@RequestMapping(value = { "view-programarea-{programareaname}" }, method = RequestMethod.GET)
	public String viewProgramarea(@PathVariable String programareaname, Model model) {
		AppProgramarea programarea = programareaService.findByProgramareaname(programareaname);
		model.addAttribute("programareaForm", programarea);
		return "programareaview";
	}

	@RequestMapping(value = { "delete-programarea-{programareaname}" }, method = RequestMethod.GET)
	public String deleteProgramarea(@PathVariable String programareaname) {
		programareaService.deleteProgramareaByProgramareaname(programareaname);
		return "redirect:programarealist";
	}

	private String getPrincipal() {
		String programareaName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			programareaName = ((UserDetails) principal).getUsername();
		} else {
			programareaName = principal.toString();
		}
		return programareaName;
	}

	public String getTimeStamp() {
		TimeZone mytimeZone = TimeZone.getTimeZone("EST");
		Calendar calendar = Calendar.getInstance(mytimeZone);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EE MMM dd HH:mm:ss zzz yyyy", Locale.US);
		simpleDateFormat.setTimeZone(mytimeZone);
		String setTimeStamp = simpleDateFormat.format(calendar.getTime());
		return setTimeStamp;
	}

}
